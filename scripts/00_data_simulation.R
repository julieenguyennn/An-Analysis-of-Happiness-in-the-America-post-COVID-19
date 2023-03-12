#### Preamble ####
# Purpose: Simulates the GSS data
# Author: Missy Zhang
# Data: 7 March 2023 
# Contact: mengze.zhang@mail.utoronto.ca 
# License: MIT



#### Workspace setup ####
library(tidyverse)

#### Simulate data ####

# set seed for reproducibility
set.seed(456)

# simulate data for 50 individuals
n <- 50

# create a data frame with simulated variables
gss_sim <- tibble(
  id = 1:n,
  gender = sample(c("Male", "Female", "Non-binary", "Genderqueer", "Agender"), n, replace = TRUE),
  age = sample(18:99, n, replace = TRUE),
  race = sample(c("White", "Black", "Hispanic", "Asian"), n, replace = TRUE),
  working_hours = sample(c(15:50), n, replace = TRUE),
  income = sample(10000:200000, n, replace = TRUE),
  happiness = sample(1:5, n, replace = TRUE)
  )

#### Test the simulated data ####

# Check if the happiness variable contains values between 1 and 5, and is an integer
gss_sim$happiness |> min() >= 1
gss_sim$happiness |> max() <= 5
gss_sim$happiness |> class()  == "integer"

# Check if the gender variable only contains the specified categories

gss_sim$gender |>
  unique() == c( 
    "Male", "Female", "Non-binary", "Genderqueer", "Agender")

gss_sim$gender|>
  unique() |>
  length() == 5


