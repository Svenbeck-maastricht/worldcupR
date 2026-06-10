library(tidyverse)
matches <- read_csv("data-raw/results.csv")

worldcup_matches <- matches %>% filter(tournament == "FIFA World Cup") %>% mutate(home_score = as.numeric(home_score),
                                                                                  (away_score = as.numeric(away_score))

                                                                                  ) %>% filter(!is.na(home_score),
                                                                                               !is.na(away_score)
  )

usethis::use_data(worldcup_matches, overwrite = TRUE)

