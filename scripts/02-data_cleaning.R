#### Preamble ####
# Purpose: Cleans.... [...UPDATE THIS...]
# Author: Jueun Kang
# Data: 29 March 2023
# Contact: jueun.kang@mail.utoronto.ca
# Pre-requisites: N/A
# Any other information needed? N/A

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(tidyr)
library(haven)
library(dplyr)

#### Reads in data to be cleaned ####
raw_data <- read_dta("~/Documents/environment_education/inputs/data/GSS2021.dta")

#### Select relevant variables ####
clean_data <- clean_names(raw_data) |>
  select(
    id, 
    degree,
    grnprice,
    grnmoney
  ) |>
  drop_na(
    id,
    degree,
    grnprice,
    grnmoney
  )
  
#### Clean data to show respondents' degree and count ####
degrees_clean <- clean_data |>
  select(
    id,
    degree
  )

#### Clean data to show respondents' willingness to pay towards environment ####
willingness_clean <- clean_data |>
  select(
    id,
    grnprice
  )

#### Clean data to show respondents who donated towards environmental group ####
donation_clean <- clean_data |>
  select(
    id,
    grnmoney
  )

#### Save data ####
# [...UPDATE THIS...]
# change cleaned_data to whatever name you end up with at the end of cleaning
write_csv(cleaned_data, "outputs/data/cleaned_data.csv")

