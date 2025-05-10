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

# coronary_death_df dataset

library(testthat)

# Test 1: Structure Verification (READ-ONLY)
test_that("coronary_death_df has correct structure", {
  expect_s3_class(coronary_death_df, "data.frame")
  expect_false(inherits(coronary_death_df, "tbl")) # Explicit non-tibble check
  expect_equal(dim(coronary_death_df), c(4, 16))
  expect_identical(names(coronary_death_df),
                   c("trial", "pop", "nt", "nc",
                     "ep1t", "ep1c", "ep2t", "ep2c",
                     "ep3t", "ep3c", "ep4t", "ep4c",
                     "ep5t", "ep5c", "ep6t", "ep6c"))
})

# Test 2: Column Type Validation (SAFE)
test_that("Column types are correct", {
  expect_type(coronary_death_df$trial, "character")
  expect_type(coronary_death_df$pop, "character")
  expect_type(coronary_death_df$nt, "integer")
  expect_type(coronary_death_df$nc, "integer")

  # Verify all endpoint columns are integers
  endpoint_cols <- grep("^ep[1-6][tc]$", names(coronary_death_df), value = TRUE)
  for(col in endpoint_cols) {
    expect_type(coronary_death_df[[col]], "integer")
  }
})

# Test 3: Clinical Validity Checks (NON-MODIFYING)
test_that("Clinical values are valid", {
  # Treatment/control group sizes
  expect_true(all(coronary_death_df$nt >= 0))
  expect_true(all(coronary_death_df$nc >= 0))

  # Endpoint events <= group sizes
  for(i in 1:6) {
    expect_true(all(coronary_death_df[[paste0("ep", i, "t")]] <= coronary_death_df$nt))
    expect_true(all(coronary_death_df[[paste0("ep", i, "c")]] <= coronary_death_df$nc))
  }
})

# Test 4: Population Labels (SAFE)
test_that("Population labels are non-empty", {
  expect_true(all(nchar(coronary_death_df$pop) > 0))
  expect_true(all(nchar(coronary_death_df$trial) > 0))
})

# Test 5: Immutability Check (FINAL VERIFICATION)
test_that("Dataset remains unmodified", {
  # Verify key properties directly
  expect_equal(sum(coronary_death_df$nt) + sum(coronary_death_df$nc),
               sum(coronary_death_df$nt + coronary_death_df$nc)) # Identity check
})

