#' Plot team history at the WC
#'
#' @param team
#'
#' @return ggplot
#' @export
#'
#' @examples
#' plot_team_history(Brazil)
#'
plot_team_history <- function(team){
  matches <- worldcup_matches %>%
    dplyr::filter (home_team == team | away_team == team) %>%
    dplyr::mutate(
      date = as.Date(date),
      result = dplyr::case_when(
        !is.na(home_score) & !is.na(away_score) &
          ((home_team == team & home_score > away_score) |
             (away_team == team & away_score > home_score)) ~ "Win",

        !is.na(home_score) & !is.na(away_score) &
          home_score == away_score ~ "Draw",

        TRUE ~ "Loss"
      )
    )

  plot <- ggplot2::ggplot(matches,
                          ggplot2::aes(x = date, y= result, color = result))+
    ggplot2::geom_jitter(height =0.2, width =0)+
    ggplot2::labs(
      title= paste("Match History:", team),
      x= "Date",
      y= "Result"
    )+
    ggplot2::theme_minimal()
  return(plot)
}
