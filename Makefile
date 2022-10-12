dbgen:
	cd pipeline-dbgen 
	R -e 'targets::tar_make_future(workers = 64)'

fuzz:
	./create-corpus.R && ./run-fuzz && ./fix-fuzz-rdb && ./merge-traces.R

type:
	./run-types.sh

render:
	R --slave --quiet -e 'rmarkdown::render("sle.Rmd")'

all: dbgen fuzz type render

.PHONY: dbgen fuzz render type  all