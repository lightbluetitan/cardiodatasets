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

# betablockers_matrix dataset


library(testthat)

test_that("betablockers_matrix has correct structure and class", {
  # Test overall object structure
  expect_true(is.matrix(betablockers_matrix))
  expect_equal(class(betablockers_matrix), c("matrix", "array"))
  expect_equal(length(betablockers_matrix), 4509)
  expect_equal(dim(betablockers_matrix), c(501, 9))

  # Test matrix content type
  expect_type(betablockers_matrix, "integer")
  expect_true(is.integer(betablockers_matrix))

  # Test dimnames structure
  expect_type(attr(betablockers_matrix, "dimnames"), "list")
  expect_length(attr(betablockers_matrix, "dimnames"), 2)

  # Test row names
  row_names <- dimnames(betablockers_matrix)[[1]]
  expect_type(row_names, "character")
  expect_length(row_names, 501)
  expect_false(any(is.na(row_names)),
               info = "NA values found in row names")

  # Test column names
  col_names <- dimnames(betablockers_matrix)[[2]]
  expect_type(col_names, "character")
  expect_length(col_names, 9)
  expect_false(any(is.na(col_names)),
               info = "NA values found in column names")
})

test_that("betablockers_matrix has valid data content", {
  # Test matrix values (without checking specific values to maintain flexibility)
  expect_true(all(!is.na(betablockers_matrix)),
              info = "NA values found in matrix data")
  expect_true(is.numeric(betablockers_matrix))

  # Test value ranges (adjust if specific ranges are known)
  expect_true(all(betablockers_matrix >= 0),
              info = "Negative values found in matrix")
})

test_that("betablockers_matrix remains unchanged after tests", {
  original_matrix <- betablockers_matrix
  original_dimnames <- dimnames(betablockers_matrix)

  # Run some example checks
  matrix_sum <- sum(betablockers_matrix)
  row_count <- nrow(betablockers_matrix)
  col_count <- ncol(betablockers_matrix)

  # Verify immutability
  expect_identical(betablockers_matrix, original_matrix)
  expect_identical(dimnames(betablockers_matrix), original_dimnames)
  expect_equal(row_count, 501)
  expect_equal(col_count, 9)
  expect_true(matrix_sum > 0, info = "Matrix sum should be positive")
})




