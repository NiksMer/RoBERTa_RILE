# Setup
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(tidyselect))
suppressPackageStartupMessages(library(tidyr))
suppressPackageStartupMessages(library(readr))

# CSV aus Github laden
df_roh <- read_csv("https://raw.githubusercontent.com/NiksMer/get_manifesto_data/main/complete_data.csv")

# Filtern auf Trainingsdaten. Canada wird herausgefiltert.
df_train_roh <- df_roh %>%
    dplyr::filter(countryname!="Canada") %>%
    select(text,left_right)

## 80% Trainingsgröße
smp_size <- floor(0.8 * nrow(df_train_roh))

## Seed definieren für Reproduzierbarkeit
set.seed(123)
train_ind <- sample(seq_len(nrow(df_train_roh)), size = smp_size)

# Daten schneiden
df_train <- df_train_roh[train_ind, ]
df_val <- df_train_roh[-train_ind, ]

df_test <- df_roh %>%
    dplyr::filter(countryname=="Canada") %>%
    select(text,left_right,corpus_code)

# Daten speichern
write_csv(df_train,"trainingsdaten_rile_23022022.csv")
write_csv(df_val,"validierungsdaten_rile_23022022.csv")
write_csv(df_test,"testdaten_rile_23022022.csv")