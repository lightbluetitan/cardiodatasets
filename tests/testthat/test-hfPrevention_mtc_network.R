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

# hfPrevention_mtc_network dataset

library(testthat)

# Test 1: Class and Basic Structure (READ-ONLY)
test_that("hfPrevention_mtc_network has correct class and structure", {
  expect_s3_class(hfPrevention_mtc_network, "mtc.network")
  expect_length(hfPrevention_mtc_network, 4)
  expect_identical(names(hfPrevention_mtc_network),
                   c("description", "treatments", "data.ab", "studies"))
})

# Test 2: Description Verification (SAFE CHECK)
test_that("Description component is valid", {
  desc <- hfPrevention_mtc_network$description  # Local copy
  expect_type(desc, "character")
  expect_match(desc, "Cholesterol lowering in HF")  # Checks partial match
})

# Test 3: Treatments Validation (NON-MODIFYING)
test_that("Treatments component is correct", {
  treatments <- hfPrevention_mtc_network$treatments  # Local copy
  expect_s3_class(treatments, "data.frame")
  expect_equal(dim(treatments), c(2, 2))
  expect_identical(names(treatments), c("id", "description"))
  expect_s3_class(treatments$id, "factor")
  expect_type(treatments$description, "character")
  expect_equal(nlevels(treatments$id), 2)
})

# Test 4: Data.ab Verification (IMMUTABLE)
test_that("Data.ab component is correct", {
  data_ab <- hfPrevention_mtc_network$data.ab  # Local copy
  expect_s3_class(data_ab, "data.frame")
  expect_equal(dim(data_ab), c(38, 4))
  expect_identical(names(data_ab),
                   c("study", "treatment", "responders", "sampleSize"))
  expect_s3_class(data_ab$study, "factor")
  expect_s3_class(data_ab$treatment, "factor")
  expect_type(data_ab$responders, "integer")
  expect_type(data_ab$sampleSize, "integer")
  expect_equal(nlevels(data_ab$treatment), 2)
})

# Test 5: Studies Verification (SAFE CHECK)
test_that("Studies component is correct", {
  studies <- hfPrevention_mtc_network$studies  # Local copy
  expect_s3_class(studies, "data.frame")
  expect_equal(dim(studies), c(19, 2))
  expect_identical(names(studies), c("study", "secondary"))
  expect_s3_class(studies$study, "factor")
  expect_type(studies$secondary, "integer")
  expect_equal(nlevels(studies$study), 19)
})

# Test 6: Immutability Check (FINAL VERIFICATION)
test_that("Dataset remains unmodified", {
  # Verify critical properties directly
  expect_s3_class(hfPrevention_mtc_network, "mtc.network")
  expect_equal(dim(hfPrevention_mtc_network$treatments), c(2, 2))
  expect_equal(dim(hfPrevention_mtc_network$data.ab), c(38, 4))
  expect_equal(dim(hfPrevention_mtc_network$studies), c(19, 2))
})
