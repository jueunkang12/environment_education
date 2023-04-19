#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Jueun Kang
# Data: 29 March 2023
# Contact: jueun.kang@mail.utoronto.ca
# Pre-requisites: N/A
# Any other information needed? N/A

#### Workspace setup ####
library(tidyverse)
library(janitor)
set.seed(386)

#### Simulate data ####

## Simulate degree data 

simulated_data_degree <- 
  tibble(
    degree = runif(n = 1000, min = 1, 5) |> round(0)
  )

sorted_data_degree <-
  simulated_data_degree |> 
  mutate(
    degree = case_when(
      degree == 1 ~ "< High School",
      degree == 2 ~ "High School",
      degree == 3 ~ "Junior College",
      degree == 4 ~ "Bachelors",
      degree == 5 ~ "Graduate",
      TRUE ~ "Other"
    )
  )

sorted_data_degree

## Simulate willingness data

simulated_data_willingness <-
  tibble(
    willingness = runif(n = 1000, min = 1, 5) |> round(0)
  )

sorted_data_willingness <-
  simulated_data_willingness |> 
    mutate(
      willingness = case_when(
        willingness == 1 ~ "Very Willing",
        willingness == 2 ~ "Fairly Willing",
        willingness == 3 ~ "Neutral",
        willingness == 4 ~ "Fairly Unwilling",
        willingness == 5 ~ "Very Unwilling",
        TRUE ~ "Other"
      )
    )

sorted_data_willingness
  
## Simulate donation data

simulated_data_donation <-
  tibble(
    donation = runif(n = 1000, min = 1, 2) |> round(0)
  )

sorted_data_donation <-
  simulated_data_donation |> 
  mutate(
    donation = case_when(
      donation == 1 ~ "Yes",
      donation == 2 ~ "No",
      TRUE ~ "Other"
    )
  )

sorted_data_donation