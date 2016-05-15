library(bibler)
library(tm)

test_that("KJ", {
  data("king_james_df")

  expect_equal(ncol(king_james_df), 9)
  expect_equal(nrow(king_james_df), 31102)

  data("king_james_tm")

  expect_equal(nrow(king_james_df), length(king_james_tm))
  expect_equal(length(meta(king_james_tm[[1]])), ncol(king_james_df))

  expect_equal(nrow(king_james_books), 66)
  expect_equal(ncol(king_james_books), 7)
})

test_that("apocrypha", {
  data("apocrypha_df")

  expect_equal(ncol(apocrypha_df), 7)
  expect_equal(nrow(apocrypha_df), 5725)

  data("apocrypha_tm")

  expect_equal(nrow(apocrypha_df), length(apocrypha_tm))
  expect_equal(length(meta(apocrypha_tm[[1]])), ncol(apocrypha_df))

  expect_equal(nrow(apocrypha_books), 16)
  expect_equal(ncol(apocrypha_books), 5)
})


test_that("terms", {
  data("middle_english_stopwords")
  expect_equal(length(middle_english_stopwords), 97)

  data("middle_english_positive")
  data("middle_english_negative")

  expect_equal(length(middle_english_positive), 48)
  expect_equal(length(middle_english_negative), 42)
})
