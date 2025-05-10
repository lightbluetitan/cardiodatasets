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

# cv_mortality_ts dataset


library(testthat)

# Test dataset class and type
test_that("cv_mortality_ts has correct class and type", {
  expect_s3_class(cv_mortality_ts, "ts")  # Verify it's a time series object
  expect_type(cv_mortality_ts, "double")  # Verify the data type is numeric
})

# Test time series structure and dimensions
test_that("cv_mortality_ts has correct structure and dimensions", {
  expect_equal(length(cv_mortality_ts), 508)  # Verify total number of observations
  expect_equal(frequency(cv_mortality_ts), 52) # Verify weekly frequency (52 weeks/year)
})

# Test time series start and end points
test_that("cv_mortality_ts has correct time parameters", {
  expect_equal(start(cv_mortality_ts), c(1970, 1))  # Verify start year and week
  expect_equal(end(cv_mortality_ts), c(1979, 40))    # Verify end year and week
  expect_equal(time(cv_mortality_ts)[1], 1970)       # First time point
})

# Test data range and characteristics
test_that("cv_mortality_ts has expected data characteristics", {
  expect_true(all(cv_mortality_ts > 60 & cv_mortality_ts < 140, na.rm = TRUE))  # Reasonable range check
  expect_equal(round(mean(cv_mortality_ts, na.rm = TRUE), 2), 88.70)  # Actual mean
  expect_equal(round(sd(cv_mortality_ts, na.rm = TRUE), 1), 10.0)    # Actual standard deviation (1 decimal)
})

# Test for missing values (NA)
test_that("cv_mortality_ts has no missing values", {
  expect_false(any(is.na(cv_mortality_ts)))  # Verify no NAs in the time series
})

# Test immutability of the dataset
test_that("cv_mortality_ts remains unchanged after tests", {
  original_attributes <- attributes(cv_mortality_ts)
  original_values <- as.vector(cv_mortality_ts)

  # Verify attributes remain unchanged
  expect_identical(attributes(cv_mortality_ts), original_attributes)
  expect_equal(as.vector(cv_mortality_ts), original_values)
  expect_equal(frequency(cv_mortality_ts), original_attributes$tsp[3])
})

# Test time series consistency
test_that("cv_mortality_ts has consistent time properties", {
  expect_equal(deltat(cv_mortality_ts), 1/52)  # Verify time between observations
  expect_equal(round(tsp(cv_mortality_ts)[3]), 52)    # Verify frequency from tsp
})

# Test specific known values with appropriate precision
test_that("cv_mortality_ts contains expected specific values", {
  expect_equal(round(cv_mortality_ts[1], 2), 97.85)  # First value
  expect_equal(round(cv_mortality_ts[100], 2), 112.72) # 100th value
  expect_equal(round(cv_mortality_ts[508], 3), 85.490)  # Last value with exact precision
})
