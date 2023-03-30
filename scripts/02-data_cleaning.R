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






#### Save data ####
# [...UPDATE THIS...]
# change cleaned_data to whatever name you end up with at the end of cleaning
write_csv(cleaned_data, "outputs/data/cleaned_data.csv")

