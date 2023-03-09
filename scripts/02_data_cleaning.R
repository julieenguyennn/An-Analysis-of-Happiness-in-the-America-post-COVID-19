library(tidyverse)
library(readr)

read.csv("inputs/data/raw_gss.csv")

cleaned_data <- raw_data %>% 
  select(id, age, race, class, sex, happy)

by_age <- cleaned_data %>% 
  group_by()