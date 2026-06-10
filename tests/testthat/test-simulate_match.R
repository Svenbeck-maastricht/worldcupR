test_that("simulate_match results are valid results", {

  sim <- simulate_match("Brazil", "Germany")

  expect_true(
    sim$result %in%
      c("Brazil wins", "Germany wins", "Draw")
  )
})

test_that("invalid team error", {

  expect_error(
    simulate_match("NA", "Brazil")
  )
})
