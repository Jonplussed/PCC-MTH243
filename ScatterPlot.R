ScatterPlot <- setRefClass("ScatterPlot",
  fields = list(
    frame = "data.frame",
    xBar  = "numeric",
    yBar  = "numeric",
    xDev  = "numeric",
    yDev  = "numeric",
    r     = "numeric"
  ),
  methods = list(
    initialize = function(xs = c(), ys = c()) {
      frame <<- data.frame(x = xs, y = ys)
    },
    solve = function() {
      xDev <<- sd(frame$x)
      yDev <<- sd(frame$y)
      xBar <<- mean(frame$x)
      yBar <<- mean(frame$y)

      frame <<- within(frame, zx <- (x - xBar) / xDev)
      frame <<- within(frame, zy <- (y - yBar) / yDev)
      frame <<- within(frame, zx.zy <- zx * zy)

      r <<- sum(frame$zx.zy) / (nrow(frame) - 1)

      .self
    },
    bestFit = function(x) {
      r * (yDev / xDev) * (x - xBar) + yBar
    }
  )
)
