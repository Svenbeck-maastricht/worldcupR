
<!-- README.md is generated from README.Rmd. Please edit that file -->

# worldcupR

<!-- badges: start -->
<!-- badges: end -->

The top 8 teams in the world cup are relatively well-known to pundits,
but a lot of uncertainty remains as to who will finally lift the trophy.
The goal of worldcupR is to simulate a World Cup knockout tournament
based on historical match data from previous world cups by focusing on
teams’ historical scoring strength to predict the outcomes of the
upcoming World Cup. Simulations are run sequentially and in parallel
across 500 runs. Functions to explore and plot a team’s historical
record and for the final win probability simulated across the 500 runs
are made available. Users of the package can switch the teams they would
like to simulate in the knockout stages.

## Installation

You can install the development version of worldcupR like so:

``` r
devtools::install_github("Svenbeck-maastricht/worldcupR")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(worldcupR)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(doParallel)
#> Loading required package: foreach
#> Loading required package: iterators
#> Loading required package: parallel
## basic example code
teams <- c("Brazil", "Germany", "France", "Netherlands", "Argentina", "Spain", "England", "Portugal")
#historical statistic for a team
team_summary("Brazil")
#>     team matches wins losses draws goals_scored goals_conceded
#> 1 Brazil     114   76     19    19          237            108
#simulate a tournament
simulate_tournament(teams)$champion
#> [1] "Germany"
#run simulations (500) either sequentially or parallel
winners_seq <- tournament_seq(teams)
winners_par <- tournament_par(teams)
#> Warning: executing %dopar% sequentially: no parallel backend registered
table(winners_seq)
#> winners_seq
#>   Argentina      Brazil     England      France     Germany Netherlands 
#>           4          14           5          30         232          59 
#>    Portugal       Spain 
#>         129          27
table(winners_par)
#> winners_par
#>   Argentina      Brazil     England      France     Germany Netherlands 
#>           6          20           5          27         211          71 
#>    Portugal       Spain 
#>         123          37

bench1 <- microbenchmark::microbenchmark(
  tournament_par(teams),
  tournament_seq(teams),
  times =5
)
#> Warning in microbenchmark::microbenchmark(tournament_par(teams),
#> tournament_seq(teams), : less accurate nanosecond times to avoid potential
#> integer overflows

#plot the sequential winner probability table
plot_win_probability(winners_seq)
```

<img src="man/figures/README-example-1.png" width="100%" />

# Full Analysis

For a complete example including parallel simulation, benchmarking, and
win probability plots, see ‘worldcup_analysis.R’ in the project root

\#Plot team history

<img src="man/figures/README-pressure-1.png" width="100%" />

# Functions

`simulate_match()`: simulates a single match based on historical scoring
strength `simulate_tournament()`: simulates a single knockout tournament
`tournament_seq()`: runs 500 simulations sequentially
`tournament_par()`: runs 500 simulations in parallel `team_summary()`:
returns historical World Cup stats for a team `plot_team_history()`:
plots a team’s match history `plot_win_probability()`: plots bar chart
of win probabilities in the sequential MC simulation
