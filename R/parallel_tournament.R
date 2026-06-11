library(microbenchmark)
library(foreach)
library(doParallel)

tournament_par <- function(teams){
  winner <- character(500)
  foreach (i = 1:500, .combine = c) %dopar% {
    simulate_tournament(teams)$champion
  }
}

cl <- makeCluster(3)
registerDoParallel(cl)
