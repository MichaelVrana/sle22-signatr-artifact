#!/bin/bash

OUTPUT=data/types
INPUT=data/fuzz
JOBS=${JOBS:-16}

mkdir -p "$OUTPUT"

filter() {
  while read -r line; do
    if [[ ! -f "$OUTPUT/$(basename $line)" ]]; then
      echo $line
    fi
  done
}

find $INPUT -maxdepth 1 -type f | \
  filter | \
  parallel \
    --results "data/run-type.csv" \
    --jobs $JOBS \
    --bar \
    ./type.R '{1}'
