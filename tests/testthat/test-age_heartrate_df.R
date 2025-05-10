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

# age_heartrate_df dataset

library(testthat)

# Test dataset structure and class
test_that("age_heartrate_df has correct structure", {
  expect_s3_class(age_heartrate_df, "data.frame")
  expect_equal(dim(age_heartrate_df), c(15, 2))
  expect_equal(names(age_heartrate_df), c("age", "maxrate"))
})

# Test data types of columns
test_that("age_heartrate_df has correct column types", {
  expect_type(age_heartrate_df$age, "double")
  expect_type(age_heartrate_df$maxrate, "double")
})

# Test for reasonable value ranges
test_that("age_heartrate_df has valid value ranges", {
  # Age range (assuming this is human age in years)
  expect_true(all(age_heartrate_df$age >= 0 & age_heartrate_df$age <= 120))

  # Max heart rate range (typical range is 60-220 bpm)
  expect_true(all(age_heartrate_df$maxrate >= 60 & age_heartrate_df$maxrate <= 220))
})

# Test for expected relationships between variables
test_that("age_heartrate_df shows appropriate age-rate relationship", {
  # Expect negative correlation between age and max heart rate
  correlation <- cor(age_heartrate_df$age, age_heartrate_df$maxrate)
  expect_true(correlation < 0)
})

# Test dataset immutability
test_that("age_heartrate_df remains unchanged", {
  original_data <- age_heartrate_df
  original_hash <- paste0(capture.output(str(age_heartrate_df)), collapse = "")

  # Perform some read-only operations
  head(age_heartrate_df)
  summary(age_heartrate_df)

  expect_identical(age_heartrate_df, original_data)
  expect_identical(paste0(capture.output(str(age_heartrate_df)), collapse = ""), original_hash)
})
