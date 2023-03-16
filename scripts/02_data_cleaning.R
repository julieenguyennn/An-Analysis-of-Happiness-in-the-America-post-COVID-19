#### Preamble ####
# Purpose: Cleaning the data from GSS 2021 and extract what needed
# Author: Missy Zhang, Julie Nguyen, Linrong Li
# Data: 7 March 2023
# Contact: mengze.zhang@mail.utoronto.ca
# License: MIT

library(tidyverse)
library(readxl)
library(dplyr)
library(kableExtra)
library(vtable)
library(naniar)

# Read inputs
raw_data <- read_excel(here::here("inputs/data/GSS.xlsx"))

# Clean and recode data related to jobs/income
cleaned_job <- raw_data %>%
  select(hrs1, rincome, happy) %>% 
  filter(!str_detect(hrs1, '.i'), !str_detect(hrs1, '.n'), 
         !str_detect(hrs1, '.d'), !str_detect(hrs1, '.s'),
         !str_detect(rincome, '.i'), !str_detect(rincome, '.n'), 
         !str_detect(rincome, '.d'), !str_detect(rincome, '.s'),
         !str_detect(rincome, '.r'), !str_detect(happy, '.i'),
         !str_detect(happy, '.n'), !str_detect(happy, '.d'),
         !str_detect(happy, '.s'))

# Clean and recode general data
cleaned_overall <- raw_data %>%
  select(age, sex, race, happy) %>% 
  mutate(age = replace(age, str_detect(age, '.i'), NA),
         age = replace(age, str_detect(age, '.n'), NA),
         sex = replace(sex, str_detect(sex, '.n'), NA),
         race = replace(race, str_detect(race, '.i'), NA),
         happy = replace(happy, str_detect(happy, '.i'), NA),
         happy = replace(happy, str_detect(happy, '.n'), NA))
  
cleaned_job$rincome <- sub("-","TO",cleaned_job$rincome)
cleaned_job$rincome <- sub("LT","LOWER THEN ",cleaned_job$rincome)
cleaned_job$hrs1 <- as.numeric(cleaned_job$hrs1)
cleaned_job$rincome <- factor(cleaned_job$rincome,
                                   levels = c('LOWER THEN  $1000',
                                              '$1000 TO 2999',
                                              '$3000 TO 3999',
                                              '$4000 TO 4999',
                                              '$5000 TO 5999',
                                              '$6000 TO 6999',
                                              '$7000 TO 7999',
                                              '$8000 TO 9999',
                                              '$10000 TO 14999',
                                              '$15000 TO 19999',
                                              '$20000 TO 24999',
                                              '$25000 OR MORE'))
