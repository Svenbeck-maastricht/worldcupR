library(microbenchmark)
library(foreach)
library(doParallel)

#' Simulation Parallel Tournament
#'
#' @param teams character vector of 8 team names
#'
#' @return character vector of winners
#' @export
#'
#' @examples
#' top8_teams <- c("Brazil", "Germany", "France", "Netherlands", "Argentina", "Spain", "England", "Portugal")
#' tournament_par(top8_teams)
tournament_par <- function(teams){
  winner <- character(500)
  foreach (i = 1:500, .combine = c, .export = c("simulate_tournament", "simulate_match", "team_summary", "worldcup_matches"), .packages = c("dplyr")) %dopar% {
    simulate_tournament(teams)$champion
  }
}
