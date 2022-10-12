#!/bin/bash

OUTPUT=data/coverage
INPUT=data/fuzz
JOBS=${JOBS:-16}

mkdir -p "$OUTPUT"

export R_LIBS=data/library

find $INPUT -maxdepth 1 -name "*::*" | \
  parallel \
    --results "data/run-coverage.csv" \
    --jobs $JOBS \
    --bar \
    ./coverage.R '{1}' "$OUTPUT/{1/.}.coverage" "data/cran_db"
