# Setup
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(tidyselect))
suppressPackageStartupMessages(library(tidyr))
suppressPackageStartupMessages(library(readr))

df_train <- read_csv("trainingsdaten_rile_21022022.csv") %>%
    group_by(left_right) %>%
    summarise(n=n())

print(df_train)

df_test <- read_csv("testdaten_rile_21022022.csv") %>%
    group_by(left_right) %>%
    summarise(n=n())

print(df_test)
