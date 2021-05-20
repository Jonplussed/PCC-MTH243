#! /usr/bin/env Rscript

# Initialize the lottery table
lottery <- data.frame(
  x = c(
    -2,
    2,
    5,
    98,
    49998,
    999998,
    141999998
  ),
  px = c(
    46136053/48700223,
    4805131/97400446,
    156800/48700223,
    14240/146100669,
    160/146100669,
    1/11238513,
    1/292201338
  )
)

# Calculate the probability of expected values as a new table column
lottery <- within(lottery, x.px <- x * px)

# Determine the expected value
sum(lottery$x.px)

