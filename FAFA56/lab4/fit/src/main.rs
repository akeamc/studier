use nalgebra::DVector;
use plotters::prelude::*;
use serde::{Deserialize, Serialize};
use varpro::{
    prelude::*,
    solvers::levmar::{LevMarProblemBuilder, LevMarSolver},
};

#[derive(Debug, Serialize, Deserialize, PartialEq, PartialOrd)]
#[serde(deny_unknown_fields)]
struct Record {
    #[serde(rename = "V (V)")]
    V: f64,
    #[serde(rename = "I (A)")]
    I: f64,
}

fn exp(xs: &DVector<f64>, k: f64) -> DVector<f64> {
    xs.map(|x| (-k * x.sqrt()).exp())
}

fn exp_dk(xs: &DVector<f64>, k: f64) -> DVector<f64> {
    xs.map(|x| -x * (-k * x.sqrt()).exp())
}

fn main() -> anyhow::Result<()> {
    let mut data = csv::ReaderBuilder::new()
        .delimiter(b'\t')
        .from_path("../C.tsv")
        .unwrap()
        .into_deserialize::<Record>()
        .collect::<Result<Vec<_>, csv::Error>>()
        .unwrap();

    data.sort_unstable_by(|a, b| a.partial_cmp(b).unwrap());

    let x = data.iter().map(|r| r.V).collect::<Vec<_>>();
    let y = data.iter().map(|r| r.I).collect::<Vec<_>>();

    let &x_min = x.first().unwrap();
    let &x_max = x.last().unwrap();
    let &y_max = y.iter().max_by(|a, b| a.total_cmp(b)).unwrap();

    let model = SeparableModelBuilder::<f64>::new(&["k"])
        .function(&["k"], exp)
        .partial_deriv("k", exp_dk)
        .independent_variable(DVector::from_vec(x))
        .initial_parameters(vec![0.1])
        // build the model
        .build()
        .unwrap();

    let problem = LevMarProblemBuilder::new(model)
        .observations(DVector::from_vec(y))
        .build()
        .unwrap();

    let fit_result = LevMarSolver::default().fit(problem).unwrap();

    let alpha = fit_result.nonlinear_parameters();
    let coeff = fit_result.linear_coefficients().unwrap();

    println!("alpha: {alpha}");
    println!("coeff: {coeff}");

    let k = alpha[0];
    let C = coeff[0];

    let root = BitMapBackend::new("0.png", (640, 480)).into_drawing_area();
    root.fill(&WHITE)?;
    let mut chart = ChartBuilder::on(&root)
        .margin(5)
        .x_label_area_size(30)
        .y_label_area_size(30)
        .build_cartesian_2d((x_min as f32)..(x_max as f32), 0f32..(y_max as _))?;

    chart.configure_mesh().draw()?;

    chart
        .draw_series(LineSeries::new(
            data.iter().map(|r| (r.V as f32, r.I as f32)),
            &RED,
        ))?
    //  .legend(|(x, y)| PathElement::new(vec![(x, y), (x + 20, y)], &RED))
    ;

    const SAMPLES: usize = 200;

    chart.draw_series(LineSeries::new(
        (0..SAMPLES).map(|i| {
            let x = (x_max - x_min) * (i as f64 / SAMPLES as f64);
            (x as f32, C as f32 * (-k * x).exp() as f32)
        }),
        &BLUE,
    ))?;

    chart
        .configure_series_labels()
        .background_style(&WHITE.mix(0.8))
        .border_style(&BLACK)
        .draw()?;

    root.present()?;

    Ok(())
}
