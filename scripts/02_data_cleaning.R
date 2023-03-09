library(tidyverse)
library(readr)

read.csv("inputs/data/raw_gss.csv")

# Clean and recode data
cleaned_data <- raw_data %>% 
  select(id, age, race, sex, happy) %>% 
  arrange(age) %>% 
  mutate(age = case_when(
    age < 18 ~ '< 18',
    age >= 18 & age <= 34 ~ '18-34',
    age >= 35 & age <=49 ~ '35-49',
    age >= 50 & age <=64 ~ '50-64',
    age >= 65 & age <=89 ~ '65 and above'
  )) %>% 
  mutate(sex = case_when(
    sex == 1 ~ 'Male',
    sex == 2 ~ 'Female'
  )) %>% 
  mutate(race = case_when(
    race == 1 ~ 'White',
    race == 2 ~ 'Black',
    race == 3 ~ 'Other'
  ))

by_age <- cleaned_data %>% 
  group_by(age) %>% 
  summarise(mean = mean(happy, na.rm = TRUE))

by_sex <- cleaned_data %>% 
  group_by(sex) %>% 
  summarise(mean = mean(happy, na.rm = TRUE))