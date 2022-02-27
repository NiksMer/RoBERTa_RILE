# Setup
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(tidyselect))
suppressPackageStartupMessages(library(tidyr))
suppressPackageStartupMessages(library(readr))

df_train <- read_csv("00_Data/01_data/trainingsdaten_rile_27022022.csv") %>%
    group_by(label) %>%
    summarise(n=n())

print(df_train)

df_val <- read_csv("00_Data/01_data/validierungsdaten_rile_27022022.csv") %>%
    group_by(label) %>%
    summarise(n=n())

print(df_val)

df_test <- read_csv("00_Data/01_data/testdaten_rile_27022022.csv") %>%
    group_by(label) %>%
    summarise(n=n())

print(df_test)
