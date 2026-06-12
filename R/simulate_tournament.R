
#' Simulate the world cup knock out stages
#'
#' @param teams, character vector of 8 teams
#'
#' @return a list of all the winners and fixtures
#' @export
#'
#' @examples
#' top8_teams <- c("Germany", "Brazil", "Netherlands", "France", "Argentina", "Spain", "England", "Portugal")
#' simulate_tournament(top8_teams)
simulate_tournament <- function(teams){
  if (length(teams)!= 8){
    stop("must have 8 teams exactly")
  }
  #quarters
  qf1 <- simulate_match(teams[1], teams[2])
  qf2 <- simulate_match(teams[3], teams[4])
  qf3 <- simulate_match(teams[5], teams[6])
  qf4 <- simulate_match(teams[7], teams[8])

  w1<- ifelse(qf1$team1_goals > qf1$team2_goals, qf1$team1, qf1$team2)
  w2<- ifelse(qf2$team1_goals > qf2$team2_goals, qf2$team1, qf2$team2)
  w3<- ifelse(qf3$team1_goals > qf3$team2_goals, qf3$team1, qf3$team2)
  w4<- ifelse(qf4$team1_goals > qf4$team2_goals, qf4$team1, qf4$team2)
  #semis
  sf1 <- simulate_match(w1, w2)
  sf2 <- simulate_match(w3, w4)
  s1 <- ifelse(sf1$team1_goals > sf1$team2_goals, sf1$team1, sf1$team2)
  s2 <- ifelse(sf2$team1_goals > sf2$team2_goals, sf2$team1, sf2$team2)

  #finals
  f <- simulate_match(s1, s2)
  winner <- ifelse(f$team1_goals > f$team2_goals, f$team1, f$team2)

  list(
    quarters = list(qf1, qf2, qf3, qf4),
    semis = list(sf1, sf2),
    finals = f,
    champion = winner
    )
   }
