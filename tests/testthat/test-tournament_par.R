test_that("tournament_par returns 500 results", {
  library(doParallel)
  cl <- makeCluster(2)
  registerDoParallel(cl)
  teams <- c("Brazil", "Germany", "France", "Netherlands","Argentina", "Spain", "England", "Portugal")
  result <- tournament_par(teams)
  stopCluster(cl)
  expect_length(result, 500)
})
