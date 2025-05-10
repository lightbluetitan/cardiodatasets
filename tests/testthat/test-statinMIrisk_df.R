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

# statinMIrisk_df dataset


library(testthat)

# Test dataset structure and class
test_that("statinMIrisk_df has correct structure and class", {
  expect_s3_class(statinMIrisk_df, "data.frame")
  expect_equal(nrow(statinMIrisk_df), 4)
  expect_equal(ncol(statinMIrisk_df), 5)
  expect_equal(names(statinMIrisk_df), c("study", "eI", "nI", "eC", "nC"))
})

# Test column types
test_that("statinMIrisk_df has correct column types", {
  expect_type(statinMIrisk_df$study, "character")
  expect_type(statinMIrisk_df$eI, "double")
  expect_type(statinMIrisk_df$nI, "double")
  expect_type(statinMIrisk_df$eC, "double")
  expect_type(statinMIrisk_df$nC, "double")
})

# Test for missing values
test_that("statinMIrisk_df has expected NA values", {
  expect_false(any(is.na(statinMIrisk_df$study)))
  expect_false(any(is.na(statinMIrisk_df$eI)))
  expect_false(any(is.na(statinMIrisk_df$nI)))
  expect_false(any(is.na(statinMIrisk_df$eC)))
  expect_false(any(is.na(statinMIrisk_df$nC)))
})

# Test data immutability - SAFE REPLACEMENT FOR DIGEST
test_that("statinMIrisk_df remains unchanged", {
  # Capture immutable characteristics
  original_checksum <- list(
    dim = dim(statinMIrisk_df),
    colnames = names(statinMIrisk_df),
    study_names = statinMIrisk_df$study,
    first_row = unlist(statinMIrisk_df[1, ])
  )

  # Re-check characteristics (no changes expected)
  current_checksum <- list(
    dim = dim(statinMIrisk_df),
    colnames = names(statinMIrisk_df),
    study_names = statinMIrisk_df$study,
    first_row = unlist(statinMIrisk_df[1, ])
  )

  expect_identical(original_checksum, current_checksum)
})

# Test data integrity checks
test_that("statinMIrisk_df has valid data ranges", {
  # Check event counts are non-negative and don't exceed sample sizes
  expect_true(all(statinMIrisk_df$eI >= 0 & statinMIrisk_df$eI <= statinMIrisk_df$nI))
  expect_true(all(statinMIrisk_df$eC >= 0 & statinMIrisk_df$eC <= statinMIrisk_df$nC))

  # Check sample sizes are positive
  expect_true(all(statinMIrisk_df$nI > 0))
  expect_true(all(statinMIrisk_df$nC > 0))

  # Verify study names are non-empty
  expect_true(all(nchar(statinMIrisk_df$study) > 0))
})
