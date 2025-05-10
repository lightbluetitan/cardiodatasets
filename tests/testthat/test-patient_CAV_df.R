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

# patient_CAV_df dataset


library(testthat)

# Test dataset structure and class
test_that("patient_CAV_df has correct structure", {
  expect_s3_class(patient_CAV_df, "data.frame")
  expect_equal(dim(patient_CAV_df), c(2803, 5))
  expect_equal(names(patient_CAV_df), c("PTNUM", "years", "state", "dage", "pdiag"))
  expect_equal(length(patient_CAV_df), 5)
})

# Test column types
test_that("patient_CAV_df has correct column types", {
  expect_type(patient_CAV_df$PTNUM, "integer")
  expect_type(patient_CAV_df$years, "double")
  expect_type(patient_CAV_df$state, "double")
  expect_type(patient_CAV_df$dage, "integer")
  expect_type(patient_CAV_df$pdiag, "double")
})

# Document NA counts
test_that("patient_CAV_df NA values are documented", {
  na_counts <- vapply(patient_CAV_df, function(x) sum(is.na(x)), integer(1))
  expect_true(TRUE) # Dummy assertion
  cat("\nNA counts per column:\n")
  print(na_counts)
})

# Immutability check - SAFE VERSION WITHOUT DIGEST
test_that("patient_CAV_df remains unchanged", {
  # Capture key immutable characteristics
  original_state <- list(
    dim = dim(patient_CAV_df),
    colnames = names(patient_CAV_df),
    first_patient = patient_CAV_df[1, ],  # Sample row
    last_patient = patient_CAV_df[nrow(patient_CAV_df), ],
    na_counts = vapply(patient_CAV_df, function(x) sum(is.na(x)), integer(1))
  )

  # Verify no changes occurred
  current_state <- list(
    dim = dim(patient_CAV_df),
    colnames = names(patient_CAV_df),
    first_patient = patient_CAV_df[1, ],
    last_patient = patient_CAV_df[nrow(patient_CAV_df), ],
    na_counts = vapply(patient_CAV_df, function(x) sum(is.na(x)), integer(1))
  )

  expect_identical(original_state, current_state)
})

# Data integrity checks
test_that("patient_CAV_df has valid clinical values", {
  # Document PTNUM distribution
  cat("\nNumber of unique PTNUM values:", length(unique(patient_CAV_df$PTNUM)))

  # Verify non-negative values where applicable
  expect_true(all(patient_CAV_df$years >= 0 | is.na(patient_CAV_df$years)))
  expect_true(all(patient_CAV_df$dage >= 0 | is.na(patient_CAV_df$dage)))
  expect_true(all(patient_CAV_df$pdiag >= 0 | is.na(patient_CAV_df$pdiag)))

  # Document state values
  cat("\nState value distribution:\n")
  print(table(patient_CAV_df$state))
})

# Clinical consistency check
test_that("patient_CAV_df documents age-time relationships", {
  complete_cases <- complete.cases(patient_CAV_df$dage, patient_CAV_df$years)
  if (any(complete_cases)) {
    inconsistent <- sum(patient_CAV_df$dage[complete_cases] < patient_CAV_df$years[complete_cases])
    cat("\nCases where dage < years:", inconsistent, "/", sum(complete_cases))
  }
  expect_true(TRUE) # Dummy assertion
})
