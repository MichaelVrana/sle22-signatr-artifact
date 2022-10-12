library(dplyr)


### Name: explain
### Title: Explain details of a tbl
### Aliases: explain show_query

### ** Examples

## No test: 
##D if (require("dbplyr")) {
##D 
##D lahman_s <- lahman_sqlite()
##D batting <- tbl(lahman_s, "Batting")
##D batting %>% show_query()
##D batting %>% explain()
##D 
##D # The batting database has indices on all ID variables:
##D # SQLite automatically picks the most restrictive index
##D batting %>% filter(lgID == "NL" & yearID == 2000L) %>% explain()
##D 
##D # OR's will use multiple indexes
##D batting %>% filter(lgID == "NL" | yearID == 2000) %>% explain()
##D 
##D # Joins will use indexes in both tables
##D teams <- tbl(lahman_s, "Teams")
##D batting %>% left_join(teams, c("yearID", "teamID")) %>% explain()
##D }
## End(No test)



