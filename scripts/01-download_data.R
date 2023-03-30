#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
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

#### Download raw data ####
raw_data <-
  read_dta("~/Documents/environment_education/inputs/data/GSS2021.dta")

#### Save raw data ####
write_csv(raw_data, "~/Documents/environment_education/inputs/data/raw_data.csv") 