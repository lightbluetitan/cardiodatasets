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

# cardiac_gwas_df dataset


library(testthat)

# Test dataset structure and class
test_that("cardiac_gwas_df has correct structure", {
  expect_s3_class(cardiac_gwas_df, "data.frame")
  expect_equal(dim(cardiac_gwas_df), c(9919, 7))

  expected_cols <- c("beta_flipped", "gcse", "variants", "studies", "cases",
                     "controls", "fdr214_gwas46")
  expect_equal(names(cardiac_gwas_df), expected_cols)
})

# Test data types of columns
test_that("cardiac_gwas_df has correct column types", {
  expect_type(cardiac_gwas_df$beta_flipped, "double")
  expect_type(cardiac_gwas_df$gcse, "double")
  expect_type(cardiac_gwas_df$variants, "character")
  expect_type(cardiac_gwas_df$studies, "character")
  expect_type(cardiac_gwas_df$cases, "integer")
  expect_type(cardiac_gwas_df$controls, "integer")
  expect_type(cardiac_gwas_df$fdr214_gwas46, "double")
})

# Test for valid data presence (minimal checks)
test_that("cardiac_gwas_df contains appropriate values", {
  # Check basic type consistency
  expect_true(is.numeric(cardiac_gwas_df$beta_flipped) || all(is.na(cardiac_gwas_df$beta_flipped)))
  expect_true(is.numeric(cardiac_gwas_df$gcse) || all(is.na(cardiac_gwas_df$gcse)))
  expect_true(is.character(cardiac_gwas_df$variants) || all(is.na(cardiac_gwas_df$variants)))

  # Check sample sizes are integers when present
  if(any(!is.na(cardiac_gwas_df$cases))) {
    expect_true(is.integer(cardiac_gwas_df$cases))
  }
  if(any(!is.na(cardiac_gwas_df$controls))) {
    expect_true(is.integer(cardiac_gwas_df$controls))
  }
})

# Test dataset immutability
test_that("cardiac_gwas_df remains unchanged", {
  original_structure <- capture.output(str(cardiac_gwas_df))

  # Perform read-only operations
  head(cardiac_gwas_df)
  summary(cardiac_gwas_df$beta_flipped)

  expect_identical(capture.output(str(cardiac_gwas_df)), original_structure)
})



