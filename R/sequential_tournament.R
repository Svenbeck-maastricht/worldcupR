tournament_seq <- function(teams){
  winner <- character(500)
  for (i in 1:500){
    winner[i] <- simulate_tournament(teams)$winner
  }
  return(winner)
}
