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

# view_datasets()  function


library(testthat)
library(CardioDataSets)

test_that("view_datasets works when package is loaded", {
  result <- view_datasets()
  expect_type(result, "character")
  expect_true(length(result) > 0)
})

test_that("view_datasets prints correct message", {
  output <- capture_messages(view_datasets())
  expect_match(
    output[1],
    "Datasets available in the 'CardioDataSets' package:",
    fixed = TRUE
  )
})

test_that("view_datasets returns expected datasets", {
  datasets <- view_datasets()
  expected_datasets <- c(
    "heartdisease_tbl_df",
    "hfPrevention_mtc_network",
    "cad_anticoagulants_df",
    "coronary_death_df",
    "myocardialinfarction_df",
    "emotion_heartrate_df",
    "cardio_diabetes_tbl_df",
    "cpr_survival_tbl_df",
    "sulphinpyrazone_tbl_df",
    "ami_occurrences_tbl_df",
    "heartfailure_df",
    "cardiac_failure_df",
    "cardioRiskFactors_df",
    "cv_mortality_ts",
    "muscatine_coronary_risk_df",
    "statinMIrisk_df",
    "aortaDiss_tbl_df",
    "mriCardioVars_tbl_df",
    "usMortality_df",
    "heart_transplant_df",
    "heartTransplantTime_tbl_df",
    "heartdiseaserisk_tbl_df",
    "patient_CAV_df",
    "cardiovascular_list",
    "betablockers_matrix",
    "scottish_CVD_df",
    "acs_patients_df",
    "age_heartrate_df",
    "radial_ivus_df",
    "cardiac_gwas_df"

  )
  # Check if all expected datasets are present
  missing_datasets <- setdiff(expected_datasets, datasets)
  expect_true(
    length(missing_datasets) == 0,
    info = paste("Missing datasets:", paste(missing_datasets, collapse = ", "))
  )
})
