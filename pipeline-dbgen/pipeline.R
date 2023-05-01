library(pipelinr)
library(readr)

source("R/functions.R")

read_unique_lines <- function(filename) unique(trimws(read_lines(filename)))

packages_file <- "../data/packages.txt"
blacklist_file <- "blacklist.txt"
db_blacklist_file <- "db-blacklist.txt"

packages_to_install <- read_unique_lines(packages_file)
blacklist <- read_unique_lines(blacklist_file)
db_blacklist <- read_unique_lines(db_blacklist_file)

gnu_parallel_executor <- make_gnu_parallel_executor()

make_pipeline(
    #
    packages_to_run = stage(function() {
        install_cran_packages(packages_to_install, lib_path, NULL)
    }),
    #
    extracted_files = stage(
        inputs = stage_inputs(
            package = mapped(packages_to_run)
        ),
        body = function(package) {
            extract_code_from_package(package, lib_path, extracted_output)
        },
        executor = gnu_parallel_executor
    ),
    #
    individual_files = stage(
        inputs = stage_inputs(
            extracted_files = collect(extracted_files) %>% unlist()
        ),
        body = function(extracted_files) {
            remove_blacklisted(extracted_files, blacklist)
        }
    ),
    #
    traced_results = stage(
        inputs = stage_inputs(
            file = mapped(individual_files)
        ),
        body = function(file) {
            trace_file(file, lib_path, output_path)
        }
    ),
    #
    traced_res = stage(function(traced_results) fix_traced_res(traced_results)),
    #
    db_paths = stage(
        inputs = stage_inputs(
            traced_res = collect_df(traced_res)
        ),
        body = function(traced_res) {
            remove_blacklisted(traced_res$db_path, db_blacklist, only_real_paths = TRUE)
        }
    ),
    #
    merged_db = stage(function(db_paths) merge_db(db_paths, sxpdb_output))
)
