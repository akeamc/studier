for f in */*.typ; do
  echo "Compiling $f"
  typst c "$f" --root .
done
