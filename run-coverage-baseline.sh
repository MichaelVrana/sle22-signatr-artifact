#!/bin/bash

OUTPUT=data/baseline-coverage
INPUT=data/baseline
JOBS=${JOBS:-16}

mkdir -p "$OUTPUT"

export R_LIBS=data/library

find $INPUT -maxdepth 1 -name '*.traces' | \
  parallel \
    --results "data/run-baseline-coverage.csv" \
    --jobs $JOBS \
    --bar \
    ./coverage.R '{1}' "$OUTPUT/{1/.}.coverage" "$INPUT/{1/.}.sxpdb"
