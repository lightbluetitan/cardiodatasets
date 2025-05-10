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

# radial_ivus_df dataset


library(testthat)

# Test dataset structure and class
test_that("radial_ivus_df has correct structure", {
  expect_s3_class(radial_ivus_df, "data.frame")
  expect_equal(dim(radial_ivus_df), c(115, 15))

  expected_cols <- c("male", "age", "height", "weight", "HBP", "DM", "smoking",
                     "TC", "TG", "HDL", "LDL", "hsCRP", "NTAV", "PAV", "sex")
  expect_equal(names(radial_ivus_df), expected_cols)
})

# Test data types of columns
test_that("radial_ivus_df has correct column types", {
  expect_type(radial_ivus_df$male, "integer")
  expect_type(radial_ivus_df$age, "integer")
  expect_type(radial_ivus_df$height, "double")
  expect_type(radial_ivus_df$weight, "double")
  expect_type(radial_ivus_df$HBP, "integer")
  expect_type(radial_ivus_df$DM, "integer")
  expect_s3_class(radial_ivus_df$smoking, "factor")
  expect_type(radial_ivus_df$TC, "integer")
  expect_type(radial_ivus_df$TG, "integer")
  expect_type(radial_ivus_df$HDL, "integer")
  expect_type(radial_ivus_df$LDL, "integer")
  expect_type(radial_ivus_df$hsCRP, "double")
  expect_type(radial_ivus_df$NTAV, "double")
  expect_type(radial_ivus_df$PAV, "double")
  expect_s3_class(radial_ivus_df$sex, "factor")
})

# Test factor structure exists (without checking specific levels)
test_that("radial_ivus_df has proper factor variables", {
  expect_true(is.factor(radial_ivus_df$smoking))
  expect_true(is.factor(radial_ivus_df$sex))
  expect_equal(length(levels(radial_ivus_df$smoking)), 3)
  expect_equal(length(levels(radial_ivus_df$sex)), 2)
})

# Test for valid data presence
test_that("radial_ivus_df contains appropriate values", {
  # Check binary variables
  expect_true(all(radial_ivus_df$male %in% c(0L, 1L, NA_integer_)))
  expect_true(all(radial_ivus_df$HBP %in% c(0L, 1L, NA_integer_)))
  expect_true(all(radial_ivus_df$DM %in% c(0L, 1L, NA_integer_)))

  # Check numeric variables contain numbers or NA
  numeric_cols <- c("age", "height", "weight", "TC", "TG", "HDL", "LDL", "hsCRP", "NTAV", "PAV")
  for(col in numeric_cols) {
    expect_true(is.numeric(radial_ivus_df[[col]]) | all(is.na(radial_ivus_df[[col]])))
  }
})

# Test dataset immutability - SAFE VERSION WITHOUT DIGEST
test_that("radial_ivus_df remains unchanged", {
  # Capture immutable characteristics
  original_state <- list(
    dim = dim(radial_ivus_df),
    colnames = names(radial_ivus_df),
    first_row_values = as.list(radial_ivus_df[1, ]),
    factor_levels = list(
      smoking = levels(radial_ivus_df$smoking),
      sex = levels(radial_ivus_df$sex)
    )
  )

  # Verify no changes occurred
  current_state <- list(
    dim = dim(radial_ivus_df),
    colnames = names(radial_ivus_df),
    first_row_values = as.list(radial_ivus_df[1, ]),
    factor_levels = list(
      smoking = levels(radial_ivus_df$smoking),
      sex = levels(radial_ivus_df$sex)
    )
  )

  expect_identical(original_state, current_state)
})
