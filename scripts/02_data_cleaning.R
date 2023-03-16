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


# Variables of interest
sumtable(cleaned_job, title = "Summary table for working hours and income", out = 'kable', simple.kable = TRUE)

# Overall national happiness
overall_hp <- cleaned_data %>% 
  count(happy) %>% 
  mutate(proportion = n/sum(n)*100)

cleaned_data %>% ggplot(aes(happy)) +
  geom_bar() +
  theme_minimal() +
  labs(x = "Level of Happiness",
       y = "Number of Respondents",
       title = "Overall national happiness")

# Happiness by age group
by_age <- cleaned_data %>% 
  group_by(age) %>% 
  count(happy)
sumtable(by_age, title ="Happiness by age", out = 'kable', simple.kable = TRUE)

count_age <- cleaned_data %>% 
  count(age) %>% 
  mutate(proportion = n/sum(n)*100)

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
by_sex <- cleaned_data %>% 
  group_by(sex) %>% 
  count(happy)

count_sex <- cleaned_data %>% 
  count(sex) %>% 
  mutate(proportion = n/sum(n)*100)

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
by_race <- cleaned_data %>% 
  group_by(race) %>% 
  count(happy)

count_race <- cleaned_data %>% 
  count(race) %>% 
  mutate(proportion = n/sum(n)*100)

cleaned_data %>% group_by(race) %>% 
  ggplot(aes(x=happy, fill=race)) +
  geom_bar() +
  facet_wrap(~race, scales ="free") +
  theme_minimal() +
  labs(x="Level of Happiness",
       y="Number of Respondents",
       title="Happiness by race")+
  theme(legend.position = "none")
