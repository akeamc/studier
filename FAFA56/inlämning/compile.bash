#!/bin/bash

ROOT=$(dirname "$0")
GREEN="\e[32m"
ENDCOLOR="\e[0m"

for f in $ROOT/*/*.typ; do
  LV=$(basename $(dirname $f))
  echo -e "${GREEN}[${LV}]${ENDCOLOR} Compiling $(basename $f)"
  typst c "$f" --root $ROOT
done
