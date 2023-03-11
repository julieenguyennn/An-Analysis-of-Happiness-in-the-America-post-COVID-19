#### Preamble ####
# Purpose: Prepare the 2021 GSS data
# Author: Missy Zhang
# Data: 7 March 2023
# Contact: mengze.zhang@mail.utoronto.ca
# License: MIT



#### Workspace setup ####
library(haven)
library(tidyverse)
# Read in the raw data. 
raw_data <- haven::read_dta("../../inputs/data/gss2021.dta")
write_csv(raw_data, "../../inputs/data/raw_gss.csv")