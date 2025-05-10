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

# heartTransplantTime_tbl_df dataset


library(testthat)

# Test dataset structure and class
test_that("heartTransplantTime_tbl_df has correct structure and class", {
  expect_s3_class(heartTransplantTime_tbl_df, "tbl_df")
  expect_s3_class(heartTransplantTime_tbl_df, "tbl")
  expect_s3_class(heartTransplantTime_tbl_df, "data.frame")
  expect_equal(nrow(heartTransplantTime_tbl_df), 15)
  expect_equal(ncol(heartTransplantTime_tbl_df), 1)
  expect_equal(names(heartTransplantTime_tbl_df), "duration")
  expect_equal(length(heartTransplantTime_tbl_df), 1)
})

# Test column types and attributes
test_that("heartTransplantTime_tbl_df has correct column types", {
  expect_type(heartTransplantTime_tbl_df$duration, "double")

  # Verify spec attributes are preserved
  expect_true(!is.null(attr(heartTransplantTime_tbl_df, "spec")))
  expect_type(attr(heartTransplantTime_tbl_df, "spec"), "list")
  expect_true("col_spec" %in% class(attr(heartTransplantTime_tbl_df, "spec")))
})

# Test for missing values (NA values are valid if present)
test_that("heartTransplantTime_tbl_df documents NA values", {
  na_count <- sum(is.na(heartTransplantTime_tbl_df$duration))
  cat(sprintf("\nNA count in duration: %d", na_count))
  expect_true(TRUE) # Document presence of NA, no modification
})

# Test data immutability (without digest)
test_that("heartTransplantTime_tbl_df remains unchanged", {
  original_data <- heartTransplantTime_tbl_df

  # Inspection-only operations
  str(heartTransplantTime_tbl_df)
  summary(heartTransplantTime_tbl_df$duration)

  # Compare full structure and values
  expect_identical(original_data, heartTransplantTime_tbl_df)
})

# Test data integrity (minimal checks respecting existing values)
test_that("heartTransplantTime_tbl_df has valid duration values", {
  expect_true(all(
    is.na(heartTransplantTime_tbl_df$duration) |
      heartTransplantTime_tbl_df$duration >= 0
  ))
})
