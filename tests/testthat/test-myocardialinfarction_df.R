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

# myocardialinfarction_df dataset

library(testthat)

# Test 1: Structure Verification (READ-ONLY)
test_that("myocardialinfarction_df has correct structure", {
  expect_s3_class(myocardialinfarction_df, "data.frame")
  expect_false(inherits(myocardialinfarction_df, "tbl")) # Explicit non-tibble check
  expect_equal(dim(myocardialinfarction_df), c(33, 6))
  expect_identical(names(myocardialinfarction_df),
                   c("trial", "year", "ai", "n1i", "ci", "n2i"))
})

# Test 2: Column Type Validation (SAFE)
test_that("Column types are correct", {
  expect_type(myocardialinfarction_df$trial, "character")
  expect_type(myocardialinfarction_df$year, "integer")
  expect_type(myocardialinfarction_df$ai, "integer")
  expect_type(myocardialinfarction_df$n1i, "integer")
  expect_type(myocardialinfarction_df$ci, "integer")
  expect_type(myocardialinfarction_df$n2i, "integer")
})

# Test 3: Clinical Validity Checks (NON-MODIFYING)
test_that("Clinical values are valid", {
  # Group sizes
  expect_true(all(myocardialinfarction_df$n1i >= 0))
  expect_true(all(myocardialinfarction_df$n2i >= 0))

  # Event counts <= group sizes
  expect_true(all(myocardialinfarction_df$ai <= myocardialinfarction_df$n1i))
  expect_true(all(myocardialinfarction_df$ci <= myocardialinfarction_df$n2i))

  # Year range
  current_year <- as.integer(format(Sys.Date(), "%Y"))
  expect_true(all(myocardialinfarction_df$year >= 1900 & myocardialinfarction_df$year <= current_year))
})

# Test 4: Trial Information (SAFE)
test_that("Trial identifiers are valid", {
  expect_true(all(nchar(myocardialinfarction_df$trial) > 0))
  expect_equal(length(unique(myocardialinfarction_df$trial)), 33) # No duplicates
})

# Test 5: Immutability Check (FINAL VERIFICATION)
test_that("Dataset remains unmodified", {
  # Verify event totals
  original_ai_sum <- sum(myocardialinfarction_df$ai)
  original_ci_sum <- sum(myocardialinfarction_df$ci)
  expect_equal(sum(myocardialinfarction_df$ai), original_ai_sum)
  expect_equal(sum(myocardialinfarction_df$ci), original_ci_sum)
})

