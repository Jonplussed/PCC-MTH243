#! /usr/bin/env Rscript

# Sitting US senator data from
# https://raw.githubusercontent.com/CivilServiceUSA/us-senate/35ac3ac02be3fce39a856fe9a265f302ce1773f8/us-senate/data/us-senate.csv

# Read in US Senate data CSV for party and gender
senate <- read.csv('../us-senate.csv', colClasses = c(
  rep('NULL',14),
  c('character'), # party
  rep('NULL',8),
  c('character'), # gender
  rep('NULL',27)
))

# Create contingency table for data
table(senate)

# OUTPUT:

#                gender
#  party         female male
#  democrat        16   32
#  independent      0    2
#  republican       8   42
