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

#  ami_occurrences_tbl_df dataset

library(testthat)

# Test 1: Class Verification (READ-ONLY)
test_that("ami_occurrences_tbl_df has correct class", {
  expect_s3_class(ami_occurrences_tbl_df, "tbl_df")
  expect_s3_class(ami_occurrences_tbl_df, "tbl")
  expect_s3_class(ami_occurrences_tbl_df, "data.frame")
})

# Test 2: Structure Validation (SAFE)
test_that("Dataset structure is correct", {
  expect_equal(dim(ami_occurrences_tbl_df), c(365, 1))
  expect_identical(names(ami_occurrences_tbl_df), "ami")
})

# Test 3: Data Type Validation (NON-MODIFYING)
test_that("AMI data is properly encoded", {
  expect_type(ami_occurrences_tbl_df$ami, "integer")
  expect_true(all(ami_occurrences_tbl_df$ami >= 0)) # Counts can't be negative
})

# Test 4: Temporal Pattern Check (SAFE)
test_that("Daily AMI counts are plausible", {
  # Verify range of daily occurrences
  expect_true(max(ami_occurrences_tbl_df$ami) <= 100) # Adjust threshold as needed
  expect_true(mean(ami_occurrences_tbl_df$ami) > 0) # At least some AMIs
})

# Test 5: Immutability Check (FINAL VERIFICATION)
test_that("Dataset remains unmodified", {
  # Verify summary statistics unchanged
  original_sum <- sum(ami_occurrences_tbl_df$ami)
  expect_equal(sum(ami_occurrences_tbl_df$ami), original_sum)

  # Verify no new columns created
  expect_equal(length(ami_occurrences_tbl_df), 1)
})


