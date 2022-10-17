#!/usr/bin/env Rscript

suppressPackageStartupMessages(library(dplyr))

library(sxpdb)

compute_type_distribution <- function() {
  db <- open_db("data/cran_db", q=F)
  
  q_int <- query_from_plan(list(type = 3L))
  q_list <- query_from_plan(list(type = list(4)))
  q_logical <- query_from_plan(list(type = TRUE))
  q_real <- query_from_plan(list(type = 3))
  q_string <- query_from_plan(list(type = "hello world"))
  
  n_int <- nb_values_db(db, q_int)
  n_list <- nb_values_db(db, q_list)
  n_logical <- nb_values_db(db, q_logical)
  n_real <- nb_values_db(db, q_real)
  n_string <- nb_values_db(db, q_string)
  nb_values <- size_db(db)  
  
  df <- tribble(~type, ~n, ~pc,
                "Integer", n_int, n_int / nb_values * 100,
                "List", n_list, n_list / nb_values * 100,
                "Logical", n_logical, n_logical / nb_values * 100,
                "Others", (nb_values - (n_int + n_list + n_logical + n_string + n_real)) / nb_values * 100,
                "Real", n_real, n_real / nb_values * 100,
                "String", n_string, n_string / nb_values * 100
  )
  
  qs::qsave(df, "data/type-distribution.qs")
  
  return(df)
}

if(sys.nframe() == 0L) {
  compute_type_distribution()
}

