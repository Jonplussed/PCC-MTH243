# functions related to Significance Testing

thetaPhat <- function(n, p) {
  sqrt(p * (1-p) / n)
}

zStat <- function(p, n, phat = 0.25) {
  (phat - p) / thetaPhat(n, p)
}

pNotEqual <- function(p, n, phat) {
  2 * pnorm(zStat(p, n, phat))
}
