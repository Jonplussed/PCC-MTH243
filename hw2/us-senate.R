#! /usr/bin/env Rscript

# Read in the "entered_office" date column in our dataset CSV. See:
# https://raw.githubusercontent.com/CivilServiceUSA/us-senate/35ac3ac02be3fce39a856fe9a265f302ce1773f8/us-senate/data/us-senate.csv

senate <- read.csv(
  '../us-senate.csv',
  header = TRUE,
  colClasses = c(rep('NULL',28), c('Date','NULL'))
)

# Calculate the years in office per senator.

today <- Sys.Date()
yearsInOffice <- sapply(senate$entered_office, function(x) {
  as.integer(today - x)/365.0
})

# Determine appropriate histogram parameters.

binSize <- 6
binCount <- ceiling(max(yearsInOffice) / binSize)
xMin <- 0
xMax <- binCount * binSize

# Generate the histogram.

hist(yearsInOffice,
  breaks = seq(xMin, xMax, by=binSize),
  plot = FALSE
)
