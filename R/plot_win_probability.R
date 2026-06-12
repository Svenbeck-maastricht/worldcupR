#' Plot win probability sequential
#'
#' @param winners simulated winners as character vector
#'
#' @return ggplot
#' @export
#'
#' @examples
#' top8_teams <- c("Brazil", "Germany", "France", "Netherlands", "Argentina", "Spain", "England", "Portugal")
#' winner_seq <- tournament_seq(teams)
#' plot_win_probability(winners)
#'
plot_win_probability <- function(winner_seq){
  table_prob <- prop.table(table(winner_seq))
  df_winner <- as.data.frame(table_prob)

  ggplot2::ggplot(df_winner, ggplot2::aes(x = winner_seq, y = Freq, fill = winner_seq)) +
    ggplot2::geom_col(width = 0.7) +
    ggplot2::labs(
      title = "Who wins the World Cup 2026?",
      subtitle = "500 simulated runs",
      x = NULL,
      y = "Win probability"
    ) +
    ggplot2::theme_minimal() +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1),
                   legend.position = "none")
}
