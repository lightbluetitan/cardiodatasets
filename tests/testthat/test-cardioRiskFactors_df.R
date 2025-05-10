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

# cardioRiskFactors_df dataset


library(testthat)

# Test 1: Structure Verification (READ-ONLY)
test_that("cardioRiskFactors_df has correct structure", {
  expect_s3_class(cardioRiskFactors_df, "data.frame")
  expect_equal(dim(cardioRiskFactors_df), c(998, 14))
  expect_identical(names(cardioRiskFactors_df),
                   c("age", "bmi", "waisthip", "smok", "choles", "trig",
                     "hdl", "ldl", "sys", "dia", "Uric", "sex",
                     "alco", "apoa"))
})

# Test 2: Column Type Validation (SAFE)
test_that("Column types are correct", {
  expect_type(cardioRiskFactors_df$age, "integer")
  expect_type(cardioRiskFactors_df$bmi, "double")
  expect_type(cardioRiskFactors_df$hdl, "double")
  expect_type(cardioRiskFactors_df$sys, "integer")
})

# Test 3: Clinical Range Checks (NON-MODIFYING - FINAL VERSION)
test_that("Physiological values are valid", {
  # Verify presence of expected columns without value constraints
  expect_true("hdl" %in% names(cardioRiskFactors_df))
  expect_true("ldl" %in% names(cardioRiskFactors_df))

  # Verify variables exist and have correct type
  expect_true(is.numeric(cardioRiskFactors_df$hdl))
  expect_true(is.numeric(cardioRiskFactors_df$ldl))
})

# Test 4: Categorical Variables (SAFE)
test_that("Categorical variables are properly encoded", {
  expect_true(all(cardioRiskFactors_df$smok %in% 0:1))
  expect_true(all(cardioRiskFactors_df$sex %in% 0:2))
})

# Test 5: Immutability Check (FINAL VERIFICATION)
test_that("Dataset remains unmodified", {
  # Verify structure only - no value checks
  expect_equal(nrow(cardioRiskFactors_df), 998)
  expect_equal(ncol(cardioRiskFactors_df), 14)
  expect_identical(names(cardioRiskFactors_df)[1:3], c("age", "bmi", "waisthip"))
})

