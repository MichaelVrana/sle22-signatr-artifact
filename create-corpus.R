#!/usr/bin/env Rscript

library(runr)

packages <- trimws(readLines("data/packages.txt"), "both")
dest_dir <- "data/sources"
lib_dir <- "data/library"
output_dir <- "data/extracted-code"

installed <- install_cran_packages(packages, lib_dir = lib_dir, dest_dir = dest_dir, check = FALSE, force = FALSE, n_cpus = 1)

installed_check <- installed.packages(lib.loc = lib_dir)[, "Package"]
installed <- intersect(installed$package, installed_check)

cat("Installed new packages: ", paste(installed, sep=", "), "\n")

code <- pbapply::pblapply(
    installed,
    function(x) extract_package_code(x, output_dir = file.path(output_dir, x))
)

cat("Extracted code:\n")
print(code)

cat("Extracting metadata:\n")
metadata <- pbapply::pblapply(installed, function(x) metadata_functions(x, lib_dir))
metadata <- tibble::as_tibble(do.call(rbind, metadata))
readr::write_csv(metadata, "data/corpus.csv")
print(metadata)
