# Setup
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(tidyselect))
suppressPackageStartupMessages(library(tidyr))
suppressPackageStartupMessages(library(readr))

# CSV aus Github laden
df_roh <- read_csv("https://raw.githubusercontent.com/NiksMer/get_manifesto_data/main/complete_data.csv")

# Filtern auf Trainingsdaten. Canada wird herausgefiltert.
df_train <- df_roh %>%
    dplyr::filter(countryname!="Canada") %>%
    select(text,left_right)

df_test <- df_roh %>%
    dplyr::filter(countryname=="Canada") %>%
    select(text,left_right,corpus_code)

# Daten speichern
write_csv(df_train,"trainingsdaten_rile_21022022.csv")
write_csv(df_test,"testdaten_rile_21022022.csv")