# Signatr Artifact

_We also provide an html-generated version of this README. If reading locally and not on github, we advise to use the html version._

The artifact contains the `signatr` tool, and the pipelines to create an R value database
and to fuzz R functions with the database to find type signatures. The fuzzing pipeline 
will generate the inputs for the `sle.Rmd` R markdown notebook. That notebook can then 
be rendered to get all the results (tables, figures) we use in the paper.

To use the artifact to reproduce the paper results, follow the steps:

1. Install the docker image (see [Install the docker image](#install-the-docker-image)) or install locally (see [Installing locally](#installing-locally)). We strongly advise the first option.
2. Generate a database (see [Generate the database](#generate-the-database)) or use an already-uploaded one  (See [Use an uploaded database](#use-an-uploaded-database)).
3. Fuzz (see [Fuzzing](#fuzzing))
4. Render the notebook with the paper results (see [Rendering the paper results](#rendering-the-paper-results))

You can also the artifact to build a custom database and fuzz the signatures you want to in [Experimenting the tool])#experimenting-with-the-tool).

## Tool

The tool is hosted at [https://github.com/PRL-PRG/signatr](https://github.com/PRL-PRG/signatr) and uses the following building blocks:


- [sxpdb](https://github.com/PRL-PRG/sxpdb/): R value database
- [generatr](https://github.com/reallyTG/generatr): fuzzing utilities
- [contractr](https://github.com/PRL-PRG/contractr):type signature parsing and checking for R
- [argtracer](https://github.com/PRL-PRG/argtracer): trace R values and store them in the R value database.

## Install the docker image

You can:

-  pull the docker image with `docker pull prlprg/sle22-signatr`, or
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

## Installing locally 

1. `argtracer` requires a custom R interpreter with tracing hooks. For R 4.0.2, you can 
install it from [here](https://github.com/PRL-PRG/R-dyntrace/tree/r-4.0.2). 
Add the resulting `R` binary in `bin` in your `PATH` and run the installation.


2. Install some R dependencies: 

```bash
R -e 'install.packages(readLines("/tmp/dependencies.txt"), repos="cran.r-project.org")'
```

3. `Bison`: `contractr` requires a non-R dependency that you have to install manually: [https://github.com/PRL-PRG/tastr](https://github.com/PRL-PRG/tastr) `tastr` needs Bison 3, for instance, [Bison 3.5.4](https://ftp.gnu.org/gnu/bison/bison-3.5.4.tar.gz)
4. `tastr`:

```bash
git clone https://github.com/PRL-PRG/tastr && make -C tastr build
```

5. `injectr`: 

```bash 
git clone https://github.com/PRL-PRG/injectr &&  make -C injectr install
```

6. `contractr` itself:

```bash
git clone https://github.com/PRL-PRG/contractr && make -C contractr install
```

7. `sxpdb` uses C++17 and requires at least GCC 8 to compile.

```bash
git clone https://github.com/PRL-PRG/sxpdb && make -C sxpdb install
```

8. `argtracer`:

```bash
git clone https://github.com/PRL-PRG/argtracer && make -C argtracer install
```

9. `generatr`:

```bash
git clone https://github.com/reallyTG/generatr &&  make -C generatr install
```

10. `runr`:

```bash
RUN git clone https://github.com/PRL-PRG/runr &&  make -C runr install
```

11. `signatr`:

```bash
git clone https://github.com/PRL-PRG/signatr && make -C signatr install
```

12. Install GNU parallel

```bash
mkdir parallel && \
  cd parallel && \
  curl http://ftp.gnu.org/gnu/parallel/parallel-latest.tar.bz2 | tar -xjf- --strip 1 && \
  ./configure && \
  make install && \
```


## Use an uploaded database

Databases are huge, several hundreds of GB for 400 packages, so we provide a link to download it.

## Generate the database

The database generation uses [targets](https://docs.ropensci.org/targets/) to orchestrate the pipeline.

To generate databases, you need to install some additional dependencies, including `targets`. Make sure to use the custom R interpreter `R-dyntrace`:

```bash
R -e 'install.packages(c("targets", "readr", "cvor", "future", "future.call"))'
```

The database for the SLE paper is obtained by tracing 400 packages in `data/packages.txt`.

To start tracing, after opening an R session and specifying an adequate number of parallel workers:

```R
targets::tar_make_future(workers = 64)
```

The resulting database will be generated as `data/sxpdb/cran_db`.
It will also output a call id companion file in `data/callids.csv`.

## Fuzzing

## Rendering the paper results

## Experimenting with the tool


The scripts:

argtrace-r-file.sh: 
cluster:
coverage.R:
experiment-uf.tex:
find-runnable-code.R:
fix-fuzz-rdb.R:
fuzz.R:
latextags.R:
merge-traces-min.R:
merge-traces.R:
qcat.R:
run-baseline.sh
run-coverage-baseline.sh
run-coverage-fuzz.sh
run-fuzz.sh
run-type-baseline.sh
run-type.sh
sle.Rmd
traces-baseline.R
type-baseline.R: takes call ids and change the structure
type.R: infers type signature
uf-call-signatures.pdf
