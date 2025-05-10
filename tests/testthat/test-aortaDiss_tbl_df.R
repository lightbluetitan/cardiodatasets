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

# aortaDiss_tbl_df dataset


library(testthat)

# Test dataset structure and class
test_that("aortaDiss_tbl_df has correct structure and class", {
  expect_s3_class(aortaDiss_tbl_df, "tbl_df")
  expect_equal(nrow(aortaDiss_tbl_df), 226)
  expect_equal(ncol(aortaDiss_tbl_df), 10)
  expect_equal(names(aortaDiss_tbl_df),
               c("Gender", "Age", "Age_C", "Aortadis", "Acute", "Acute3",
                 "Stomach_Ache", "Hyper", "Smoking", "Radiation"))
})

# Test column types
test_that("aortaDiss_tbl_df has correct column types", {
  expect_type(aortaDiss_tbl_df$Gender, "double")
  expect_type(aortaDiss_tbl_df$Age, "double")
  expect_type(aortaDiss_tbl_df$Age_C, "double")
  expect_type(aortaDiss_tbl_df$Aortadis, "double")
  expect_type(aortaDiss_tbl_df$Acute, "double")
  expect_type(aortaDiss_tbl_df$Acute3, "double")
  expect_type(aortaDiss_tbl_df$Stomach_Ache, "double")
  expect_type(aortaDiss_tbl_df$Hyper, "double")
  expect_type(aortaDiss_tbl_df$Smoking, "double")
  expect_type(aortaDiss_tbl_df$Radiation, "double")
})

# Test for missing values
test_that("aortaDiss_tbl_df has expected NA values", {
  expect_false(any(is.na(aortaDiss_tbl_df$Gender)))
  expect_false(any(is.na(aortaDiss_tbl_df$Age)))
  expect_false(any(is.na(aortaDiss_tbl_df$Age_C)))
  expect_false(any(is.na(aortaDiss_tbl_df$Aortadis)))
  expect_false(any(is.na(aortaDiss_tbl_df$Acute)))
  expect_false(any(is.na(aortaDiss_tbl_df$Acute3)))
  expect_false(any(is.na(aortaDiss_tbl_df$Stomach_Ache)))
  expect_false(any(is.na(aortaDiss_tbl_df$Hyper)))
  expect_false(any(is.na(aortaDiss_tbl_df$Smoking)))
  expect_false(any(is.na(aortaDiss_tbl_df$Radiation)))
})

# Data inspection only (read-only, no modification or hashing)
test_that("aortaDiss_tbl_df can be inspected without modification", {
  str(aortaDiss_tbl_df)
  summary(aortaDiss_tbl_df)
  expect_true(TRUE)  # Dummy check to confirm inspection executed
})

# Test data integrity checks
test_that("aortaDiss_tbl_df has valid data ranges", {
  # Check binary variables
  binary_vars <- c("Aortadis", "Acute", "Stomach_Ache", "Hyper", "Smoking", "Radiation")
  for (var in binary_vars) {
    expect_true(all(aortaDiss_tbl_df[[var]] %in% c(0, 1)),
                info = paste("Variable", var, "contains non-binary values"))
  }

  # Check Age_C contains non-negative values
  expect_true(all(aortaDiss_tbl_df$Age_C >= 0))

  # Check Age contains strictly positive values
  expect_true(all(aortaDiss_tbl_df$Age > 0))

  # Check Gender coding is consistent
  expect_true(all(aortaDiss_tbl_df$Gender %in% c(0, 1)) ||
                all(aortaDiss_tbl_df$Gender %in% c(1, 2)))

  # Check Acute3 is within expected range
  expect_true(all(aortaDiss_tbl_df$Acute3 >= 0 & aortaDiss_tbl_df$Acute3 <= 2))
})
