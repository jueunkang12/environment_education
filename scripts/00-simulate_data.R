#### Preamble ####
# Purpose: Simulates a sample data set for degree, willingness, and donation
# Author: Jueun Kang
# Data: 20 April 2023
# Contact: jueun.kang@mail.utoronto.ca
# Pre-requisites: Need to know where to get US 2021 GSS data

#### Workspace setup ####
library(tidyverse)
library(janitor)
set.seed(386)

#### Simulate data ####

## Simulate degree data

set.seed(853)

simulated_degree_data <-
  tibble(
    degree =
      c(
        rep("< High School"),
        rep("High School"),
        rep("Junior College"),
        rep("Bachelors"),
        rep("Graduate")
      ),
    count =
      runif(
        n = 5,
        min = 0,
        max = 1000
      ) |> round(0),
  )

head(simulated_degree_data)

## Simulate willingness data

simulated_willingness_data <-
  tibble(
    willingness =
      c(
        rep("Very Willing"),
        rep("Fairly Willing"),
        rep("Neutral"),
        rep("Fairly Unwilling"),
        rep("Very Unwilling")
      ),
    count =
      runif(
        n = 5,
        min = 0,
        max = 1000
      ) |> round(0),
  )

head(simulated_willingness_data)
  
## Simulate donation data

simulated_donation_data <-
  tibble(
    donation =
      c(
        rep("Yes"),
        rep("No")
      ),
    count =
      runif(
        n = 2,
        min = 0,
        max = 1000
      ) |> round(0),
  )

head(simulated_donation_data)