# CardioDataSets

The `CardioDataSets` package offers a diverse collection of datasets focused on heart and cardiovascular research. It covers topics such as *heart disease, myocardial infarction, heart failure, aortic dissection, cardiovascular risk factors, clinical outcomes, drug effects*, and *mortality trends*.

The package is designed for researchers, clinicians, epidemiologists, and data scientists. It includes clinical, epidemiological, simulated, and real-world datasets that enable exploration of disease progression, treatment efficacy, cardiovascular risk, and patient outcomes across various populations and contexts.

## Installation

You can install the `CardioDataSets` package from CRAN with the following R function:

```R

install.packages("CardioDataSets")

```

## Usage

After installation, load the `CardioDataSets` package and start exploring and using its functions and  datasets.

## Dataset Suffixes

Each dataset in the `CardioDataSets` package uses a `suffix` to denote the type of R object:

`_df`: A data frame

`_tbl_df`: A tibble

`_ts`: time series

`_mtc_network`: network meta-analysis

`_matrix`: A matrix

## Example Datasets

Below are selected example datasets included in the `CardioDataSets` package:

`heartdisease_tbl_df`: Heart Disease Patients Clinical Data.

`cardioRiskFactors_df`: Cardiovascular Risk Factors.

`emotion_heartrate_df`: Study investigating how recalling anger affects heart rate.

## Example Code:

```R

# Load the package

library(CardioDataSets)

# List all datasets in the package

view_datasets()

# Load dataset

data("heartdisease_tbl_df")

# Preview the dataset

head(heartdisease_tbl_df)

# Open in Viewer

View(heartdisease_tbl_df)

```
