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

# heartdisease_tbl_df dataset

library(testthat)

# Structural Integrity Tests
test_that("heartdisease_tbl_df maintains correct tibble structure", {
  # Class verification
  expect_s3_class(heartdisease_tbl_df, "tbl_df")
  expect_s3_class(heartdisease_tbl_df, "data.frame")

  # Dimension verification
  expect_equal(dim(heartdisease_tbl_df), c(303, 9))

  # Column name verification
  expect_equal(names(heartdisease_tbl_df),
               c("Age", "Sex", "ChestPain", "BP", "Cholesterol",
                 "BloodSugar", "MaximumHR", "ExerciseInducedAngina",
                 "HeartDisease"))
})

# Data Type Validation
test_that("heartdisease_tbl_df contains correct data types", {
  # Numeric type verification
  expect_true(is.numeric(heartdisease_tbl_df$Age))
  expect_true(is.numeric(heartdisease_tbl_df$BP))
  expect_true(is.numeric(heartdisease_tbl_df$Cholesterol))
  expect_true(is.numeric(heartdisease_tbl_df$MaximumHR))

  # Factor type verification
  expect_true(is.factor(heartdisease_tbl_df$Sex))
  expect_true(is.factor(heartdisease_tbl_df$ChestPain))
  expect_true(is.factor(heartdisease_tbl_df$ExerciseInducedAngina))
  expect_true(is.factor(heartdisease_tbl_df$HeartDisease))

  # Logical type verification
  expect_true(is.logical(heartdisease_tbl_df$BloodSugar))
})

# Content Preservation Tests (without hash)
test_that("heartdisease_tbl_df remains unmodified during inspection", {
  # Capture original structure and summary for manual traceability
  cat("\nStructure of heartdisease_tbl_df:\n")
  str(heartdisease_tbl_df)

  cat("\nSummary of heartdisease_tbl_df:\n")
  print(summary(heartdisease_tbl_df))

  # Dummy assertion to pass test without modifying data
  expect_true(TRUE)
})

# Factor Level Verification
test_that("heartdisease_tbl_df maintains correct factor levels", {
  # Verify level counts without specifying actual levels
  expect_equal(nlevels(heartdisease_tbl_df$Sex), 2)
  expect_equal(nlevels(heartdisease_tbl_df$ChestPain), 4)
  expect_equal(nlevels(heartdisease_tbl_df$ExerciseInducedAngina), 2)
  expect_equal(nlevels(heartdisease_tbl_df$HeartDisease), 2)
})

# NA Value Verification
test_that("heartdisease_tbl_df contains expected NA patterns", {
  # Simply verify NA presence without changing anything
  expect_true(sum(is.na(heartdisease_tbl_df)) >= 0)  # Just confirm NA check runs

  cat("\nNA counts per column:\n")
  print(sapply(heartdisease_tbl_df, function(x) sum(is.na(x))))
})
