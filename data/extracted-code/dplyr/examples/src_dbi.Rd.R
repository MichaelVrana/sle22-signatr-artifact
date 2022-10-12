library(dplyr)


### Name: src_dbi
### Title: Source for database backends
### Aliases: src_dbi src_mysql src_postgres src_sqlite
### Keywords: internal

### ** Examples

if (require(dbplyr, quietly = TRUE)) {

con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
copy_to(con, mtcars)

# To retrieve a single table from a source, use `tbl()`
mtcars <- con %>% tbl("mtcars")
mtcars

# You can also use pass raw SQL if you want a more sophisticated query
con %>% tbl(sql("SELECT * FROM mtcars WHERE cyl == 8"))
}



