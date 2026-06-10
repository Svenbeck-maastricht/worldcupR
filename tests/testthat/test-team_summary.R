test_that("team_summary returns a data frame", {
  result <- team_summary("Brazil")

  expect_s3_class(result, "data.frame")
  expect_equal(result$team, "Brazil")
})

test_that("summed results equal matches played",{
  result <- team_summary("Brazil")

  expect_equal(
    result$wins + result$losses + result$draws,
    result$matches
  )
})
