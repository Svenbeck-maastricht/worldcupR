#' Sequential Tournament Simulation
#'
#' @param teams  character vector of 8 teams
#'
#' @return character vector of winners
#' @export
#'
#' @examples
#' top8_teams <- c("Brazil", "Germany", "France", "Netherlands", "Argentina", "Spain", "England", "Portugal")
#' tournament_seq(top8_teams)
tournament_seq <- function(teams){
  winner <- character(500)
  for (i in 1:500){
    winner[i] <- simulate_tournament(teams)$champion
  }
  return(winner)
}


