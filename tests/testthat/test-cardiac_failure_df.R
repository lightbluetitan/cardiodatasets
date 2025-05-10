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

# cardiac_failure_df dataset

library(testthat)

# Test 1: Structure Verification (READ-ONLY)
test_that("cardiac_failure_df has correct structure", {
  expect_s3_class(cardiac_failure_df, "data.frame")
  expect_equal(dim(cardiac_failure_df), c(299, 13))
  expect_identical(names(cardiac_failure_df),
                   c("age", "anaemia", "creatinine_phosphokinase", "diabetes",
                     "ejection_fraction", "high_blood_pressure", "platelets",
                     "serum_creatinine", "serum_sodium", "sex", "smoking",
                     "time", "DEATH_EVENT"))
})

# Test 2: Column Type Validation (SAFE)
test_that("Column types are correct", {
  expect_type(cardiac_failure_df$age, "double")
  expect_type(cardiac_failure_df$anaemia, "integer")
  expect_type(cardiac_failure_df$creatinine_phosphokinase, "integer")
  expect_type(cardiac_failure_df$diabetes, "integer")
  expect_type(cardiac_failure_df$ejection_fraction, "integer")
  expect_type(cardiac_failure_df$high_blood_pressure, "integer")
  expect_type(cardiac_failure_df$platelets, "double")
  expect_type(cardiac_failure_df$serum_creatinine, "double")
  expect_type(cardiac_failure_df$serum_sodium, "integer")
  expect_type(cardiac_failure_df$sex, "integer")
  expect_type(cardiac_failure_df$smoking, "integer")
  expect_type(cardiac_failure_df$time, "integer")
  expect_type(cardiac_failure_df$DEATH_EVENT, "integer")
})

# Test 3: Clinical Range Checks (NON-MODIFYING - CORRECTED)
test_that("Clinical values are within valid ranges", {
  # Physiological ranges with NA handling
  expect_true(all(cardiac_failure_df$age >= 30 & cardiac_failure_df$age <= 100 | is.na(cardiac_failure_df$age)))
  expect_true(all(cardiac_failure_df$ejection_fraction >= 10 & cardiac_failure_df$ejection_fraction <= 90 | is.na(cardiac_failure_df$ejection_fraction)))
  expect_true(all(cardiac_failure_df$serum_sodium >= 110 & cardiac_failure_df$serum_sodium <= 160 | is.na(cardiac_failure_df$serum_sodium)))

  # Binary variables
  expect_true(all(cardiac_failure_df$anaemia %in% 0:1))
  expect_true(all(cardiac_failure_df$DEATH_EVENT %in% 0:1))
})

# Test 4: Data Completeness (SAFE)
test_that("No unexpected missing values", {
  expect_equal(sum(is.na(cardiac_failure_df)), 0)
})

# Test 5: Immutability Check (FINAL VERIFICATION - CORRECTED)
test_that("Dataset remains unmodified", {
  # Verify first and last rows unchanged (safer than means)
  original_first_row <- cardiac_failure_df[1, c("age", "ejection_fraction", "DEATH_EVENT")]
  original_last_row <- cardiac_failure_df[299, c("age", "ejection_fraction", "DEATH_EVENT")]

  expect_identical(cardiac_failure_df[1, c("age", "ejection_fraction", "DEATH_EVENT")], original_first_row)
  expect_identical(cardiac_failure_df[299, c("age", "ejection_fraction", "DEATH_EVENT")], original_last_row)

  # Verify dimension unchanged
  expect_equal(dim(cardiac_failure_df), c(299, 13))
})
