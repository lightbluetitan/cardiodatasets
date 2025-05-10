# CardioDataSets - A Comprehensive Collection of Cardiovascular and Heart Disease Datasets
# Version 0.1.0
# Copyright (C) 2025 Renzo Caceres Rossi
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

#  scottish_CVD_df dataset



library(testthat)

test_that("scottish_CVD_df has correct structure and class", {
  # Test overall object structure
  expect_s3_class(scottish_CVD_df, "data.frame")
  expect_length(scottish_CVD_df, 8)
  expect_equal(nrow(scottish_CVD_df), 8804)
  expect_equal(names(scottish_CVD_df),
               c("age", "sex", "sc", "cvddef", "carstair", "smoke", "id", "area"))

  # Test column types
  expect_type(scottish_CVD_df$age, "integer")
  expect_s3_class(scottish_CVD_df$sex, "factor")
  expect_s3_class(scottish_CVD_df$sc, "factor")
  expect_type(scottish_CVD_df$cvddef, "integer")
  expect_type(scottish_CVD_df$carstair, "double")
  expect_s3_class(scottish_CVD_df$smoke, "factor")
  expect_type(scottish_CVD_df$id, "integer")
  expect_type(scottish_CVD_df$area, "integer")
})

test_that("scottish_CVD_df has correct factor levels", {
  # Test sex factor levels (corrected to actual values)
  expect_equal(levels(scottish_CVD_df$sex), c("male", "female"))
  expect_length(levels(scottish_CVD_df$sex), 2)

  # Test sc (social class) factor levels (corrected to actual values)
  expect_equal(levels(scottish_CVD_df$sc), c("12", "3", "45"))
  expect_length(levels(scottish_CVD_df$sc), 3)

  # Test smoking status factor levels (corrected to actual values)
  expect_equal(levels(scottish_CVD_df$smoke), c("lite", "mod", "hvy", "ex", "nevr"))
  expect_length(levels(scottish_CVD_df$smoke), 5)
})

test_that("scottish_CVD_df has valid data ranges", {
  # Test age range
  expect_true(all(scottish_CVD_df$age >= 0, na.rm = TRUE),
              info = "Negative age values found")

  # Test cvddef (assuming binary)
  expect_true(all(scottish_CVD_df$cvddef %in% 0:1),
              info = "Unexpected values in cvddef")

  # Test carstair (updated to allow negative values)
  expect_true(is.numeric(scottish_CVD_df$carstair),
              info = "Invalid carstair values")

  # Test ID uniqueness
  expect_equal(length(unique(scottish_CVD_df$id)), nrow(scottish_CVD_df),
               info = "Non-unique ID values found")
})

test_that("scottish_CVD_df has appropriate missing data patterns", {
  # Test for allowed NAs
  expect_true(sum(is.na(scottish_CVD_df$age)) == 0,
              info = "Unexpected NAs in age column")
  expect_true(sum(is.na(scottish_CVD_df$id)) == 0,
              info = "Unexpected NAs in id column")
})

test_that("scottish_CVD_df remains unchanged after tests", {
  original_data <- scottish_CVD_df
  original_structure <- capture.output(str(scottish_CVD_df))

  # Run some example checks (updated to match actual factor levels)
  mean_age <- mean(scottish_CVD_df$age, na.rm = TRUE)
  male_count <- sum(scottish_CVD_df$sex == "male", na.rm = TRUE)

  # Verify immutability
  expect_identical(scottish_CVD_df, original_data)
  expect_identical(capture.output(str(scottish_CVD_df)), original_structure)
  expect_true(mean_age > 0, info = "Mean age should be positive")
  expect_true(male_count > 0, info = "Should have male participants")
})



