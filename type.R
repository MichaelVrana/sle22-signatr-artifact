#!/usr/bin/env Rscript

traces_file <- commandArgs(trailingOnly = TRUE)[1]
fun_name <- basename(traces_file)
types <- signatr::traces_type(traces_file, signatr:::type_system_tastr, "data/cran_db")
types <- types[[fun_name]]
types <- subset(types, select=c(fun_name, id, signature))

if (length(types) > 0) {
    qs::qsave(types, file.path("data/types", basename(traces_file)))
}
