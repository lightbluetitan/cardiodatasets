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

# cardiovascular_list dataset


library(testthat)

test_that("cardiovascular_list has correct structure and class", {
  # Test overall object structure
  expect_type(cardiovascular_list, "list")
  expect_length(cardiovascular_list, 4)
  expect_equal(names(cardiovascular_list), c("Study", "Treat", "Outcomes", "N"))

  # Test Study component
  expect_type(cardiovascular_list$Study, "integer")
  expect_length(cardiovascular_list$Study, 34)
  expect_false(any(is.na(cardiovascular_list$Study)),
               info = "NAs found in Study component")

  # Test Treat component
  expect_type(cardiovascular_list$Treat, "double")
  expect_length(cardiovascular_list$Treat, 34)
  expect_false(any(is.na(cardiovascular_list$Treat)),
               info = "NAs found in Treat component")

  # Test Outcomes matrix component
  expect_true(is.matrix(cardiovascular_list$Outcomes))
  expect_equal(dim(cardiovascular_list$Outcomes), c(34, 3))
  expect_type(cardiovascular_list$Outcomes, "double")
  expect_equal(dimnames(cardiovascular_list$Outcomes)[[2]], c("Alive", "FnCVD", "FCVD"))
  expect_false(any(is.na(cardiovascular_list$Outcomes)),
               info = "NAs found in Outcomes matrix")

  # Test N component
  expect_type(cardiovascular_list$N, "double")
  expect_length(cardiovascular_list$N, 34)
  expect_false(any(is.na(cardiovascular_list$N)),
               info = "NAs found in N component")
})

test_that("cardiovascular_list dimensions are consistent across components", {
  # Verify all components have matching lengths
  expect_equal(length(cardiovascular_list$Study), nrow(cardiovascular_list$Outcomes))
  expect_equal(length(cardiovascular_list$Treat), nrow(cardiovascular_list$Outcomes))
  expect_equal(length(cardiovascular_list$N), nrow(cardiovascular_list$Outcomes))
})

test_that("cardiovascular_list remains unchanged after tests", {
  original_study <- cardiovascular_list$Study
  original_treat <- cardiovascular_list$Treat
  original_outcomes <- cardiovascular_list$Outcomes
  original_n <- cardiovascular_list$N

  # Run some example checks
  n_studies <- length(cardiovascular_list$Study)
  outcome_names <- dimnames(cardiovascular_list$Outcomes)[[2]]

  # Verify immutability
  expect_identical(cardiovascular_list$Study, original_study)
  expect_identical(cardiovascular_list$Treat, original_treat)
  expect_identical(cardiovascular_list$Outcomes, original_outcomes)
  expect_identical(cardiovascular_list$N, original_n)
  expect_equal(n_studies, 34)
  expect_equal(outcome_names, c("Alive", "FnCVD", "FCVD"))
})



