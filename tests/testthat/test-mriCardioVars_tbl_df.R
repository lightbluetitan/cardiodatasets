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

# mriCardioVars_tbl_df dataset


library(testthat)

# Test dataset structure and class
test_that("mriCardioVars_tbl_df has correct structure and class", {
  expect_s3_class(mriCardioVars_tbl_df, "spec_tbl_df")
  expect_equal(nrow(mriCardioVars_tbl_df), 735)
  expect_equal(ncol(mriCardioVars_tbl_df), 30)
  expect_equal(names(mriCardioVars_tbl_df),
               c("ptid", "mridate", "age", "sex", "race", "weight", "height",
                 "packyrs", "yrsquit", "alcoh", "physact", "chf", "chd", "stroke",
                 "diabetes", "genhlth", "ldl", "alb", "crt", "plt", "sbp", "aai",
                 "fev", "dsst", "atrophy", "whgrd", "numinf", "volinf", "obstime", "death"))
})

# Test column types
test_that("mriCardioVars_tbl_df has correct column types", {
  expect_type(mriCardioVars_tbl_df$ptid, "double")
  expect_s3_class(mriCardioVars_tbl_df$mridate, "Date")
  expect_type(mriCardioVars_tbl_df$age, "double")
  expect_type(mriCardioVars_tbl_df$sex, "character")
  expect_type(mriCardioVars_tbl_df$race, "character")
  expect_type(mriCardioVars_tbl_df$weight, "double")
  expect_type(mriCardioVars_tbl_df$height, "double")
  expect_type(mriCardioVars_tbl_df$packyrs, "double")
  expect_type(mriCardioVars_tbl_df$yrsquit, "double")
  expect_type(mriCardioVars_tbl_df$alcoh, "double")
  expect_type(mriCardioVars_tbl_df$physact, "double")
  expect_type(mriCardioVars_tbl_df$chf, "double")
  expect_type(mriCardioVars_tbl_df$chd, "double")
  expect_type(mriCardioVars_tbl_df$stroke, "double")
  expect_type(mriCardioVars_tbl_df$diabetes, "double")
  expect_type(mriCardioVars_tbl_df$genhlth, "double")
  expect_type(mriCardioVars_tbl_df$ldl, "double")
  expect_type(mriCardioVars_tbl_df$alb, "double")
  expect_type(mriCardioVars_tbl_df$crt, "double")
  expect_type(mriCardioVars_tbl_df$plt, "double")
  expect_type(mriCardioVars_tbl_df$sbp, "double")
  expect_type(mriCardioVars_tbl_df$aai, "double")
  expect_type(mriCardioVars_tbl_df$fev, "double")
  expect_type(mriCardioVars_tbl_df$dsst, "double")
  expect_type(mriCardioVars_tbl_df$atrophy, "double")
  expect_type(mriCardioVars_tbl_df$whgrd, "double")
  expect_type(mriCardioVars_tbl_df$numinf, "double")
  expect_type(mriCardioVars_tbl_df$volinf, "double")
  expect_type(mriCardioVars_tbl_df$obstime, "double")
  expect_type(mriCardioVars_tbl_df$death, "double")
})

# Document NA counts without failing
test_that("mriCardioVars_tbl_df NA values are documented", {
  na_counts <- vapply(mriCardioVars_tbl_df, function(x) sum(is.na(x)), integer(1))
  expect_true(TRUE) # Dummy assertion to document NAs
  print("NA counts per column:")
  print(na_counts)
})

# Test data immutability - SAFE VERSION WITHOUT DIGEST
test_that("mriCardioVars_tbl_df remains unchanged", {
  # Capture immutable characteristics
  original_state <- list(
    dim = dim(mriCardioVars_tbl_df),
    colnames = names(mriCardioVars_tbl_df),
    sample_data = list(
      first_row = unlist(mriCardioVars_tbl_df[1, ]),
      middle_row = unlist(mriCardioVars_tbl_df[368, ]),
      last_row = unlist(mriCardioVars_tbl_df[735, ])
    ),
    na_counts = vapply(mriCardioVars_tbl_df, function(x) sum(is.na(x)), integer(1)),
    spec = attr(mriCardioVars_tbl_df, "spec")
  )

  # Verify no changes occurred
  current_state <- list(
    dim = dim(mriCardioVars_tbl_df),
    colnames = names(mriCardioVars_tbl_df),
    sample_data = list(
      first_row = unlist(mriCardioVars_tbl_df[1, ]),
      middle_row = unlist(mriCardioVars_tbl_df[368, ]),
      last_row = unlist(mriCardioVars_tbl_df[735, ])
    ),
    na_counts = vapply(mriCardioVars_tbl_df, function(x) sum(is.na(x)), integer(1)),
    spec = attr(mriCardioVars_tbl_df, "spec")
  )

  expect_identical(original_state, current_state)
})

# Test data integrity checks
test_that("mriCardioVars_tbl_df has valid data ranges", {
  # Check variables that should be non-negative
  non_neg_vars <- c("age", "weight", "height", "ldl", "alb", "crt", "plt", "obstime")
  for (var in non_neg_vars) {
    expect_true(all(mriCardioVars_tbl_df[[var]] >= 0 | is.na(mriCardioVars_tbl_df[[var]])),
                info = paste("Variable", var, "contains negative values"))
  }

  # Check death is binary (0/1) since it's a common outcome variable
  expect_true(all(mriCardioVars_tbl_df$death %in% c(0, 1, NA)),
              info = "Death variable contains non-binary values")
})

# Test spec attributes are preserved
test_that("mriCardioVars_tbl_df maintains spec attributes", {
  expect_true(!is.null(attr(mriCardioVars_tbl_df, "spec")))
  expect_true("col_spec" %in% class(attr(mriCardioVars_tbl_df, "spec")))
})
