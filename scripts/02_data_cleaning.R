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
  )) %>% 
  mutate(happy = case_when(
    happy == 1 ~ 'Very Happy',
    happy == 2 ~ 'Pretty Happy',
    happy == 3 ~ 'Not Too Happy'
  )) %>% 
  filter(!is.na(happy))

# Variables of interest
sumtable()

# Overall national happiness
cleaned_data %>% ggplot(aes(happy)) +
  geom_bar() +
  theme_minimal() +
  labs(x = "Level of Happiness",
       y = "Number of Respondents",
       title = "Overall national happiness")

# Happiness by age group
cleaned_data %>% group_by(age) %>% 
  ggplot(aes(x=happy, fill=age)) +
  geom_bar() +
  facet_wrap(~age, scales ="free") +
  theme_minimal() +
  labs(x="Level of Happiness",
       y="Number of Respondents",
       title="Happiness by age")+
  theme(legend.position = "none")

# Happiness by sex
cleaned_data %>% group_by(sex) %>% 
  ggplot(aes(x=happy, fill=sex)) +
  geom_bar() +
  facet_wrap(~sex, scales ="free") +
  theme_minimal() +
  labs(x="Level of Happiness",
       y="Number of Respondents",
       title="Happiness by sex")+
  theme(legend.position = "none")


# Happiness by race
cleaned_data %>% group_by(race) %>% 
  ggplot(aes(x=happy, fill=race)) +
  geom_bar() +
  facet_wrap(~race, scales ="free") +
  theme_minimal() +
  labs(x="Level of Happiness",
       y="Number of Respondents",
       title="Happiness by race")+
  theme(legend.position = "none")
