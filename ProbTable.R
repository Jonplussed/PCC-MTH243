# A table of possible values and their probabilities, from which we can derive
# the mean (expected value), variance, and standard deviation.

ProbTable <- setRefClass("ProbTable",
  fields = list(
    frame = "data.frame",
    mean = "numeric",
    var = "numeric",
    stdev = "numeric"
  ),
  methods = list(
    initialize = function(x = c(), px = c()) {
      frame <<- data.frame(x = x, px = px)
      .self
    },
    expand = function() {
      frame <<- within(frame, x.px <- x * px)
      mean  <<- sum(frame$x.px)
      frame <<- within(frame, dev <- x - mean)
      frame <<- within(frame, dev2 <- dev^2)
      frame <<- within(frame, dev2.px <- dev2 * px)
      var   <<- sum(frame$dev2.px)
      stdev <<- sqrt(var)
    }
  )
)
