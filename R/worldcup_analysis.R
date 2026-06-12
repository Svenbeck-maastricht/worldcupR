library(doParallel)
library(foreach)
library(ggplot2)
library(microbenchmark)

source("R/simulate_tournament.R")
source("R/sequential_tournament.R")
source("R/parallel_tournament.R")
source("R/team_summary.R")
source("R/simulate_match.R")

#Need to manually define our top 8 teams on which we simulate
top8_teams <- c("Brazil", "Germany", "France", "Netherlands", "Argentina", "Spain", "England", "Portugal")


#Specify clusters and stop clusters for parallel computing - led to issues when specifying inside the function itself
cl <- makeCluster(3)
registerDoParallel(cl)
winner_par <- tournament_par(top8_teams)
stopCluster(cl)

#sequential winner for comparison
winner_seq <- tournament_seq(top8_teams)

table(winner_par)
table(winner_seq)

#benchmark parallel vs sequential
cl <- makeCluster(3)
registerDoParallel(cl)

bench1 <- microbenchmark::microbenchmark(
  tournament_par(top8_teams),
  tournament_seq(top8_teams),
  times =5
)
stopCluster(cl)

print(bench1)

#create the porbability tables
table_prob <- prop.table(table(winner_par))
df_winner <- as.data.frame(table_prob)

#plot the winner probabilities

ggplot(df_winner,
       aes(x= winner_par, y= Freq, fill=winner_par)) +
  geom_col() +
  labs(
    title="Win Probability",
    x= "Team",
    y= "Win probability"
    ) +
  theme_minimal()
