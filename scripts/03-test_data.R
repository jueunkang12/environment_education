#### Preamble ####
# Purpose: Tests the properties of the data set
# Author: Jueun Kang
# Data: 20 April 2023
# Contact: jueun.kang@mail.utoronto.ca
# Pre-requisites: N/A


#### Workspace setup ####
library(tidyverse)

#### Test data ####

## Data set up

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

## Tests
simulated_degree_data$count |> 
  min() >= 0

simulated_degree_data$count |> 
  max() <= 1000

simulated_degree_data$count |>
  class() == "numeric"

simulated_degree_data$degree |>
  class() == "character"
