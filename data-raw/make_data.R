library(tidyverse)
matches <- read_csv("data-raw/results.csv")

worldcup_matches <- matches %>% filter(tournament == "FIFA World Cup")

usethis::use_data(worldcup_matches, overwrite = TRUE)
