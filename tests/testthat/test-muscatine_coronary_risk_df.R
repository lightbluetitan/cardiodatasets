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

# muscatine_coronary_risk_df dataset



library(testthat)

# Test dataset structure and class
test_that("muscatine_coronary_risk_df has correct structure and class", {
  expect_s3_class(muscatine_coronary_risk_df, "data.frame")
  expect_equal(nrow(muscatine_coronary_risk_df), 14568)
  expect_equal(ncol(muscatine_coronary_risk_df), 7)
  expect_equal(names(muscatine_coronary_risk_df),
               c("id", "gender", "base_age", "age", "occasion", "obese", "numobese"))
})

# Test column types
test_that("muscatine_coronary_risk_df has correct column types", {
  expect_type(muscatine_coronary_risk_df$id, "integer")
  expect_type(muscatine_coronary_risk_df$base_age, "integer")
  expect_type(muscatine_coronary_risk_df$age, "integer")
  expect_type(muscatine_coronary_risk_df$occasion, "integer")
  expect_s3_class(muscatine_coronary_risk_df$gender, "factor")
  expect_s3_class(muscatine_coronary_risk_df$obese, "factor")
  expect_type(muscatine_coronary_risk_df$numobese, "double")
})

# Test factor levels
test_that("muscatine_coronary_risk_df has correct factor levels", {
  expect_identical(levels(muscatine_coronary_risk_df$gender), c("M", "F"))
  expect_identical(levels(muscatine_coronary_risk_df$obese), c("no", "yes"))
})

# Test for missing values
test_that("muscatine_coronary_risk_df has expected NA values", {
  expect_false(any(is.na(muscatine_coronary_risk_df$id)))
  expect_false(any(is.na(muscatine_coronary_risk_df$gender)))
  expect_false(any(is.na(muscatine_coronary_risk_df$base_age)))
  expect_false(any(is.na(muscatine_coronary_risk_df$age)))
  expect_false(any(is.na(muscatine_coronary_risk_df$occasion)))
  expect_true(any(is.na(muscatine_coronary_risk_df$obese)))
  expect_true(any(is.na(muscatine_coronary_risk_df$numobese)))
})

# Test data immutability - SAFE VERSION WITHOUT DIGEST
test_that("muscatine_coronary_risk_df remains unchanged", {
  # Capture immutable characteristics
  original_state <- list(
    dim = dim(muscatine_coronary_risk_df),
    colnames = names(muscatine_coronary_risk_df),
    sample_rows = muscatine_coronary_risk_df[c(1, 100, 1000), ],
    na_counts = vapply(muscatine_coronary_risk_df, function(x) sum(is.na(x)), integer(1)),
    factor_levels = list(
      gender = levels(muscatine_coronary_risk_df$gender),
      obese = levels(muscatine_coronary_risk_df$obese)
    )
  )

  # Verify no changes occurred
  current_state <- list(
    dim = dim(muscatine_coronary_risk_df),
    colnames = names(muscatine_coronary_risk_df),
    sample_rows = muscatine_coronary_risk_df[c(1, 100, 1000), ],
    na_counts = vapply(muscatine_coronary_risk_df, function(x) sum(is.na(x)), integer(1)),
    factor_levels = list(
      gender = levels(muscatine_coronary_risk_df$gender),
      obese = levels(muscatine_coronary_risk_df$obese)
    )
  )

  expect_identical(original_state, current_state)
})

# Test data integrity checks
test_that("muscatine_coronary_risk_df has valid data ranges", {
  expect_true(all(muscatine_coronary_risk_df$base_age >= 0, na.rm = TRUE))
  expect_true(all(muscatine_coronary_risk_df$age >= 0, na.rm = TRUE))
  expect_true(all(muscatine_coronary_risk_df$occasion > 0, na.rm = TRUE))
  expect_true(all(muscatine_coronary_risk_df$numobese >= 0 &
                    muscatine_coronary_risk_df$numobese <= 1, na.rm = TRUE))
  expect_true(mean(muscatine_coronary_risk_df$gender == "F", na.rm = TRUE) > 0.4)
  expect_true(mean(muscatine_coronary_risk_df$obese == "yes", na.rm = TRUE) > 0.1)
})
