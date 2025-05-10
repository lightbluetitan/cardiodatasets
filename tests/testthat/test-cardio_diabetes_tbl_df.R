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

# cardio_diabetes_tbl_df dataset

library(testthat)

# Test 1: Class Verification (READ-ONLY)
test_that("cardio_diabetes_tbl_df has correct class", {
  expect_s3_class(cardio_diabetes_tbl_df, "tbl_df")
  expect_s3_class(cardio_diabetes_tbl_df, "tbl")
  expect_s3_class(cardio_diabetes_tbl_df, "data.frame")
})

# Test 2: Structure Validation (SAFE)
test_that("Dataset structure is correct", {
  expect_equal(dim(cardio_diabetes_tbl_df), c(227571, 2))
  expect_identical(names(cardio_diabetes_tbl_df),
                   c("treatment", "cardiovascular_problems"))
})

# Test 3: Factor Integrity (NON-MODIFYING)
test_that("Factor variables are valid", {
  # Column existence check
  expect_true("treatment" %in% names(cardio_diabetes_tbl_df))
  expect_true("cardiovascular_problems" %in% names(cardio_diabetes_tbl_df))

  # Type verification
  expect_true(is.factor(cardio_diabetes_tbl_df$treatment))
  expect_true(is.factor(cardio_diabetes_tbl_df$cardiovascular_problems))

  # Level count verification
  expect_equal(length(levels(cardio_diabetes_tbl_df$treatment)), 2)
  expect_equal(length(levels(cardio_diabetes_tbl_df$cardiovascular_problems)), 2)
})

# Test 4: Data Distribution (SAFE CHECK)
test_that("Treatment groups exist", {
  # Verify both treatment categories have observations
  expect_gt(sum(!is.na(cardio_diabetes_tbl_df$treatment)), 0)
  expect_equal(length(unique(cardio_diabetes_tbl_df$treatment)), 2)
})

# Test 5: Immutability Check (BASE R ONLY)
test_that("Dataset remains unmodified", {
  # Verify critical properties directly (no external packages)
  expect_equal(dim(cardio_diabetes_tbl_df), c(227571, 2))
  expect_equal(class(cardio_diabetes_tbl_df$treatment)[1], "factor")
  expect_equal(class(cardio_diabetes_tbl_df$cardiovascular_problems)[1], "factor")

  # Verify factor level counts unchanged
  expect_equal(nlevels(cardio_diabetes_tbl_df$treatment), 2)
  expect_equal(nlevels(cardio_diabetes_tbl_df$cardiovascular_problems), 2)
})

