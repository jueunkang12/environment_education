#### Preamble ####
# Purpose: Downloads and saves the data from US 2021 GSS
# Author: Jueun Kang
# Data: 20 April 2023
# Contact: jueun.kang@mail.utoronto.ca
# Pre-requisites: N/A

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(tidyr)
library(haven)
library(dplyr)

#### Download raw data ####
raw_data <-
  read_dta("~/Documents/environment_education/inputs/data/GSS2021.dta")

#### Save raw data ####
write_csv(raw_data, "~/Documents/environment_education/inputs/data/raw_data.csv") 