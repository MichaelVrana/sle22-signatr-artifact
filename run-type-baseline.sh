#!/bin/bash

OUTPUT=data/baseline-types
INPUT=data/baseline
JOBS=${JOBS:-16}

mkdir -p "$OUTPUT"

find $INPUT -maxdepth 1 -name '*.traces' | \
  parallel \
    --results "data/run-type-baseline.csv" \
    --jobs $JOBS \
    --bar \
    ./type-baseline.R '{1}'
