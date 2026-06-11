library(microbenchmark)
library(foreach)
library(doParallel)

tournament_par <- function(teams){
  winner <- character(500)
  foreach (i = 1:500, .combine = c, .export = c("simulate_tournament", "simulate_match", "team_summary", "worldcup_matches"), .packages = c("dplyr")) %dopar% {
    simulate_tournament(teams)$champion
  }
}
