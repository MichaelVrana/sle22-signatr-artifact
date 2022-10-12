#!/bin/bash

BUDGET=${BUDGET:-100}
FUNS=${FUNS:-100}
BASE_DIR=data/fuzz
CORPUS=${1:-data/corpus.csv}
JOBS=${JOBS:-16}

if [ -f cluster ]; then
  EXTRA_ARGS="--sshloginfile cluster"
fi

R --slave --quiet -e 'x<-read.csv("'$CORPUS'"); x<-x[sample(1:nrow(x), '$FUNS'),]; cat(trimws(paste0(x$pkg_name, "::", x$fun_name)), sep="\n")' | \
  parallel \
    --results "data/run-fuzz.csv" \
    --jobs $JOBS \
    --bar \
    --workdir $(pwd) \
    --timeout 90m \
    ./fuzz.R '{1}' "$BUDGET"
