#! /usr/bin/env Rscript

acs_survey <- read.csv('acs_survey.csv', header = TRUE)
nba_standings <- read.csv('nba_standings.csv', header = TRUE)

# Create a dot chart of NBA team winnings.
pdf(file = 'nba_wins.pdf') # set chart file params
dotchart(nba_standings$W) # create chart
dev.off() # save chart file

# Create a stem-and-leaves chart of points/game.
stem(nba_standings$PS.G - 100)
