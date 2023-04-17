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
library(labelled)

#### Reads in data to be cleaned ####
raw_data <- read_dta("~/Documents/environment_education/inputs/data/GSS2021.dta")
raw_data <- labelled::to_factor(raw_data)

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

degrees_clean <- 
  degrees_clean |> 
  mutate(
    degree =
      case_match(
        degree,
        "less than high school" ~ "< High School",
        "high school" ~ "High School",
        "associate/junior college" ~ "Junior College",
        "bachelor's" ~ "Bachelors",
        "graduate" ~ "Graduate"
      )
    ) |>
      mutate(
        degree = factor(degree),
        degree = fct_relevel(
          degree,
          "< High School",
          "High School",
          "Junior College",
          "Bachelors",
          "Graduate"
        )
      )

willingness_clean <- 
  willingness_clean |>
  mutate(
    grnprice =
      case_match(
        grnprice,
        "very willing" ~ "Very Willing",
        "fairly willing" ~ "Fairly Willing",
        "neither willing nor unwilling" ~ "Neutral",
        "fairly unwilling" ~ "Fairly Unwilling",
        "very unwilling" ~ "Very Unwilling"
      )
    ) |>
      mutate(
        grnprice = factor(grnprice),
        grnprice = fct_relevel(
        grnprice,
        "Very Unwilling",
        "Fairly Unwilling",
        "Neutral",
        "Fairly Willing",
        "Very Willing"
      )
    )

donation_clean <- donation_clean |>
  mutate(
    grnmoney =
      case_match(
        grnmoney,
        "no, i have not" ~ "No",
        "yes, i have" ~ "Yes"
      )
  )

#### Save data ####
write_csv(clean_data, "inputs/data/clean_data.csv")
write_csv(degrees_clean, "inputs/data/degrees_clean.csv")
write_csv(willingness_clean, "inputs/data/willingness_clean.csv")
write_csv(donation_clean, "inputs/data/donation_clean.csv")
