from manim import *


class PressureWave(Scene):
    def construct(self):

        grid = NumberPlane()
        self.add(grid)
        self.play(Create(grid, run_time=0.1, lag_ratio=0.1))

        # create dots
        group = VGroup()
        anims = []

        time = ValueTracker(0)

        for x in np.linspace(-8, 8, 17):
            for y in np.linspace(-4, 4, 9):

                def update_dot(dot: Dot):
                    dist = np.sqrt(x**2 + y**2)
                    dot.set_y(np.sin(dist - time.get_value()) + y)
                    dot.set_y(y)
                    dot.set_x(x)

                dot = Dot([x, y, 0], color=RED)
                dot.add_updater(update_dot)
                group.add(dot)
                anims.append(Create(dot))

        self.play(LaggedStart(anims, run_time=3, lag_ratio=0.1))

        self.play(time.animate.set_value(2 * PI), rate_func=linear, run_time=3)


class Intro(Scene):
    def construct(self):
        text = Tex("Åke Amcoff").scale(2).center()
        self.add(text)
        self.play(Write(text, run_time=3))
        self.wait()
        self.play(FadeOut(text, lag_ratio=0.1))
        self.wait()

        quote = Tex('"Det är bara det att jag räknar snabbare än vad du gör."').shift(
            UP * 3
        )
        self.add(quote)
        self.play(FadeIn(quote))
        self.wait()
        attribution = Tex("– Tomas Persson", color=YELLOW).shift(UP * 2.25)
        self.add(attribution)
        self.play(Write(attribution, run_time=3))
        self.wait()

        self.play(FadeOut(quote), FadeOut(attribution))


class SineWaves(Scene):
    def get_axes(self, x_range=(0, 8, 1), y_range=(-1, 1, 0.5), width=11, height=1.25):
        ax = Axes(x_range, y_range, x_length=width, y_length=height, tips=False)
        # result.add_coordinate_labels(font_size=16, buff=0.15)
        return ax

    def get_wave(
        self,
        axes: Axes,
        func_name="f",
        func_name_coords=(0.5, 1.25),
        A=1.0,
        omega=PI,
        phi=0.0,
        color=YELLOW,
        A_color=RED,
        omega_color=GOLD,
        phi_color=PINK,
        index="",
    ):
        A_tracker = ValueTracker(A)
        omega_tracker = ValueTracker(omega)
        phi_tracker = ValueTracker(phi)
        trackers = Group(A_tracker, omega_tracker, phi_tracker)

        get_A = lambda: A_tracker.get_value()
        get_omega = lambda: omega_tracker.get_value()
        get_phi = lambda: phi_tracker.get_value()

        A_tex = rf"A_{{{index}}}"
        omega_tex = rf"\omega_{{{index}}}"
        phi_tex = rf"\phi_{{{index}}}"

        t2c = {
            A_tex: A_color,
            omega_tex: omega_color,
            phi_tex: phi_color,
        }

        labels = VGroup(
            # axes.get_axis_labels(Tex(r"t (\text{s})").scale(0.5), Tex("y").scale(0.5)),
            always_redraw(
                lambda: VGroup(
                    *(
                        MathTex(
                            f"{tex}={tracker.get_value():.2f}",
                            font_size=24,
                            tex_to_color_map=t2c,
                        )
                        for tex, tracker in [
                            (A_tex, A_tracker),
                            (omega_tex, omega_tracker),
                            (phi_tex, phi_tracker),
                        ]
                    )
                )
                .arrange(DOWN, aligned_edge=RIGHT)
                .next_to(axes, LEFT, MED_LARGE_BUFF)
            ),
        )

        def func(x: float):
            return get_A() * np.sin(get_omega() * x + get_phi())

        wave = always_redraw(lambda: axes.plot(func, color=color))

        name_label = MathTex(
            Rf"{func_name} = {A_tex} \sin({omega_tex} t + {phi_tex})",
            tex_to_color_map=t2c,
            font_size=36,
        )
        name_label.move_to(axes.c2p(*func_name_coords), DL)
        labels.add(name_label)

        result = Group(wave, trackers, labels)
        result.axes = axes
        result.func = func
        result.wave = wave
        result.trackers = trackers
        result.labels = labels

        return result

    def get_wave_change_anim(self, wave, param, value):
        i = ["A", "omega", "phi"].index(param)
        return wave.trackers[i].animate.set_value(value)

    def set_wave_param(self, wave, param, value, run_time=2.0):
        self.play(self.get_wave_change_anim(wave, param, value), run_time=run_time)

    def change_all_params(self, wave, A, omega, phi, run_time=2.0):
        self.play(
            [
                self.get_wave_change_anim(wave, "A", A),
                self.get_wave_change_anim(wave, "omega", omega),
                self.get_wave_change_anim(wave, "phi", phi),
            ],
            run_time=run_time,
        )

    def construct(self):
        axes1, axes2, axes3 = all_axes = [self.get_axes() for _ in range(3)]
        for axes, y in zip(all_axes, [2.5, 0, -3.0]):
            axes.set_y(y)
            axes.to_edge(RIGHT)

        wave1 = self.get_wave(axes1, color=BLUE, func_name="f(t)", index="1")
        wave2 = self.get_wave(
            axes2, color=YELLOW, func_name="g(t)", index="2", omega=PI
        )

        self.add(axes1, wave1)
        self.play(
            FadeIn(axes1),
            Create(wave1[0]),
        )

        self.play(FadeIn(wave1[1]))

        self.set_wave_param(wave1, "omega", TAU)
        self.set_wave_param(wave1, "omega", PI / 2)
        self.wait()
        self.set_wave_param(wave1, "phi", PI)

        self.add(axes2)
        self.play(
            FadeIn(axes2),
            Create(wave2[0]),
        )
        self.add(wave2)
        self.play(
            Create(wave2[2]),
        )
        self.change_all_params(wave2, 0.75, 2 * PI, PI / 2)
        self.wait()

        wave3 = axes3.plot(lambda x: wave1.func(x) + wave2.func(x), color=GREEN)
        wave3_label = MathTex("f(t) + g(t)", font_size=36)
        wave3_label.move_to(axes3.c2p(0.5, 1.5), DL)

        axes3_copy = axes3.copy()

        self.add(axes3, axes3_copy)
        self.play(
            LaggedStart(
                TransformFromCopy(axes1, axes3),
                TransformFromCopy(axes2, axes3_copy),
                # TransformFromCopy(wave1.labels[2]["f(t)"], wave3_label["f(t)"]),
                # TransformFromCopy(wave2.labels[2]["g(t)"], wave3_label["+ g(t)"]),
                Create(wave3_label),
                lag_ratio=0.05,
            )
        )
        self.remove(axes3_copy)

        wave3_copy = wave3.copy()
        self.add(wave3, wave3_copy)

        self.play(
            TransformFromCopy(wave1[0], wave3),
            TransformFromCopy(wave2[0], wave3_copy),
        )
        self.wait()

        self.remove(wave3, wave3_copy)
        wave3 = always_redraw(
            lambda: axes3.plot(lambda x: wave1.func(x) + wave2.func(x), color=GREEN)
        )
        self.add(wave3)


        self.set_wave_param(wave1, "phi", PI / 2)
        self.wait()

        self.change_all_params(wave1, 0.5, PI, PI / 4)
        self.change_all_params(wave2, 0.5, PI, PI / 4)
        self.wait()

        phase_diff = always_redraw(lambda: MathTex(rf"\phi_1 - \phi_2 = {wave1.trackers[2].get_value() - wave2.trackers[2].get_value():.2f}").move_to(axes3.c2p(0.5, -1.5), DL))
        self.add(phase_diff)
        self.wait()

        self.set_wave_param(wave2, "phi", 9 * PI / 4)
        self.wait()
        self.set_wave_param(wave2, "phi", 5 * PI / 4)
        self.wait()