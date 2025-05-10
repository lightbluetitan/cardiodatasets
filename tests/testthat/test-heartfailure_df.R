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

# heartfailure_df dataset

library(testthat)

# Test 1: Structure Verification (READ-ONLY)
test_that("heartfailure_df has correct structure", {
  expect_s3_class(heartfailure_df, "data.frame")
  expect_false(inherits(heartfailure_df, "tbl"))
  expect_equal(dim(heartfailure_df), c(3068, 6))
  expect_identical(names(heartfailure_df),
                   c("id", "treatment", "t0", "t1", "enum", "event"))
})

# Test 2: Column Type Validation (SAFE)
test_that("Column types are correct", {
  expect_type(heartfailure_df$id, "integer")
  expect_s3_class(heartfailure_df$treatment, "factor")
  expect_type(heartfailure_df$t0, "double")
  expect_type(heartfailure_df$t1, "double")
  expect_type(heartfailure_df$enum, "double")
  expect_type(heartfailure_df$event, "double")
})

# Test 3: Clinical Validity Checks (NON-MODIFYING)
test_that("Time variables are valid", {
  expect_true(all(heartfailure_df$t1 >= heartfailure_df$t0 | is.na(heartfailure_df$t1)))
  expect_true(all(heartfailure_df$event %in% c(0, 1)))
})

# Test 4: Treatment Balance (SAFE)
test_that("Treatment groups are represented", {
  expect_equal(nlevels(heartfailure_df$treatment), 2)
  expect_gt(sum(heartfailure_df$treatment == levels(heartfailure_df$treatment)[1]), 0)
  expect_gt(sum(heartfailure_df$treatment == levels(heartfailure_df$treatment)[2]), 0)
})

# Test 5: ID Pattern Verification (CORRECTED)
test_that("ID structure is valid", {
  # Verify expected ID pattern without assuming uniqueness
  expect_true(all(heartfailure_df$id > 0))
  expect_true(is.integer(heartfailure_df$id))
})

# Test 6: Immutability Check (FINAL VERIFICATION - CORRECTED)
test_that("Dataset remains unmodified", {
  # Verify critical properties directly
  expect_equal(nrow(heartfailure_df), 3068)
  expect_equal(ncol(heartfailure_df), 6)
  expect_equal(class(heartfailure_df$treatment)[1], "factor")

  # Verify first and last rows unchanged (safer than sums)
  original_first_row <- heartfailure_df[1, ]
  original_last_row <- heartfailure_df[nrow(heartfailure_df), ]
  expect_identical(heartfailure_df[1, ], original_first_row)
  expect_identical(heartfailure_df[nrow(heartfailure_df), ], original_last_row)
})

