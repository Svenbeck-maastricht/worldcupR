#' Simulate Match at the world cup
#' the match is simulated based on goal scoring strength in past tournaments on the historical average scoring strength of the team
#' @param team1 first team
#' @param team2 second team
#'
#' @return simulated score and result in a data frame
#' @export
#'
#' @examples
simulate_match <- function(team1, team2){
  t1_stats <- team_summary(team1)
  t2_stats <- team_summary(team2)
  if (t1_stats$matches == 0 | t2_stats$matches == 0) {
    stop("team with no previous match")
  }
  t1_attack <- t1_stats$goals_scored/t1_stats$matches
  t2_attack <- t2_stats$goals_scored/t2_stats$matches

  set.seed(NULL)

  t1_goals <- rpois(1, lambda=t1_attack)
  t2_goals <- rpois(1, lambda=t2_attack)

result <- dplyr::case_when(
  t1_goals > t2_goals ~ paste(team1, "wins"),
  t2_goals > t1_goals  ~ paste(team2, "wins"),
  TRUE ~ "Draw"
)

data.frame(
  team1 = team1,
  team2 = team2,
  team1_goals = t1_goals,
  team2_goals = t2_goals,
  result = result
)

}
