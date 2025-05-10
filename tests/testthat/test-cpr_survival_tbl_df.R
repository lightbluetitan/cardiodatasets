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

# cpr_survival_tbl_df dataset

library(testthat)

# Test 1: Class Verification (READ-ONLY)
test_that("cpr_survival_tbl_df has correct class", {
  expect_s3_class(cpr_survival_tbl_df, "tbl_df")
  expect_s3_class(cpr_survival_tbl_df, "tbl")
  expect_s3_class(cpr_survival_tbl_df, "data.frame")
})

# Test 2: Structure Validation (SAFE)
test_that("Dataset structure is correct", {
  expect_equal(dim(cpr_survival_tbl_df), c(90, 2))
  expect_identical(names(cpr_survival_tbl_df), c("group", "outcome"))
})

# Test 3: Factor Integrity (NON-MODIFYING)
test_that("Factor variables are valid", {
  # Column existence check
  expect_true("group" %in% names(cpr_survival_tbl_df))
  expect_true("outcome" %in% names(cpr_survival_tbl_df))

  # Type verification
  expect_s3_class(cpr_survival_tbl_df$group, "factor")
  expect_s3_class(cpr_survival_tbl_df$outcome, "factor")

  # Level count verification
  expect_equal(nlevels(cpr_survival_tbl_df$group), 2)
  expect_equal(nlevels(cpr_survival_tbl_df$outcome), 2)
})

# Test 4: Clinical Validity (SAFE CHECK)
test_that("Groups and outcomes are properly represented", {
  # Verify both groups have cases
  expect_gt(sum(cpr_survival_tbl_df$group == levels(cpr_survival_tbl_df$group)[1]), 0)
  expect_gt(sum(cpr_survival_tbl_df$group == levels(cpr_survival_tbl_df$group)[2]), 0)

  # Verify both outcomes exist
  expect_gt(sum(cpr_survival_tbl_df$outcome == levels(cpr_survival_tbl_df$outcome)[1]), 0)
  expect_gt(sum(cpr_survival_tbl_df$outcome == levels(cpr_survival_tbl_df$outcome)[2]), 0)
})

# Test 5: Immutability Check (BASE R ONLY)
test_that("Dataset remains unmodified", {
  # Verify critical properties directly
  expect_equal(dim(cpr_survival_tbl_df), c(90, 2))
  expect_equal(class(cpr_survival_tbl_df$group)[1], "factor")
  expect_equal(class(cpr_survival_tbl_df$outcome)[1], "factor")

  # Verify no NAs introduced
  expect_equal(sum(is.na(cpr_survival_tbl_df$group)), 0)
  expect_equal(sum(is.na(cpr_survival_tbl_df$outcome)), 0)
})



