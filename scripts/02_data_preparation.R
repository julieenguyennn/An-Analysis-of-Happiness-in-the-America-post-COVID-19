#### Preamble ####
# Purpose: Prepare the 2021 GSS data
# Author: Missy Zhang, Julie Nguyen, Linrong Li
# Data: 7 March 2023
# Contact: mengze.zhang@mail.utoronto.ca
# License: MIT



#### Workspace setup ####
library(haven)
library(tidyverse)
# Read in the raw data. 
raw_data <- haven::read_dta("inputs/data/gss2021.dta")
raw_data_job <- read_excel(here::here("inputs/job_happy/GSS.xlsx"))
write_csv(raw_data, "inputs/data/raw_gss.csv")