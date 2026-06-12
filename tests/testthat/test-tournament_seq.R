test_that("tournament_seq returns 500 results", {
  teams <- c("Brazil", "Germany", "France", "Netherlands", "Argentina", "Spain", "England", "Portugal")
  result <- tournament_seq(teams)
  expect_length(result, 500)
})

test_that("tournament_seq only returns valid teams", {
  teams <- c("Brazil", "Germany", "France", "Netherlands","Argentina", "Spain", "England", "Portugal")
  result <- tournament_seq(teams)
  expect_true(all(result %in% teams))
})
