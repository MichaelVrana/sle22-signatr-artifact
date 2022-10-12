dbgen:
	cd pipeline-dbgen 
	R -e 'targets::tar_make_future(workers = 64)'

fuzz:
	./run-fuzz

render:
	R -e 'rmarkdown::render("sle.Rmd")'