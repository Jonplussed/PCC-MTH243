# Functions related to Confidence Intervals

# The z-score of the rightward bound of the confidence interval.
zstar <- function(ci) {
  qnorm(ci + (1-ci) * .5)
}

# The margin of error for a giving CI and population size.
margin <- function(ci, n, phat = 0.5) {
  zstar(ci) * sqrt(phat * (1-phat) / n)
}

# The left and right percentile bounds of the confidence interval.
confInt <- function(ci, n, phat = 0.5) {
  m <- margin(ci, n, phat)
  c(phat - m, phat + m)
}

# The minimum population required for a given margin of error.
minPop <- function(ci, m, phat = 0.5) {
  phat * (1 - phat) * (zstar(ci) / m)^2
}
