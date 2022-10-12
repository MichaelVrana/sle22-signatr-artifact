library(tab)


### Name: tabfreq
### Title: Create Frequency Table
### Aliases: tabfreq

### ** Examples

# Compare sex distribution by group
(freqtable1 <- tabfreq(Sex ~ Group, data = tabdata))

# Same as previous, but showing male row only and % (SE) rather than n (%)
(freqtable2 <- tabfreq(Sex ~ Group, data = tabdata,
                       cell = "col.percent", parenth = "se",
                       compress.binary = TRUE))





