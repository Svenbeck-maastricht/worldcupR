#' Team World Cup Summary
#' Performance at the previous World Cups by team
#' @param team character string of name of the team
#'
#' @return data frame with wins/losses/draws, goals scored/conceded by team
#' @export
#'
#' @examples
#' team_summary("Brazil")

team_summary <- function(team){
  matches <- worldcup_matches %>%
    dplyr::filter(home_team == team | away_team == team)
  wins <- sum(
    (matches$home_team == team & matches$home_score > matches$away_score) |
      (matches$away_team == team & matches$away_score > matches$home_score)
  )
  draws <- sum(matches$home_score == matches$away_score)
  losses <- nrow(matches) - wins - draws

  goals_scored <- sum(
    ifelse(matches$home_team == team,
           matches$home_score,
           matches$away_score)
  )
  goals_conceded <- sum(
    ifelse(matches$home_team == team,
           matches$away_score,
           matches$home_score)
  )
  data.frame(
    team = team,
    matches = nrow(matches),
    wins = wins,
    losses = losses,
    draws = draws,
    goals_scored = goals_scored,
    goals_conceded = goals_conceded
  )
}
