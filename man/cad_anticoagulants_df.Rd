% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data-documentation.R
\name{cad_anticoagulants_df}
\alias{cad_anticoagulants_df}
\title{Anticoagulants for CAD Patients}
\format{
A data frame with 34 observations and 9 variables:
\describe{
  \item{study}{Study identifier (character vector)}
  \item{year}{Year of publication (integer vector)}
  \item{intensity}{Intensity of anticoagulation treatment (character vector)}
  \item{asp.t}{Aspirin use in treatment group (integer vector)}
  \item{asp.c}{Aspirin use in control group (integer vector)}
  \item{ai}{Number of events in treatment group (integer vector)}
  \item{n1i}{Total number of participants in treatment group (integer vector)}
  \item{ci}{Number of events in control group (integer vector)}
  \item{n2i}{Total number of participants in control group (integer vector)}
}
}
\source{
Data taken from the metadat package version 1.2-0
}
\usage{
data(cad_anticoagulants_df)
}
\description{
This dataset, cad_anticoagulants_df, is a data frame containing information from 34 clinical trials
examining the effectiveness of oral anticoagulants in patients with coronary artery disease.
It includes data on treatment outcomes comparing anticoagulant therapy with control groups.
}
\details{
The dataset name has been kept as 'cad_anticoagulants_df' to avoid confusion with other datasets
in the R ecosystem. This naming convention helps distinguish this dataset as part of the
CardioDataSets package and assists users in identifying its specific characteristics.
The suffix 'df' indicates that the dataset is a standard data frame. The original content has not been modified
in any way.
}
