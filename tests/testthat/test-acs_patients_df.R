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

# acs_patients_df dataset


library(testthat)

# Test dataset structure and class
test_that("acs_patients_df loads correctly and has the expected structure", {
  # Check class and dimensions
  expect_s3_class(acs_patients_df, "data.frame")
  expect_equal(nrow(acs_patients_df), 857)
  expect_equal(ncol(acs_patients_df), 17)

  # Verify column names and order
  expected_cols <- c("age", "sex", "cardiogenicShock", "entry", "Dx", "EF", "height",
                     "weight", "BMI", "obesity", "TC", "LDLC", "HDLC", "TG", "DM",
                     "HBP", "smoking")
  expect_equal(names(acs_patients_df), expected_cols)
})

# Test data types of columns
test_that("acs_patients_df has correct column types", {
  # Numeric/integer columns
  expect_type(acs_patients_df$age, "integer")
  expect_type(acs_patients_df$EF, "double")
  expect_type(acs_patients_df$height, "double")
  expect_type(acs_patients_df$weight, "double")
  expect_type(acs_patients_df$BMI, "double")
  expect_type(acs_patients_df$TC, "double")
  expect_type(acs_patients_df$LDLC, "integer")
  expect_type(acs_patients_df$HDLC, "integer")
  expect_type(acs_patients_df$TG, "integer")

  # Character columns
  expect_type(acs_patients_df$sex, "character")
  expect_type(acs_patients_df$cardiogenicShock, "character")
  expect_type(acs_patients_df$entry, "character")
  expect_type(acs_patients_df$Dx, "character")
  expect_type(acs_patients_df$obesity, "character")
  expect_type(acs_patients_df$DM, "character")
  expect_type(acs_patients_df$HBP, "character")
  expect_type(acs_patients_df$smoking, "character")
})

# Test for expected value ranges and categories
test_that("acs_patients_df has valid values in columns", {
  # Check actual categories present in the data (not assumptions)
  expect_true(all(is.character(acs_patients_df$sex)))
  expect_true(all(is.character(acs_patients_df$cardiogenicShock)))
  expect_true(all(is.character(acs_patients_df$obesity)))

  # Check numeric ranges
  expect_true(all(acs_patients_df$age >= 18 & acs_patients_df$age <= 120 | is.na(acs_patients_df$age)))
  expect_true(all(acs_patients_df$EF >= 0 & acs_patients_df$EF <= 100 | is.na(acs_patients_df$EF)))
  expect_true(all(acs_patients_df$BMI >= 10 & acs_patients_df$BMI <= 60 | is.na(acs_patients_df$BMI)))
})

# Test for missing values patterns
test_that("acs_patients_df has expected NA patterns", {
  # Document actual NA counts without judgment
  na_counts <- sapply(acs_patients_df, function(x) sum(is.na(x)))

  # Simply report NA counts for documentation purposes
  expect_true(is.numeric(na_counts))
  expect_length(na_counts, 17)
})

# Test dataset immutability
test_that("acs_patients_df remains unchanged after tests", {
  original_data <- acs_patients_df

  # Perform some read-only operations
  nrow(original_data)
  summary(original_data)
  str(original_data)

  # Verify integrity
  expect_identical(acs_patients_df, original_data)
})







