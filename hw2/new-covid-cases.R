#! /usr/bin/env Rscript

cases <- read.csv('../new-covid-cases.csv',
  header = TRUE,
  colClasses = c(
    rep('NULL', 302),               # Ignore the first 302 entries
    c('numeric'),                   # 01 Jan 2021
    rep('NULL', 89),                # Ignore dates between 01 Jan and 01 Apr
    c('numeric')                    # 01 Apr 2021
  )
)

boxplot.stats(cases$X2021.01.01)
boxplot.stats(cases$X2021.04.01)

