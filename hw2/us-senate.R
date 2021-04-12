#! /usr/bin/env Rscript

# Sitting US senator data from
# https://raw.githubusercontent.com/CivilServiceUSA/us-senate/35ac3ac02be3fce39a856fe9a265f302ce1773f8/us-senate/data/us-senate.csv

columns <- append(rep('NULL',28), c('Date','NULL'))
senate <- read.csv('us-senate.csv', colClasses = columns)
today <- Sys.Date()

yearsInOffice <- sapply(as.list(senate$entered_office), function(x) {
  as.integer(today - x)/365.0
})

pdf(file = 'years_in_office.pdf')
breaks <- seq(0,(ceiling(max(yearsInOffice)/6))*6,by=6)
hist(yearsInOffice, breaks = breaks, xlab = breaks)
dev.off()


# acs_survey <- read.csv('acs_survey.csv', header = TRUE)
# nba_standings <- read.csv('nba_standings.csv', header = TRUE)
# 
# # Create a dot chart of NBA team winnings.
# pdf(file = 'nba_wins.pdf') # set chart file params
# dotchart(nba_standings$W) # create chart
# dev.off() # save chart file
# 
# # Create a stem-and-leaves chart of points/game.
# stem(nba_standings$PS.G - 100)
