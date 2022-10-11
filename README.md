# Signatr Artifact

_We also provide an html-generated version of this README. If reading locally and not on github, we advise to use the html version._

The artifact contains the `signatr` tool, and the pipelines to create an R value database
and to fuzz R functions with the database to find type signatures. The fuzzing pipeline 
will generate the inputs for the `sle.Rmd` R markdown notebook. That notebook can then 
be rendered to get all the results (tables, figures) we use in the paper.

To use the artifact to reproduce the paper results, follow the steps:

1. Install the docker image (see {Building the docker image](#building-the-docker-image)) or install locally (see [Installing locally](#installing-locally)).
2. Generate a database (see [Generate the database](#generate-the-database)) or use an already-uploaded one  (See [Use an uploaded database](#use-an-uploaded-database)).
3. Fuzz (see [Fuzzing](#fuzzing))
4. Render the notebook with the paper results (see [Rendering the paper results](#rendering-the-paper-results))

You can also the artifact to build a custom database and fuzz the signatures you want to in [Experimenting yourself])#experimenting-yourself).

## Building the docker image

Go to the `docker-image` repository and do `make`.

## Installing locally 

TODO

## Generate the database

## Use an uploaded database

## Fuzzing

## Rendering the paper results

## Experimenting yourself

## 