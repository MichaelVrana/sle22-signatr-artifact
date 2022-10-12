#!/bin/bash

OUTPUT=data/baseline
CODE=../data/extracted-code
JOBS=${JOBS:-16}

mkdir -p "$OUTPUT"

./find-runnable-code.R | \
  parallel \
    --results "data/run-baseline.csv" \
    --jobs $JOBS \
    --bar \
    ./trace.sh '{1}'
