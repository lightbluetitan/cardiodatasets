% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data-documentation.R
\name{mriCardioVars_tbl_df}
\alias{mriCardioVars_tbl_df}
\title{Elderly CV/MRI and Biomarkers}
\format{
A tibble with 735 observations and 30 variables:
\describe{
\item{ptid}{Patient identification number (numeric)}
\item{mridate}{MRI date (Date)}
\item{age}{Age in years (numeric)}
\item{sex}{Sex (character)}
\item{race}{Race (character)}
\item{weight}{Weight in kg (numeric)}
\item{height}{Height in cm (numeric)}
\item{packyrs}{Smoking pack-years (numeric)}
\item{yrsquit}{Years since quitting smoking (numeric)}
\item{alcoh}{Alcohol consumption (numeric)}
\item{physact}{Physical activity level (numeric)}
\item{chf}{Congestive heart failure status (numeric)}
\item{chd}{Coronary heart disease status (numeric)}
\item{stroke}{Stroke history (numeric)}
\item{diabetes}{Diabetes status (numeric)}
\item{genhlth}{General health status (numeric)}
\item{ldl}{LDL cholesterol in mg/dL (numeric)}
\item{alb}{Albumin level (numeric)}
\item{crt}{Creatinine level (numeric)}
\item{plt}{Platelet count (numeric)}
\item{sbp}{Systolic blood pressure in mmHg (numeric)}
\item{aai}{Ankle-arm index (numeric)}
\item{fev}{Forced expiratory volume (numeric)}
\item{dsst}{Digit Symbol Substitution Test score (numeric)}
\item{atrophy}{Brain atrophy measure (numeric)}
\item{whgrd}{White matter hyperintensity grade (numeric)}
\item{numinf}{Number of brain infarcts (numeric)}
\item{volinf}{Volume of brain infarcts (numeric)}
\item{obstime}{Observation time (numeric)}
\item{death}{Mortality status (numeric)}
}
}
\source{
Data taken from the rigr package version 1.0.7
}
\usage{
data(mriCardioVars_tbl_df)
}
\description{
This dataset, mriCardioVars_tbl_df, is a tibble containing MRI and clinical data from
735 elderly participants in a U.S. observational study of cardiovascular and cerebrovascular
disease incidence. It includes 30 variables covering demographic, clinical, and imaging measures.
}
\details{
The dataset name has been kept as 'mriCardioVars_tbl_df' to avoid confusion with other datasets
in the R ecosystem. This naming convention helps distinguish this dataset as part of the
CardioDataSets package and assists users in identifying its specific characteristics.
The suffix 'tbl_df' indicates that the dataset is a tibble. The original content has not been modified
in any way.
}
