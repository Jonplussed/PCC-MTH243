acs_survey <- read.csv('acs_survey.csv', header = TRUE)
nba_standings <- read.csv('nba_standings.csv', header = TRUE)

# Create a dot chart of NBA team winnings.
dotchart(nba_standings$W)

# Create a stem-and-leaves chart of points/game.
stem(nba_standings$PS.G - 100)
