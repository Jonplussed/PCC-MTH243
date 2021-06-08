#! /usr/bin/env Rscript

library(utils)

# Read in the COVID19 CSV.

covid19 <- read.csv('covid19.csv',
  header = TRUE,
  colClasses = c('Date','numeric','numeric')
)

# Determine x-bar, y-bar, SDx, SDy.

xDev <- sd(covid19$cases)
yDev <- sd(covid19$deaths)
xBar <- mean(covid19$cases)
yBar <- mean(covid19$deaths)

# Add the computed columns to our existing table.

covid19 <- within(covid19, zx <- (cases - xBar) / xDev)
covid19 <- within(covid19, zy <- (deaths - yBar) / yDev)
covid19 <- within(covid19, zx.zy <- zx * zy)

# Determine r.

r <- sum(covid19$zx.zy) / (nrow(covid19) - 1)

# Print a summary of the data.

cat(sprintf("%-6s = %.6f\n", "SDx", xDev))
cat(sprintf("%-6s = %.6f\n", "SDy", yDev))
cat(sprintf("%-6s = %.6f\n", "x-bar", xBar))
cat(sprintf("%-6s = %.6f\n", "y-bar", yBar))
cat(sprintf("%-6s = %.6f\n", "r", r))

# Create a scatterplot for visual examination

pdf(file = 'covid19.pdf')

plot(covid19$cases, covid19$deaths,
  main = "COVID19 Cases/Deaths in Oregon",
  xlab = "New Cases (One-Week Average)",
  ylab = "Death Toll Two Weeks Later (One-Week Average)"
)

dev.off()
