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

# heartdiseaserisk_tbl_df dataset


library(testthat)

# Test 1: Verify Object Existence (READ-ONLY)
test_that("heartdiseaserisk_tbl_df exists and is accessible", {
  expect_true(exists("heartdiseaserisk_tbl_df"))
  expect_false(is.null(heartdiseaserisk_tbl_df))
})

# Test 2: Validate General Integrity (SAFE INSPECTION)
test_that("Dataset maintains basic integrity", {
  # Safe inspection without expect_error_free
  expect_silent({
    dim_info <- dim(heartdiseaserisk_tbl_df)
    col_names <- names(heartdiseaserisk_tbl_df)
  })

  expect_equal(length(dim_info), 2)
  expect_length(col_names, 8)
  expect_true(all(c("start", "stop", "event") %in% col_names))
})

# Test 3: Structure Verification (ASSUMPTION-FREE)
test_that("Dataset structure is valid by definition", {
  expect_s3_class(heartdiseaserisk_tbl_df, "data.frame")
  expect_length(heartdiseaserisk_tbl_df, 8)
})

# Test 4: Immutability Check (SAFE COMPARISON)
test_that("Dataset remains unmodified", {
  # Capture initial state without copying
  initial_dims <- dim(heartdiseaserisk_tbl_df)
  initial_names <- names(heartdiseaserisk_tbl_df)

  # Perform read-only operations
  invisible(head(heartdiseaserisk_tbl_df))
  invisible(names(heartdiseaserisk_tbl_df))

  # Verify structure unchanged
  expect_identical(dim(heartdiseaserisk_tbl_df), initial_dims)
  expect_identical(names(heartdiseaserisk_tbl_df), initial_names)
})
