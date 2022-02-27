# Setup
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(tidyselect))
suppressPackageStartupMessages(library(tidyr))
suppressPackageStartupMessages(library(readr))

# CSV aus Github laden
df_roh <- read_csv("https://raw.githubusercontent.com/NiksMer/get_manifesto_data/main/complete_data.csv")

# Filtern auf Trainingsdaten. Canada wird herausgefiltert.
# Filtern auf Trainingsdaten. Canada wird herausgefiltert.
df_train_roh <- df_roh %>%
    select(text,left_right,corpus_code) %>%
    dplyr:: filter(!corpus_code %in% c("62110_200810","62320_200406","62320_200601","62320_200810","62420_200406","62420_200601","62420_200810","62623_200406","62623_200601","62623_200810")) %>%
    select(-corpus_code) %>%
    rename(label = left_right)

df_test <- df_roh %>%
    select(text,left_right,corpus_code) %>%
    dplyr:: filter(corpus_code %in% c("62110_200810","62320_200406","62320_200601","62320_200810","62420_200406","62420_200601","62420_200810","62623_200406","62623_200601","62623_200810")) %>%
    rename(label = left_right)

## 80% Trainingsgröße
smp_size <- floor(0.85 * nrow(df_train_roh))

## Seed definieren für Reproduzierbarkeit
set.seed(123)
train_ind <- sample(seq_len(nrow(df_train_roh)), size = smp_size)

# Daten schneiden
df_train <- df_train_roh[train_ind, ]
df_val <- df_train_roh[-train_ind, ]

# Daten speichern
write_csv(df_train,"00_Data/01_data/trainingsdaten_rile_27022022.csv")
write_csv(df_val,"00_Data/01_data/validierungsdaten_rile_27022022.csv")
write_csv(df_test,"00_Data/01_data/testdaten_rile_27022022.csv")