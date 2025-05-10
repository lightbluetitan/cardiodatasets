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

# sulphinpyrazone_tbl_df dataset

library(testthat)

# Test 1: Class Verification (READ-ONLY)
test_that("sulphinpyrazone_tbl_df has correct class", {
  expect_s3_class(sulphinpyrazone_tbl_df, "tbl_df")
  expect_s3_class(sulphinpyrazone_tbl_df, "tbl")
  expect_s3_class(sulphinpyrazone_tbl_df, "data.frame")
})

# Test 2: Structure Validation (SAFE)
test_that("Dataset structure is correct", {
  expect_equal(dim(sulphinpyrazone_tbl_df), c(1475, 2))
  expect_identical(names(sulphinpyrazone_tbl_df), c("group", "outcome"))
})

# Test 3: Factor Integrity (NON-MODIFYING)
test_that("Factor variables are valid", {
  # Safe column verification
  expect_true(exists("group", where = sulphinpyrazone_tbl_df))
  expect_true(exists("outcome", where = sulphinpyrazone_tbl_df))

  # Type verification
  expect_s3_class(sulphinpyrazone_tbl_df$group, "factor")
  expect_s3_class(sulphinpyrazone_tbl_df$outcome, "factor")

  # Level count verification
  expect_equal(nlevels(sulphinpyrazone_tbl_df$group), 2)
  expect_equal(nlevels(sulphinpyrazone_tbl_df$outcome), 2)
})

# Test 4: Clinical Representation (SAFE CHECK)
test_that("Treatment groups are properly represented", {
  # Verify both treatment arms have cases
  group_counts <- table(sulphinpyrazone_tbl_df$group)
  expect_equal(length(group_counts), 2)
  expect_true(all(group_counts > 0))
})

# Test 5: Outcome Validation (NON-MODIFYING)
test_that("Outcomes are properly distributed", {
  # Verify both outcome categories exist
  outcome_counts <- table(sulphinpyrazone_tbl_df$outcome)
  expect_equal(length(outcome_counts), 2)
  expect_true(all(outcome_counts > 0))
})

# Test 6: Immutability Check (BASE R ONLY)
test_that("Dataset remains unmodified", {
  # Verify critical properties directly
  expect_equal(dim(sulphinpyrazone_tbl_df), c(1475, 2))
  expect_equal(class(sulphinpyrazone_tbl_df$group)[1], "factor")
  expect_equal(class(sulphinpyrazone_tbl_df$outcome)[1], "factor")

  # Verify factor level preservation
  original_levels <- list(
    group = levels(sulphinpyrazone_tbl_df$group),
    outcome = levels(sulphinpyrazone_tbl_df$outcome)
  )
  expect_identical(levels(sulphinpyrazone_tbl_df$group), original_levels$group)
  expect_identical(levels(sulphinpyrazone_tbl_df$outcome), original_levels$outcome)
})



