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


test_that("goals only positive", {
  result <- team_summary("Brazil")
  expect_gte(result$goals_scored, 0)
  expect_gte(result$goals_conceded, 0)
})
