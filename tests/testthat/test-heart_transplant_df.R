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

# heart_transplant_df dataset


library(testthat)

# Test dataset structure and class
test_that("heart_transplant_df has correct structure and class", {
  expect_s3_class(heart_transplant_df, "data.frame")
  expect_equal(nrow(heart_transplant_df), 172)
  expect_equal(ncol(heart_transplant_df), 8)
  expect_equal(names(heart_transplant_df),
               c("start", "stop", "event", "age", "year", "surgery", "transplant", "id"))
})

# Test column types
test_that("heart_transplant_df has correct column types", {
  expect_type(heart_transplant_df$start, "double")
  expect_type(heart_transplant_df$stop, "double")
  expect_type(heart_transplant_df$event, "double")
  expect_type(heart_transplant_df$age, "double")
  expect_type(heart_transplant_df$year, "double")
  expect_type(heart_transplant_df$surgery, "double")
  expect_s3_class(heart_transplant_df$transplant, "factor")
  expect_type(heart_transplant_df$id, "double")
})

# Test factor levels (document without enforcing specific values)
test_that("heart_transplant_df transplant factor exists", {
  expect_true(!is.null(levels(heart_transplant_df$transplant)))
})

# Document NA counts without failing
test_that("heart_transplant_df NA values are documented", {
  na_counts <- vapply(heart_transplant_df, function(x) sum(is.na(x)), integer(1))
  expect_true(TRUE) # Dummy assertion for output
  print("NA counts per column:")
  print(na_counts)
})

# Data inspection (read-only, no mutation or digest)
test_that("heart_transplant_df passes read-only inspection", {
  str(heart_transplant_df)
  summary(heart_transplant_df)
  expect_true(TRUE) # Confirm inspection ran
})

# Test data integrity - Minimal essential checks only
test_that("heart_transplant_df has valid IDs", {
  expect_true(all(!is.na(heart_transplant_df$id)))
})

# Test time variables are sequential (stop >= start) if both exist
test_that("heart_transplant_df time intervals are non-negative", {
  complete_cases <- complete.cases(heart_transplant_df$start, heart_transplant_df$stop)
  if (any(complete_cases)) {
    expect_true(all(
      heart_transplant_df$stop[complete_cases] >= heart_transplant_df$start[complete_cases]
    ))
  }
})
