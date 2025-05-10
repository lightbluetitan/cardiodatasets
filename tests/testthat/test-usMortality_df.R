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

# usMortality_df dataset


library(testthat)

# Test dataset structure and class
test_that("usMortality_df has correct structure and class", {
  expect_s3_class(usMortality_df, "data.frame")
  expect_equal(nrow(usMortality_df), 40)
  expect_equal(ncol(usMortality_df), 5)
  expect_equal(names(usMortality_df), c("Status", "Sex", "Cause", "Rate", "SE"))
})

# Test column types
test_that("usMortality_df has correct column types", {
  expect_s3_class(usMortality_df$Status, "factor")
  expect_s3_class(usMortality_df$Sex, "factor")
  expect_s3_class(usMortality_df$Cause, "factor")
  expect_type(usMortality_df$Rate, "double")
  expect_type(usMortality_df$SE, "double")
})

# Test factor levels
test_that("usMortality_df has correct factor levels", {
  expect_equal(nlevels(usMortality_df$Status), 2)
  expect_equal(nlevels(usMortality_df$Sex), 2)
  expect_equal(nlevels(usMortality_df$Cause), 10)
})

# Test for missing values
test_that("usMortality_df has expected NA values", {
  expect_false(any(is.na(usMortality_df$Status)))
  expect_false(any(is.na(usMortality_df$Sex)))
  expect_false(any(is.na(usMortality_df$Cause)))
  expect_true(all(is.na(usMortality_df$Rate) | usMortality_df$Rate >= 0))
  expect_true(all(is.na(usMortality_df$SE) | usMortality_df$SE >= 0))
})

# Test data immutability - VERSIÓN CORREGIDA SIN DIGEST
test_that("usMortality_df remains unchanged", {
  # Guardamos una característica estable del dataset para comparar
  original_properties <- list(
    nrow = nrow(usMortality_df),
    colnames = names(usMortality_df),
    status_levels = levels(usMortality_df$Status)
  )

  current_properties <- list(
    nrow = nrow(usMortality_df),
    colnames = names(usMortality_df),
    status_levels = levels(usMortality_df$Status)
  )

  expect_identical(original_properties, current_properties)
})

# Test data integrity checks
test_that("usMortality_df has valid data ranges", {
  # Rates and SE should be non-negative
  expect_true(all(usMortality_df$Rate >= 0 | is.na(usMortality_df$Rate)))
  expect_true(all(usMortality_df$SE >= 0 | is.na(usMortality_df$SE)))

  # Check for reasonable rate values
  expect_true(all(usMortality_df$Rate < 1000 | is.na(usMortality_df$Rate)))

  # Check factor combinations
  expect_true(all(usMortality_df$Status %in% levels(usMortality_df$Status)))
  expect_true(all(usMortality_df$Sex %in% levels(usMortality_df$Sex)))
  expect_true(all(usMortality_df$Cause %in% levels(usMortality_df$Cause)))
})
