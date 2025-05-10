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


#' Heart Disease Patients Clinical Data
#'
#' This dataset, heartdisease_tbl_df, is a tibble containing information on individuals
#' evaluated for heart disease. It is a cleaned version of the original "Heart Disease" dataset
#' from the UCI Machine Learning Repository, and includes 303 observations on 9 variables.
#'
#' The dataset name has been kept as 'heartdisease_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble. The original content has not been modified
#' in any way.
#'
#' @name heartdisease_tbl_df
#' @format A tibble with 303 observations and 9 variables:
#' \describe{
#'   \item{Age}{Age of the individual (numeric).}
#'   \item{Sex}{Sex of the individual (factor with 2 levels: typically "Male" and "Female").}
#'   \item{ChestPain}{Type of chest pain experienced (factor with 4 levels).}
#'   \item{BP}{Resting blood pressure (numeric).}
#'   \item{Cholesterol}{Serum cholesterol in mg/dl (numeric).}
#'   \item{BloodSugar}{Indicates if fasting blood sugar > 120 mg/dl (logical).}
#'   \item{MaximumHR}{Maximum heart rate achieved (numeric).}
#'   \item{ExerciseInducedAngina}{Exercise-induced angina (factor with 2 levels).}
#'   \item{HeartDisease}{Presence or absence of heart disease (factor with 2 levels).}
#' }
#' @source Data taken from the cheese package version 0.1.2. Original source:
#' UCI Machine Learning Repository. Heart Disease Data Set.
#' \url{https://archive.ics.uci.edu/ml/datasets/Heart+Disease}
#' @usage data(heartdisease_tbl_df)
#' @export
load("data/heartdisease_tbl_df.rda")
NULL



#' Statins for Heart Failure Prevention
#'
#' This dataset, hfPrevention_mtc_network, contains network meta-analysis data from 19 trials
#' comparing statins versus placebo or usual care for cholesterol lowering in heart failure.
#' The main outcome measured is the number of deaths. Trials are categorized as either
#' primary prevention (no previous heart disease) or secondary prevention (previous heart disease).
#'
#' The dataset name has been kept as 'hfPrevention_mtc_network' to maintain consistency with
#' its original source and to avoid confusion with other datasets. This naming convention helps
#' identify this specific network meta-analysis dataset from the CardioDataSets package.
#' The dataset is structured as an 'mtc.network' object, which is the standard format for
#' network meta-analysis in the gemtc package. The original content has not been modified.
#'
#' @name hfPrevention_mtc_network
#' @format An 'mtc.network' object (list) with 4 components:
#' \describe{
#'   \item{description}{Character string describing the analysis: "Cholesterol lowering in HF (outcome: death)"}
#'   \item{treatments}{Data frame with 2 treatments:
#'     \describe{
#'       \item{id}{Treatment ID (factor with 2 levels)}
#'       \item{description}{Treatment description (character vector)}
#'     }
#'   }
#'   \item{data.ab}{Data frame with 38 rows (arm-level data):
#'     \describe{
#'       \item{study}{Study ID (factor with 19 levels)}
#'       \item{treatment}{Treatment assignment (factor with 2 levels)}
#'       \item{responders}{Number of deaths (integer vector)}
#'       \item{sampleSize}{Total sample size per arm (integer vector)}
#'     }
#'   }
#'   \item{studies}{Data frame with 19 rows (study-level data):
#'     \describe{
#'       \item{study}{Study ID (factor with 19 levels)}
#'       \item{secondary}{Prevention type: 0 = primary, 1 = secondary (integer vector)}
#'     }
#'   }
#' }
#' @source Data taken from the gemtc package version 1.0-2. Original publication:
#' Dias S, Sutton AJ, Welton NJ, Ades AE (2013).
#' "Heterogeneity - Subgroups, Meta-Regression, Bias, and Bias-Adjustment."
#' Medical Decision Making, 33(5):618-640.
#' @usage data(hfPrevention_mtc_network)
#' @export
load("data/hfPrevention_mtc_network.rda")
NULL



#' Anticoagulants for CAD Patients
#'
#' This dataset, cad_anticoagulants_df, is a data frame containing information from 34 clinical trials
#' examining the effectiveness of oral anticoagulants in patients with coronary artery disease.
#' It includes data on treatment outcomes comparing anticoagulant therapy with control groups.
#'
#' The dataset name has been kept as 'cad_anticoagulants_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a standard data frame. The original content has not been modified
#' in any way.
#'
#' @name cad_anticoagulants_df
#' @format A data frame with 34 observations and 9 variables:
#' \describe{
#'   \item{study}{Study identifier (character vector)}
#'   \item{year}{Year of publication (integer vector)}
#'   \item{intensity}{Intensity of anticoagulation treatment (character vector)}
#'   \item{asp.t}{Aspirin use in treatment group (integer vector)}
#'   \item{asp.c}{Aspirin use in control group (integer vector)}
#'   \item{ai}{Number of events in treatment group (integer vector)}
#'   \item{n1i}{Total number of participants in treatment group (integer vector)}
#'   \item{ci}{Number of events in control group (integer vector)}
#'   \item{n2i}{Total number of participants in control group (integer vector)}
#' }
#' @source Data taken from the metadat package version 1.2-0
#' @usage data(cad_anticoagulants_df)
#' @export
load("data/cad_anticoagulants_df.rda")
NULL

#' High vs Moderate Statins for MI Prevention
#'
#' This dataset, coronary_death_df, is a data frame containing information from 4 clinical trials
#' comparing intensive (high dose) versus moderate (standard dose) statin therapy for preventing
#' coronary death or myocardial infarction. It includes data on treatment outcomes across multiple
#' endpoints.
#'
#' The dataset name has been kept as 'coronary_death_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a standard data frame. The original content has not been modified
#' in any way.
#'
#' @name coronary_death_df
#' @format A data frame with 4 observations and 16 variables:
#' \describe{
#' \item{trial}{Trial identifier (character vector)}
#' \item{pop}{Patient population description (character vector)}
#' \item{nt}{Number of patients in treatment group (integer vector)}
#' \item{nc}{Number of patients in control group (integer vector)}
#' \item{ep1t}{Endpoint 1 events in treatment group (integer vector)}
#' \item{ep1c}{Endpoint 1 events in control group (integer vector)}
#' \item{ep2t}{Endpoint 2 events in treatment group (integer vector)}
#' \item{ep2c}{Endpoint 2 events in control group (integer vector)}
#' \item{ep3t}{Endpoint 3 events in treatment group (integer vector)}
#' \item{ep3c}{Endpoint 3 events in control group (integer vector)}
#' \item{ep4t}{Endpoint 4 events in treatment group (integer vector)}
#' \item{ep4c}{Endpoint 4 events in control group (integer vector)}
#' \item{ep5t}{Endpoint 5 events in treatment group (integer vector)}
#' \item{ep5c}{Endpoint 5 events in control group (integer vector)}
#' \item{ep6t}{Endpoint 6 events in treatment group (integer vector)}
#' \item{ep6c}{Endpoint 6 events in control group (integer vector)}
#' }
#' @source Data taken from the metadat package version 1.2-0
#' @usage data(coronary_death_df)
#' @export
load("data/coronary_death_df.rda")
NULL


#' Streptokinase Therapy in AMI
#'
#' This dataset, myocardialinfarction_df, is a data frame containing information from 33 clinical trials
#' comparing intravenous streptokinase versus placebo or no therapy in patients hospitalized for
#' acute myocardial infarction. It includes data on treatment outcomes between intervention and control groups.
#'
#' The dataset name has been kept as 'myocardialinfarction_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a standard data frame. The original content has not been modified
#' in any way.
#'
#' @name myocardialinfarction_df
#' @format A data frame with 33 observations and 6 variables:
#' \describe{
#'   \item{trial}{Trial identifier (character vector)}
#'   \item{year}{Year of publication (integer vector)}
#'   \item{ai}{Number of events in treatment group (integer vector)}
#'   \item{n1i}{Total number of participants in treatment group (integer vector)}
#'   \item{ci}{Number of events in control group (integer vector)}
#'   \item{n2i}{Total number of participants in control group (integer vector)}
#' }
#' @source Data taken from the metadat package version 1.2-0. Original publication:
#' Lau J, Antman EM, Jimenez-Silva J, Kupelnick B, Mosteller F, Chalmers TC (1992).
#' "Cumulative meta-analysis of therapeutic trials for myocardial infarction."
#' New England Journal of Medicine, 327(4):248-254.
#' @usage data(myocardialinfarction_df)
#' @export
load("data/myocardialinfarction_df.rda")
NULL




#' Anger recall effect on heart rate (Lakens, 2013)
#'
#' This dataset, emotion_heartrate_df, is a data frame containing heart rate measurements
#' from a study investigating how recalling anger affects heart rate. It includes baseline
#' and anger-induced heart rate measurements from 68 participants.
#'
#' The dataset name has been kept as 'emotion_heartrate_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a standard data frame. The original content has not been modified
#' in any way.
#'
#' @name emotion_heartrate_df
#' @format A data frame with 68 observations and 3 variables:
#' \describe{
#'   \item{ID}{Participant identification number (integer vector)}
#'   \item{HR_baseline}{Baseline heart rate in beats per minute (numeric vector)}
#'   \item{HR_anger}{Heart rate during anger recall in beats per minute (numeric vector)}
#' }
#' @source Data taken from the esci package version 1.0-7. Original study:
#' Lakens D (2013). Conceptual replication of Ekman et al. (1983) emotion study.
#' @usage data(emotion_heartrate_df)
#' @export
load("data/emotion_heartrate_df.rda")
NULL


#' Cardiovascular risks of diabetes drugs
#'
#' This dataset, cardio_diabetes_tbl_df, is a tibble containing information comparing
#' cardiovascular problems between two diabetes medications (Rosiglitazone and Pioglitazone)
#' in elderly Medicare patients. It includes data from 227,571 patients.
#'
#' The dataset name has been kept as 'cardio_diabetes_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble. The original content has not been modified
#' in any way.
#'
#' @name cardio_diabetes_tbl_df
#' @format A tibble with 227,571 observations and 2 variables:
#' \describe{
#'   \item{treatment}{Type of diabetes medication (factor with 2 levels: Rosiglitazone or Pioglitazone)}
#'   \item{cardiovascular_problems}{Presence of cardiovascular problems (factor with 2 levels)}
#' }
#' @source Data taken from the openintro package version 2.5.0. Original study:
#' Graham DJ, et al. (2010). "Risk of acute myocardial infarction, stroke, heart failure,
#' and death in elderly Medicare patients treated with rosiglitazone or pioglitazone."
#' JAMA, 304(4):411.
#' @usage data(cardio_diabetes_tbl_df)
#' @export
load("data/cardio_diabetes_tbl_df.rda")
NULL


#' Blood thinners in CPR survival
#'
#' This dataset, cpr_survival_tbl_df, is a tibble containing information from a study
#' examining the effect of blood thinners on survival rates in CPR patients. The study
#' randomly assigned 90 patients to either receive a blood thinner (treatment group) or
#' not receive one (control group), with the outcome being survival for at least 24 hours.
#'
#' The dataset name has been kept as 'cpr_survival_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble. The original content has not been modified
#' in any way.
#'
#' @name cpr_survival_tbl_df
#' @format A tibble with 90 observations and 2 variables:
#' \describe{
#'   \item{group}{Treatment assignment (factor with 2 levels: "control" and "treatment")}
#'   \item{outcome}{Survival status (factor with 2 levels: "died" and "survived")}
#' }
#' @source Data taken from the openintro package version 2.5.0
#' @usage data(cpr_survival_tbl_df)
#' @export
load("data/cpr_survival_tbl_df.rda")
NULL


#' Sulphinpyrazone for post-MI death prevention
#'
#' This dataset, sulphinpyrazone_tbl_df, is a tibble containing information from a clinical trial
#' studying the efficacy of sulphinpyrazone in preventing sudden death after myocardial infarction.
#' The data includes 1,475 patients randomly assigned to either the treatment or control group.
#'
#' The dataset name has been kept as 'sulphinpyrazone_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble. The original content has not been modified
#' in any way.
#'
#' @name sulphinpyrazone_tbl_df
#' @format A tibble with 1,475 observations and 2 variables:
#' \describe{
#'   \item{group}{Treatment assignment (factor with 2 levels: "control" and "treatment")}
#'   \item{outcome}{Patient outcome (factor with 2 levels)}
#' }
#' @source Data taken from the openintro package version 2.5.0. Original study:
#' Anturane Reinfarction Trial Research Group (1980).
#' "Sulfinpyrazone in the prevention of sudden death after myocardial infarction."
#' New England Journal of Medicine, 302(5):250-256.
#' @usage data(sulphinpyrazone_tbl_df)
#' @export
load("data/sulphinpyrazone_tbl_df.rda")
NULL


#' Acute Myocardial Infarction (Heart Attack) Events
#'
#' This dataset, ami_occurrences_tbl_df, is a tibble containing simulated but realistic
#' daily counts of Acute Myocardial Infarction (AMI) occurrences in New York City over
#' one year (365 days). The data represents the number of heart attack events recorded each day.
#'
#' The dataset name has been kept as 'ami_occurrences_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble. The original content has not been modified
#' in any way.
#'
#' @name ami_occurrences_tbl_df
#' @format A tibble with 365 observations and 1 variable:
#' \describe{
#'   \item{ami}{Number of Acute Myocardial Infarction events recorded each day (integer vector)}
#' }
#' @source Data taken from the openintro package version 2.5.0
#' @usage data(ami_occurrences_tbl_df)
#' @export
load("data/ami_occurrences_tbl_df.rda")
NULL


#' Heart Failure rehospitalization risk
#'
#' This dataset, heartfailure_df, is a data frame containing simulated data from 800 patients
#' with heart failure who are at risk of recurrent hospitalization. The dataset includes
#' 3,068 observations (2,268 events) tracking patient outcomes over time.
#'
#' The dataset name has been kept as 'heartfailure_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a standard data frame. The original content has not been modified
#' in any way.
#'
#' @name heartfailure_df
#' @format A data frame with 3,068 observations and 6 variables:
#' \describe{
#' \item{id}{Patient identification number (integer vector)}
#' \item{treatment}{Treatment assignment (factor with 2 levels)}
#' \item{t0}{Start time of observation period (numeric vector)}
#' \item{t1}{End time of observation period (numeric vector)}
#' \item{enum}{Event number (numeric vector)}
#' \item{event}{Event indicator (numeric vector)}
#' }
#' @source Data taken from the survPen package version 2.0-2. Based on hfaction_cpx12 dataset from package WA.
#' @usage data(heartfailure_df)
#' @export
load("data/heartfailure_df.rda")
NULL


#' Heart Failure Clinical Dataset
#'
#' This dataset, cardiac_failure_df, is a data frame containing clinical data from
#' 299 patients with heart failure. It includes 13 variables covering demographic
#' information, medical history, laboratory results, and mortality outcomes.
#'
#' The dataset name has been kept as 'cardiac_failure_df' to avoid confusion with other
#' datasets in the R ecosystem. This naming convention helps distinguish this dataset
#' as part of the CardioDataSets package and assists users in identifying its specific
#' characteristics. The suffix 'df' indicates that the dataset is a standard data frame.
#' The original content has not been modified in any way.
#'
#' @name cardiac_failure_df
#' @format A data frame with 299 observations and 13 variables:
#' \describe{
#' \item{age}{Patient age in years (numeric)}
#' \item{anaemia}{Presence of anaemia (integer: 0=no, 1=yes)}
#' \item{creatinine_phosphokinase}{Level of CPK enzyme in mcg/L (integer)}
#' \item{diabetes}{Presence of diabetes (integer: 0=no, 1=yes)}
#' \item{ejection_fraction}{Percentage of blood leaving heart (integer)}
#' \item{high_blood_pressure}{Presence of hypertension (integer: 0=no, 1=yes)}
#' \item{platelets}{Platelet count in kiloplatelets/mL (numeric)}
#' \item{serum_creatinine}{Level of serum creatinine in mg/dL (numeric)}
#' \item{serum_sodium}{Level of serum sodium in mEq/L (integer)}
#' \item{sex}{Patient sex (integer: 0=female, 1=male)}
#' \item{smoking}{Smoking status (integer: 0=no, 1=yes)}
#' \item{time}{Follow-up period in days (integer)}
#' \item{DEATH_EVENT}{Death during follow-up (integer: 0=no, 1=yes)}
#' }
#' @source Data taken from the SOPC package version 0.1.0
#' @usage data(cardiac_failure_df)
#' @export
load("data/cardiac_failure_df.rda")
NULL


#' Cardiovascular Risk Factors
#'
#' This dataset, cardioRiskFactors_df, is a data frame containing information from
#' a study investigating the association between uric acid and cardiovascular risk
#' factors in developing countries. It includes data from 998 participants (474 men
#' and 524 women) aged 25-64 years.
#'
#' The dataset name has been kept as 'cardioRiskFactors_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a standard data frame. The original content has not been modified
#' in any way.
#'
#' @name cardioRiskFactors_df
#' @format A data frame with 998 observations and 14 variables:
#' \describe{
#' \item{age}{Age in years (integer)}
#' \item{bmi}{Body Mass Index in kg/m² (numeric)}
#' \item{waisthip}{Waist-to-hip ratio (numeric)}
#' \item{smok}{Smoking status (integer)}
#' \item{choles}{Total cholesterol in mg/dL (numeric)}
#' \item{trig}{Triglycerides in mg/dL (numeric)}
#' \item{hdl}{HDL cholesterol in mg/dL (numeric)}
#' \item{ldl}{LDL cholesterol in mg/dL (numeric)}
#' \item{sys}{Systolic blood pressure in mmHg (integer)}
#' \item{dia}{Diastolic blood pressure in mmHg (numeric)}
#' \item{Uric}{Uric acid level in mg/dL (integer)}
#' \item{sex}{Sex (integer)}
#' \item{alco}{Alcohol consumption (numeric)}
#' \item{apoa}{Apolipoprotein A in mg/dL (numeric)}
#' }
#' @source Data taken from the Rfit package version 0.27.0. Original study:
#' Heritier S, Cantoni E, Copt S, Victoria-Feser M (2009).
#' Robust Methods in Biostatistics.
#' New York: John Wiley and Sons.
#' @usage data(cardioRiskFactors_df)
#' @export
load("data/cardioRiskFactors_df.rda")
NULL


#' LA pollution and cardiovascular mortality
#'
#' This dataset, cv_mortality_ts, is a time series containing weekly cardiovascular
#' mortality data from Los Angeles County. It consists of 508 six-day smoothed
#' averages obtained by filtering daily values over the 10-year period from 1970 to 1979.
#'
#' The dataset name has been kept as 'cv_mortality_ts' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'ts' indicates that the dataset is a time series object. The original content has not been modified
#' in any way.
#'
#' @name cv_mortality_ts
#' @format A time series object (ts) with 508 observations:
#' \describe{
#'   \item{cv_mortality}{Weekly cardiovascular mortality counts (numeric vector)}
#' }
#' @details
#' Time series characteristics:
#' - Start: 1970, Week 1
#' - End: 1979, Week 40
#' - Frequency: 52 (weekly data)
#'
#' @source Data taken from the astsa package version 2.2
#' @usage data(cv_mortality_ts)
#' @export
load("data/cv_mortality_ts.rda")
NULL



#' Muscatine pediatric CRF
#'
#' This dataset, muscatine_coronary_risk_df, is a data frame containing longitudinal
#' observations from the Muscatine Coronary Risk Factor (MCRF) study, which examined
#' the development of coronary disease risk factors in children. It includes 14,568
#' observations of 4,856 children tracked from 1977 to 1981.
#'
#' The dataset name has been kept as 'muscatine_coronary_risk_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a standard data frame. The original content has not been modified
#' in any way.
#'
#' @name muscatine_coronary_risk_df
#' @format A data frame with 14,568 observations and 7 variables:
#' \describe{
#' \item{id}{Child identification number (integer)}
#' \item{gender}{Gender of child (factor with 2 levels)}
#' \item{base_age}{Age at first observation in years (integer)}
#' \item{age}{Current age in years (integer)}
#' \item{occasion}{Measurement occasion (integer)}
#' \item{obese}{Obesity status (factor with 2 levels)}
#' \item{numobese}{Numeric obesity indicator (numeric)}
#' }
#' @source Data taken from the geepack package version 1.3.12. Original study:
#' The Muscatine Coronary Risk Factor Study, University of Iowa, 1977-1981.
#' @usage data(muscatine_coronary_risk_df)
#' @export
load("data/muscatine_coronary_risk_df.rda")
NULL


#' Statin intensity and MI risk
#'
#' This dataset, statinMIrisk_df, is a data frame containing results from 4 clinical trials
#' investigating the effect of statin therapy intensity on the risk of myocardial infarction
#' or coronary death. The data compares intensive versus standard statin regimens.
#'
#' The dataset name has been kept as 'statinMIrisk_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a standard data frame. The original content has not been modified
#' in any way.
#'
#' @name statinMIrisk_df
#' @format A data frame with 4 observations and 5 variables:
#' \describe{
#' \item{study}{Study identifier (character)}
#' \item{eI}{Number of events in intensive treatment group (numeric)}
#' \item{nI}{Total patients in intensive treatment group (numeric)}
#' \item{eC}{Number of events in control/standard group (numeric)}
#' \item{nC}{Total patients in control/standard group (numeric)}
#' }
#' @source Data taken from the RTSA package version 0.2.2
#' @usage data(statinMIrisk_df)
#' @export
load("data/statinMIrisk_df.rda")
NULL


#' Aortic dissection patients
#'
#' This dataset, aortaDiss_tbl_df, is a tibble containing clinical information from
#' 226 patients with aortic dissection. It includes demographic variables, symptom
#' presentation, and risk factor data.
#'
#' The dataset name has been kept as 'aortaDiss_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble. The original content has not been modified
#' in any way.
#'
#' @name aortaDiss_tbl_df
#' @format A tibble with 226 observations and 10 variables:
#' \describe{
#' \item{Gender}{Patient gender (numeric)}
#' \item{Age}{Patient age in years (numeric)}
#' \item{Age_C}{Categorized age (numeric)}
#' \item{Aortadis}{Aortic dissection status (numeric)}
#' \item{Acute}{Acute presentation indicator (numeric)}
#' \item{Acute3}{Three-level acute presentation classification (numeric)}
#' \item{Stomach_Ache}{Presence of stomach ache (numeric)}
#' \item{Hyper}{Hypertension status (numeric)}
#' \item{Smoking}{Smoking status (numeric)}
#' \item{Radiation}{Radiation exposure (numeric)}
#' }
#' @source Data taken from the psfmi package version 1.4.0
#' @usage data(aortaDiss_tbl_df)
#' @export
load("data/aortaDiss_tbl_df.rda")
NULL


#' Elderly CV/MRI and Biomarkers
#'
#' This dataset, mriCardioVars_tbl_df, is a tibble containing MRI and clinical data from
#' 735 elderly participants in a U.S. observational study of cardiovascular and cerebrovascular
#' disease incidence. It includes 30 variables covering demographic, clinical, and imaging measures.
#'
#' The dataset name has been kept as 'mriCardioVars_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble. The original content has not been modified
#' in any way.
#'
#' @name mriCardioVars_tbl_df
#' @format A tibble with 735 observations and 30 variables:
#' \describe{
#' \item{ptid}{Patient identification number (numeric)}
#' \item{mridate}{MRI date (Date)}
#' \item{age}{Age in years (numeric)}
#' \item{sex}{Sex (character)}
#' \item{race}{Race (character)}
#' \item{weight}{Weight in kg (numeric)}
#' \item{height}{Height in cm (numeric)}
#' \item{packyrs}{Smoking pack-years (numeric)}
#' \item{yrsquit}{Years since quitting smoking (numeric)}
#' \item{alcoh}{Alcohol consumption (numeric)}
#' \item{physact}{Physical activity level (numeric)}
#' \item{chf}{Congestive heart failure status (numeric)}
#' \item{chd}{Coronary heart disease status (numeric)}
#' \item{stroke}{Stroke history (numeric)}
#' \item{diabetes}{Diabetes status (numeric)}
#' \item{genhlth}{General health status (numeric)}
#' \item{ldl}{LDL cholesterol in mg/dL (numeric)}
#' \item{alb}{Albumin level (numeric)}
#' \item{crt}{Creatinine level (numeric)}
#' \item{plt}{Platelet count (numeric)}
#' \item{sbp}{Systolic blood pressure in mmHg (numeric)}
#' \item{aai}{Ankle-arm index (numeric)}
#' \item{fev}{Forced expiratory volume (numeric)}
#' \item{dsst}{Digit Symbol Substitution Test score (numeric)}
#' \item{atrophy}{Brain atrophy measure (numeric)}
#' \item{whgrd}{White matter hyperintensity grade (numeric)}
#' \item{numinf}{Number of brain infarcts (numeric)}
#' \item{volinf}{Volume of brain infarcts (numeric)}
#' \item{obstime}{Observation time (numeric)}
#' \item{death}{Mortality status (numeric)}
#' }
#' @source Data taken from the rigr package version 1.0.7
#' @usage data(mriCardioVars_tbl_df)
#' @export
load("data/mriCardioVars_tbl_df.rda")
NULL


#' US Mortality Rates by Cause and Gender
#'
#' This dataset, usMortality_df, is a data frame containing mortality rates across all ages
#' in the USA from 2011-2013, stratified by cause of death, sex, and rural/urban status.
#' It includes national aggregate rates for 10 causes of death, including Heart disease.
#'
#' The dataset name has been kept as 'usMortality_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a standard data frame. The original content has not been modified
#' in any way.
#'
#' @name usMortality_df
#' @format A data frame with 40 observations and 5 variables:
#' \describe{
#' \item{Status}{Residential status (factor: Rural/Urban)}
#' \item{Sex}{Gender (factor: Male/Female)}
#' \item{Cause}{Cause of death (factor with 10 levels)}
#' \item{Rate}{Mortality rate per 100,000 population (numeric)}
#' \item{SE}{Standard error of mortality rate (numeric)}
#' }
#' @source Data taken from the lattice package version 0.22-6. Original source:
#' Rural Health Reform Policy Research Center (2015).
#' "Exploring Rural and Urban Mortality Differences."
#' Bethesda, MD: August 2015.
#' @usage data(usMortality_df)
#' @export
load("data/usMortality_df.rda")
NULL


#' Stanford Heart Transplant Data
#'
#' This dataset, heart_transplant_df, is a data frame containing survival data from
#' the Stanford heart transplant program. It includes information on 172 patients
#' with follow-up times, transplant status, and clinical covariates.
#'
#' The dataset name has been kept as 'heart_transplant_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a standard data frame. The original content has not been modified
#' in any way.
#'
#' @name heart_transplant_df
#' @format A data frame with 172 observations and 8 variables:
#' \describe{
#' \item{start}{Start time of interval (numeric)}
#' \item{stop}{End time of interval (numeric)}
#' \item{event}{Survival status (numeric: 1=event, 0=censored)}
#' \item{age}{Patient age at enrollment (numeric)}
#' \item{year}{Year of enrollment (numeric)}
#' \item{surgery}{Prior bypass surgery (numeric)}
#' \item{transplant}{Transplant status (factor: 0=no, 1=yes)}
#' \item{id}{Patient identification number (numeric)}
#' }
#' @source Data taken from the lrstat package version 0.2.13. Original source:
#' Stanford Heart Transplant Study data from the survival package.
#' @usage data(heart_transplant_df)
#' @export
load("data/heart_transplant_df.rda")
NULL


#' Artificial Heart Transplant Durations
#'
#' This dataset, heartTransplantTime_tbl_df, is a tibble containing the durations
#' (in hours) of 15 artificial heart transplant operations.
#'
#' The dataset name has been kept as 'heartTransplantTime_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble. The original content has not been modified
#' in any way.
#'
#' @name heartTransplantTime_tbl_df
#' @format A tibble with 15 observations and 1 variable:
#' \describe{
#' \item{duration}{Operation duration in hours (numeric)}
#' }
#' @source Data taken from the BSDA package version 1.2.3. Original source:
#' Kitchens LJ (2003). "Basic Statistics and Data Analysis."
#' Pacific Grove, CA: Brooks/Cole, a division of Thomson Learning.
#' @usage data(heartTransplantTime_tbl_df)
#' @export
load("data/heartTransplantTime_tbl_df.rda")
NULL


#' Heart Disease Risk Factors
#'
#' This dataset, heartdiseaserisk_tbl_df, is a tibble containing cardiovascular
#' risk factor data from 498 individuals. It includes measures of physical activity
#' (biking), smoking habits, and heart disease prevalence.
#'
#' The dataset name has been kept as 'heartdiseaserisk_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble. The original content has not been modified
#' in any way.
#'
#' @name heartdiseaserisk_tbl_df
#' @format A tibble with 498 observations and 3 variables:
#' \describe{
#' \item{Biking}{Frequency of biking activity (numeric)}
#' \item{Heart.disease}{Prevalence of heart disease (numeric)}
#' \item{Smoking}{Smoking frequency or intensity (numeric)}
#' }
#' @source Data taken from the Path.Analysis package version 0.1
#' @usage data(heartdiseaserisk_tbl_df)
#' @export
load("data/heartdiseaserisk_tbl_df.rda")
NULL


#' CAV in Heart Transplant Patients
#'
#' This dataset, patient_CAV_df, is a data frame containing longitudinal follow-up data
#' from heart transplant recipients at Papworth Hospital, UK. It tracks 2,803 angiographic
#' examinations for the onset of cardiac allograft vasculopathy and mortality.
#'
#' The dataset name has been kept as 'patient_CAV_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a standard data frame. The original content has not been modified
#' in any way.
#'
#' @name patient_CAV_df
#' @format A data frame with 2,803 observations and 5 variables:
#' \describe{
#' \item{PTNUM}{Patient identification number (integer)}
#' \item{years}{Time since transplant in years (numeric)}
#' \item{state}{Disease state (numeric)}
#' \item{dage}{Donor age in years (integer)}
#' \item{pdiag}{Primary diagnosis code (numeric)}
#' }
#' @source Data taken from the flexmsm package version 0.1.2. Original data:
#' Papworth Hospital, UK. Subset of cav data from msm package.
#' @usage data(patient_CAV_df)
#' @export
load("data/patient_CAV_df.rda")
NULL



#' Statin Dose Comparison Trials for CVD
#'
#' This dataset, cardiovascular_list, is a list containing data from 34 clinical trials
#' comparing low dose (1), high dose (2), and placebo (3) statins for cardiovascular disease
#' prevention. The dataset includes study identifiers, treatment assignments, and outcome counts.
#'
#' The dataset name has been kept as 'cardiovascular_list' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The original content has not been modified in any way.
#'
#' @name cardiovascular_list
#' @format A list with 4 components:
#' \describe{
#' \item{Study}{Study identifiers (integer vector of length 34)}
#' \item{Treat}{Treatment assignments (numeric vector: 1=low dose, 2=high dose, 3=placebo)}
#' \item{Outcomes}{Outcome matrix with 34 rows and 3 columns:
#' \describe{
#' \item{Alive}{Number of patients alive (numeric)}
#' \item{FnCVD}{Number with non-fatal CVD events (numeric)}
#' \item{FCVD}{Number with fatal CVD events (numeric)}
#' }
#' }
#' \item{N}{Sample sizes (numeric vector of length 34)}
#' }
#' @source Data taken from the bnma package version 1.6.0
#' @usage data(cardiovascular_list)
#' @export
load("data/cardiovascular_list.rda")
NULL


#' FDA Beta Blockers Adverse Events
#'
#' This dataset, betablockers_matrix, is a matrix containing adverse event reports
#' from the FDA Adverse Event Reporting System (FAERS) for 9 beta blockers from Q1 2021
#' to Q4 2023. The matrix includes 501 adverse events (rows) across 9 medications (columns).
#'
#' The dataset name has been kept as 'betablockers_matrix' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'matrix' indicates that the dataset is a matrix object. The original content has not been modified
#' in any way.
#'
#' @name betablockers_matrix
#' @format A matrix with 501 rows (adverse events) and 9 columns (beta blockers):
#' \describe{
#' \item{Acebutolol}{Adverse event counts for Acebutolol (integer)}
#' \item{Atenolol}{Adverse event counts for Atenolol (integer)}
#' \item{Bisoprolol}{Adverse event counts for Bisoprolol (integer)}
#' \item{Carvedilol}{Adverse event counts for Carvedilol (integer)}
#' \item{Metoprolol}{Adverse event counts for Metoprolol (integer)}
#' \item{Nadolol}{Adverse event counts for Nadolol (integer)}
#' \item{Propranolol}{Adverse event counts for Propranolol (integer)}
#' \item{Timolol}{Adverse event counts for Timolol (integer)}
#' \item{Other}{Adverse event counts for other beta blockers (integer)}
#' }
#' @source Data taken from the MDDC package version 1.1.0. Original data:
#' FDA Adverse Event Reporting System (FAERS) database, Q1 2021 to Q4 2023.
#' @usage data(betablockers_matrix)
#' @export
load("data/betablockers_matrix.rda")
NULL


#' Scottish Health Survey CVD
#'
#' This dataset, scottish_CVD_df, is a data frame containing cardiovascular health
#' data from the 1998 Scottish Health Survey. It includes information from 8,804
#' respondents aged 18-64, with variables covering demographics, health behaviors,
#' and cardiovascular disease status.
#'
#' The dataset name has been kept as 'scottish_CVD_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a standard data frame. The original content has not been modified
#' in any way.
#'
#' @name scottish_CVD_df
#' @format A data frame with 8,804 observations and 8 variables:
#' \describe{
#' \item{age}{Respondent age in years (integer)}
#' \item{sex}{Respondent sex (factor with 2 levels)}
#' \item{sc}{Social class (factor with 3 levels)}
#' \item{cvddef}{Doctor-diagnosed CVD status (integer: 0=no, 1=yes)}
#' \item{carstair}{Carstairs deprivation score (numeric)}
#' \item{smoke}{Smoking status (factor with 5 levels)}
#' \item{id}{Respondent identification number (integer)}
#' \item{area}{Geographic area code (integer)}
#' }
#' @source Data taken from the R2MLwiN package version 0.8-9. Original survey:
#' 1998 Scottish Health Survey. Methodology reference:
#' Charlton C, Rasbash J, Browne WJ, Healy M, Cameron B (2024).
#' MLwiN Version 3.09. Centre for Multilevel Modelling, University of Bristol.
#' @usage data(scottish_CVD_df)
#' @export
load("data/scottish_CVD_df.rda")
NULL


#' Acute Coronary Syndrome (ACS) Patient Data
#'
#' This dataset, acs_patients_df, is a data frame containing demographic and clinical
#' data from 857 patients with Acute Coronary Syndrome (ACS). It includes 17 variables
#' covering patient characteristics, vital signs, laboratory results, and risk factors.
#'
#' The dataset name has been kept as 'acs_patients_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a standard data frame. The original content has not been modified
#' in any way.
#'
#' @name acs_patients_df
#' @format A data frame with 857 observations and 17 variables:
#' \describe{
#' \item{age}{Patient age in years (integer)}
#' \item{sex}{Patient sex (character)}
#' \item{cardiogenicShock}{Presence of cardiogenic shock (character)}
#' \item{entry}{Method of hospital entry (character)}
#' \item{Dx}{Diagnosis (character)}
#' \item{EF}{Ejection fraction percentage (numeric)}
#' \item{height}{Height in cm (numeric)}
#' \item{weight}{Weight in kg (numeric)}
#' \item{BMI}{Body Mass Index in kg/m² (numeric)}
#' \item{obesity}{Obesity status (character)}
#' \item{TC}{Total cholesterol in mg/dL (numeric)}
#' \item{LDLC}{LDL cholesterol in mg/dL (integer)}
#' \item{HDLC}{HDL cholesterol in mg/dL (integer)}
#' \item{TG}{Triglycerides in mg/dL (integer)}
#' \item{DM}{Diabetes mellitus status (character)}
#' \item{HBP}{High blood pressure status (character)}
#' \item{smoking}{Smoking status (character)}
#' }
#' @source Data taken from the moonBook package version 0.3.1
#' @usage data(acs_patients_df)
#' @export
load("data/acs_patients_df.rda")
NULL


#' Age vs. Maximum Heart Rate
#'
#' This dataset, age_heartrate_df, is a data frame containing simulated data
#' representing the relationship between age and maximum heart rate. It includes
#' 15 observations based on established physiological models.
#'
#' The dataset name has been kept as 'age_heartrate_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a standard data frame. The original content has not been modified
#' in any way.
#'
#' @name age_heartrate_df
#' @format A data frame with 15 observations and 2 variables:
#' \describe{
#' \item{age}{Age in years (numeric)}
#' \item{maxrate}{Maximum predicted heart rate in beats per minute (numeric)}
#' }
#' @source Data taken from the UsingR package version 2.0-7. Original research:
#' Tanaka H, Monahan KD, Seals DR (2001).
#' "Age-predicted maximal heart rate revisited."
#' Journal of the American College of Cardiology, 37(1):153-156.
#' @usage data(age_heartrate_df)
#' @export
load("data/age_heartrate_df.rda")
NULL


#' Radial Artery IVUS Patient Data
#'
#' This dataset, radial_ivus_df, is a data frame containing demographic and clinical
#' data from 115 patients who underwent intravascular ultrasound (IVUS) examination
#' of the radial artery following transradial coronary angiography. It includes 15
#' variables covering patient characteristics, laboratory results, and IVUS measurements.
#'
#' The dataset name has been kept as 'radial_ivus_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a standard data frame. The original content has not been modified
#' in any way.
#'
#' @name radial_ivus_df
#' @format A data frame with 115 observations and 15 variables:
#' \describe{
#' \item{male}{Male sex indicator (integer: 0/1)}
#' \item{age}{Age in years (integer)}
#' \item{height}{Height in cm (numeric)}
#' \item{weight}{Weight in kg (numeric)}
#' \item{HBP}{High blood pressure status (integer: 0/1)}
#' \item{DM}{Diabetes mellitus status (integer: 0/1)}
#' \item{smoking}{Smoking status (factor with 3 levels)}
#' \item{TC}{Total cholesterol in mg/dL (integer)}
#' \item{TG}{Triglycerides in mg/dL (integer)}
#' \item{HDL}{HDL cholesterol in mg/dL (integer)}
#' \item{LDL}{LDL cholesterol in mg/dL (integer)}
#' \item{hsCRP}{High-sensitivity C-reactive protein in mg/L (numeric)}
#' \item{NTAV}{Normalized total atheroma volume (numeric)}
#' \item{PAV}{Percent atheroma volume (numeric)}
#' \item{sex}{Sex (factor with 2 levels)}
#' }
#' @source Data taken from the moonBook package version 0.3.1
#' @usage data(radial_ivus_df)
#' @export
load("data/radial_ivus_df.rda")
NULL


#' Coronary Artery Disease GWAS Meta-Analysis
#'
#' This dataset, cardiac_gwas_df, is a data frame containing genome-wide association study
#' (GWAS) results from a multi-ethnic meta-analysis of coronary artery disease (CAD).
#' It includes 9,919 genetic variants with their effect sizes and study characteristics.
#'
#' The dataset name has been kept as 'cardiac_gwas_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' CardioDataSets package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a standard data frame. The original content has not been modified
#' in any way.
#'
#' @name cardiac_gwas_df
#' @format A data frame with 9,919 observations and 7 variables:
#' \describe{
#'   \item{beta_flipped}{Effect size estimates (numeric)}
#'   \item{gcse}{Genomic control standard error (numeric)}
#'   \item{variants}{Genetic variant identifiers (character)}
#'   \item{studies}{Participating studies (character)}
#'   \item{cases}{Number of cases (integer)}
#'   \item{controls}{Number of controls (integer)}
#'   \item{fdr214_gwas46}{False discovery rate adjusted p-values (numeric)}
#' }
#' @source Data taken from the getmstatistic package version 0.2.2
#' @usage data(cardiac_gwas_df)
#' @export
load("data/cardiac_gwas_df.rda")
NULL








