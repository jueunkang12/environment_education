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
  
### Clean data to show respondents' degree and count ###
degrees_clean <- clean_data |>
  select(
    id,
    degree
  ) 

### Clean data to show respondents' willingness to pay towards environment ###
willingness_clean <- clean_data |>
  select(
    id,
    grnprice
  )

### Clean data to show respondents who donated towards environmental group ###
donation_clean <- clean_data |>
  select(
    id,
    grnmoney
  )

#### Change from numeric to character ####
degrees_clean$degree <- as.character(degrees_clean$degree)
willingness_clean$grnprice <- as.character(willingness_clean$grnprice)
donation_clean$grnmoney <- as.character(donation_clean$grnmoney)

#### Change the values based on the code book ####

degrees_clean <- degrees_clean |> 
  mutate(
    degree =
      case_match(
        degree,
        "0" ~ "< High School",
        "1" ~ "High School",
        "2" ~ "Junior College",
        "3" ~ "Bachelors",
        "4" ~ "Graduate"
      )
  )

willingness_clean <- willingness_clean |>
  mutate(
    grnprice =
      case_match(
        grnprice,
        "1" ~ "Very Willing",
        "2" ~ "Fairly Willing",
        "3" ~ "Neutral",
        "4" ~ "Fairly Unwilling",
        "5" ~ "Very Unwilling"
      )
  )

donation_clean <- donation_clean |>
  mutate(
    grnmoney =
      case_match(
        grnmoney,
        "1" ~ "Yes",
        "2" ~ "No"
      )
  )

#### Save data ####
write_csv(clean_data, "~/Documents/environment_education/inputs/data/clean_data.csv")
write_csv(degrees_clean, "~/Documents/environment_education/inputs/data/degrees_clean.csv")
write_csv(willingness_clean, "~/Documents/environment_education/inputs/data/willingness_clean.csv")
write_csv(donation_clean, "~/Documents/environment_education/inputs/data/donation_clean.csv")
