library(sacred)

test_that("King James version", {
  data("king_james_version")

  expect_equal(ncol(king_james_version), 4)
  expect_equal(nrow(king_james_version), 31102)
})

test_that("Apocrypha", {
  data("apocrypha")

  expect_equal(ncol(apocrypha), 4)
  expect_equal(nrow(apocrypha), 5725)
})

test_that("Greek New Testament", {
  data("greek_new_testament")
  expect_equal(nrow(greek_new_testament), 7958)
})

test_that("Septuagint", {
  data("septuagint")
  expect_equal(nrow(septuagint), 30374)
})

test_that("Tanach", {
  data("tanach")
  expect_equal(nrow(tanach), 23213)
})

test_that("Vulgate", {
  data("vulgate")
  expect_equal(nrow(vulgate), 35811)
})

test_that("terms", {
  data("middle_english_stopwords")
  expect_equal(nrow(middle_english_stopwords), 295)
  expect_equal(nrow(middle_english_sentiments), 90)
})
