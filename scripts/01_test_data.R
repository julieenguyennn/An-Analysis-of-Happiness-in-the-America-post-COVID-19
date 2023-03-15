#### Preamble ####
# Purpose: Test the simulated data
# Author: Missy Zhang, Julie Nguyen, Linrong Li
# Data: 7 March 2023
# Contact: mengze.zhang@mail.utoronto.ca
# License: MIT


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