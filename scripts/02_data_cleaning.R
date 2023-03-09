library(tidyverse)
library(readr)
library(dplyr)
library(kableExtra)
library(vtable)

# Clean and recode data
cleaned_data <- raw_data %>% 
  select(age, race, sex, happy) %>% 
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

# Variables of interest

# Happiness by age group
by_age <- cleaned_data %>% 
  group_by(age)


# Happiness by sex
by_sex <- cleaned_data %>% 
  group_by(sex) %>% 
by_sex %>% ggplot(aes(x= 'happy',  group=sex))

# Happiness by race
by_race <- cleaned_data %>% 
  group_by(race) %>% 
  summarise(mean = mean(happy, na.rm = TRUE))

