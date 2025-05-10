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

# emotion_heartrate_df dataset


library(testthat)

# Test 1: Structure Verification (READ-ONLY)
test_that("emotion_heartrate_df has correct structure", {
  expect_s3_class(emotion_heartrate_df, "data.frame")
  expect_equal(dim(emotion_heartrate_df), c(68, 3))
  expect_identical(names(emotion_heartrate_df),
                   c("ID", "HR_baseline", "HR_anger"))
})

# Test 2: Column Type Validation (SAFE)
test_that("Column types are correct", {
  expect_type(emotion_heartrate_df$ID, "integer")
  expect_type(emotion_heartrate_df$HR_baseline, "double")
  expect_type(emotion_heartrate_df$HR_anger, "double")
})

# Test 3: Physiological Range Checks (NON-MODIFYING)
test_that("Heart rate values are physiologically valid", {
  # Normal resting HR range (30-200 bpm)
  expect_true(all(emotion_heartrate_df$HR_baseline >= 30 &
                    emotion_heartrate_df$HR_baseline <= 200))

  expect_true(all(emotion_heartrate_df$HR_anger >= 30 &
                    emotion_heartrate_df$HR_anger <= 200))
})

# Test 4: ID Uniqueness (SAFE)
test_that("Participant IDs are unique", {
  expect_equal(length(unique(emotion_heartrate_df$ID)), 68)
})

# Test 5: Attribute Preservation (IMMUTABLE)
test_that("Special attributes remain intact", {
  expect_true(!is.null(attr(emotion_heartrate_df, "removedRows")))
  expect_true(!is.null(attr(emotion_heartrate_df, "addedRows")))
  expect_true(!is.null(attr(emotion_heartrate_df, "transforms")))
})

# Test 6: Immutability Check (FINAL VERIFICATION)
test_that("Dataset remains unmodified", {
  # Verify ID sum as proxy for immutability
  original_id_sum <- sum(emotion_heartrate_df$ID)
  expect_equal(sum(emotion_heartrate_df$ID), original_id_sum)
})



