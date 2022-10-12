#!/bin/bash

OUTPUT=data/baseline
CODE=../data/extracted-code
JOBS=${JOBS:-16}

mkdir -p "$OUTPUT"

./find-runnable-code.R | \
  parallel \
    --results "$OUTPUT/run.csv" \
    --jobs $JOBS \
    --bar \
    ./argtrace-r-file.sh '{1}'
