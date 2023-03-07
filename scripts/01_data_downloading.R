#### Preamble ####
# Purpose: Prepare the 2021 GSS data
# Author: Ray Wen
# Data: 20 March 2022
# Contact: ray.wen@mail.utoronto.ca
# License: MIT



#### Workspace setup ####
library(haven)
library(tidyverse)
# Read in the raw data. 
raw_data <- haven::read_dta("https://github.com/julieenguyennn/Paper3/blob/main/inputs/GSS2021.dta")
write_csv(raw_data, "inputs/data/raw_gss.csv")