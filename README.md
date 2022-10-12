# Signatr Artifact

_We also provide an html-generated version of this README. If reading locally and not on github, we advise to use the html version._

The artifact contains the `signatr` tool, and the pipelines to create an R value database
and to fuzz R functions with the database to find type signatures. The fuzzing pipeline 
will generate the inputs for the `sle.Rmd` R markdown notebook. That notebook can then 
be rendered to get all the results (tables, figures) we use in the paper.

To use the artifact to reproduce the paper results, follow the steps:

1. Install the docker image (see [Install the docker image](#install-the-docker-image)).
2. Generate a database (see [Generate the database](#generate-the-database)) or use an already-uploaded one  (See [Use an uploaded database](#use-an-uploaded-database)).
3. Fuzz (see [Fuzzing](#fuzzing))
4. Render the notebook with the paper results (see [Rendering the paper results](#rendering-the-paper-results))

You can also the artifact to build a custom database and fuzz the signatures you want to in [Experimenting the tool])#experimenting-with-the-tool).

## Tool

The tool is packaged as an R library. It is hosted at [https://github.com/PRL-PRG/signatr](https://github.com/PRL-PRG/signatr) and uses the following building blocks:


- [sxpdb](https://github.com/PRL-PRG/sxpdb/): R value database
- [generatr](https://github.com/reallyTG/generatr): fuzzing utilities
- [contractr](https://github.com/PRL-PRG/contractr):type signature parsing and checking for R
- [argtracer](https://github.com/PRL-PRG/argtracer): trace R values and store them in the R value database.

The tool and its dependencies are pre-installed in a convenient Docker image.

## Install the docker image

You can:

- pull the docker image with `docker pull prlprg/sle22-signatr`, or
- build the docker image (it takes time!): 

```bash
cd docker-image
make
```

After installing the docker image, *make sure* to run all the following commands in a shell
inside the docker image (for Linux, macOS):

```bash
docker run --rm -ti -v $(pwd):/work -e USER_ID=$(id -u) -e GROUP_ID=$(id -g) -w /work prlprg/sle22-signatr bash
```

## Experimenting with the tool

Run the custom R interpreter (possibly inside the docker image).
In the following listingsm `$` indicates the shell and `>`denotes the R REPL.

```bash
R version 4.0.2 (2020-06-22) -- "Taking Off again"
...

> library(signatr)
```

### Database

To generate a database of values, we need some code to run. One way is to extract it from an existing R package, for example `stringr`, which provides regexes:

```R
> extract_package_code("stringr", output_dir = "demo")
...
7 examples/str_detect.Rd.R examples
...
```

This will extract all the runnable snippets from the package documentation and tests into the given directory. For example:

```bash
$ cat demo/examples/str_detect.Rd.R
...
fruit <- c("apple", "banana", "pear", "pinapple")
str_detect(fruit, "a")
str_detect(fruit, "^a")
...
```

The database generation is also automated in the `pipeline-dbgen` directory in the artifact, and handles there tracing on multiple files and merging the results. See [Generate the database](#generate-the-database) for more details.

### Fuzzing

Once the database is ready, we can start fuzzing the `str_detect` function:

```R
R <- quick_fuzz("stringr::str_detect", "demo.sxpdb", budget = 100, action = "infer")

    started a new runner:PROCESS 'R', running, pid 4157
    fuzzing stringr:::str_detect [======] 100/100 (100%) 39s
    stopped runner:PROCESS 'R', running, pid 4157
```

## Use an uploaded database

Databases are huge, several hundreds of GB for 400 packages, so we provide a link to download it.

## Generate the database

The database generation uses [targets](https://docs.ropensci.org/targets/) to orchestrate the pipeline.

The database for the SLE paper is obtained by tracing 400 packages in `data/packages.txt`.

To start tracing, after opening an R session and specifying an adequate number of parallel workers:

```R
targets::tar_make_future(workers = 64)
```

The extracted code of the packages will be in `data/extracted-code`. The resulting database will be generated as `data/sxpdb/cran_db`. It will also output a call id companion file in `data/callids.csv`.
Depending on your machine, the generation of the database for the 400 packages can take from a few hours to a few days.

You can change `packages.txt` to include less packages. For instance, `packages-4.txt` includes 2 huge and common R packages, `dplyr` and `ggplot2`. We provide pre-extracted code for a few packages already, including `stringr`, `dplyr`, and `ggplot2`.

## Fuzzing

```bash
./run-fuzz
```

## Rendering the paper results

We just have to render the RMkardown file. It will output an `experiment-uf.tex` file with macros for 
all the experimental values in the paper, and pdf files for the figures of the paper.

```bash
R -e 'rmarkdown::render("sle.Rmd")'
```




