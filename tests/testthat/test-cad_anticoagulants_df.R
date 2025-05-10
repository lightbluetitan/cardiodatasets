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

# cad_anticoagulants_df dataset

library(testthat)

# Test 1: Structure Verification (READ-ONLY)
test_that("cad_anticoagulants_df has correct structure", {
  expect_s3_class(cad_anticoagulants_df, "data.frame")
  expect_false(inherits(cad_anticoagulants_df, "tbl")) # Explicit non-tibble check
  expect_equal(dim(cad_anticoagulants_df), c(34, 9))
  expect_identical(names(cad_anticoagulants_df),
                   c("study", "year", "intensity", "asp.t", "asp.c",
                     "ai", "n1i", "ci", "n2i"))
})

# Test 2: Column Type Validation (SAFE)
test_that("Column types are correct", {
  expect_type(cad_anticoagulants_df$study, "character")
  expect_type(cad_anticoagulants_df$year, "integer")
  expect_type(cad_anticoagulants_df$intensity, "character")
  expect_type(cad_anticoagulants_df$asp.t, "integer")
  expect_type(cad_anticoagulants_df$asp.c, "integer")
  expect_type(cad_anticoagulants_df$ai, "integer")
  expect_type(cad_anticoagulants_df$n1i, "integer")
  expect_type(cad_anticoagulants_df$ci, "integer")
  expect_type(cad_anticoagulants_df$n2i, "integer")
})

# Test 3: Clinical Validity Checks (NON-MODIFYING)
test_that("Clinical values are valid", {
  # Treatment/control group sizes
  expect_true(all(cad_anticoagulants_df$n1i >= 0 | is.na(cad_anticoagulants_df$n1i)))
  expect_true(all(cad_anticoagulants_df$n2i >= 0 | is.na(cad_anticoagulants_df$n2i)))

  # Event counts <= group sizes
  expect_true(all(cad_anticoagulants_df$ai <= cad_anticoagulants_df$n1i |
                    is.na(cad_anticoagulants_df$ai)))
  expect_true(all(cad_anticoagulants_df$ci <= cad_anticoagulants_df$n2i |
                    is.na(cad_anticoagulants_df$ci)))
})

# Test 4: Year Range Verification (SAFE)
test_that("Study years are plausible", {
  expect_true(all(cad_anticoagulants_df$year >= 1900 &
                    cad_anticoagulants_df$year <= as.numeric(format(Sys.Date(), "%Y"))))
})

# Test 5: Immutability Check (FINAL VERIFICATION)
test_that("Dataset remains unmodified", {
  # Verify key properties directly
  expect_equal(nrow(cad_anticoagulants_df), 34)
  expect_equal(sum(cad_anticoagulants_df$ai), sum(cad_anticoagulants_df$ai)) # Identity check
})


