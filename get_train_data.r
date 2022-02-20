# Setup
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(tidyr))
suppressPackageStartupMessages(library(stringr))
suppressPackageStartupMessages(library(lubridate))
suppressPackageStartupMessages(library(purrr))
suppressPackageStartupMessages(library(manifestoR))
suppressPackageStartupMessages(library(tm))
suppressPackageStartupMessages(library(devtools))

# Funktion aus Github laden
source_url("https://raw.githubusercontent.com/NiksMer/get_manifesto_data/main/functions.R")

# Anwendung
df <- get_training_data(
  api_key = "manifesto_apikey.txt",
  start_day = lubridate::date("1945-01-01"),
  country_vec = c(
    "United Kingdom"
  ),
  reliability = 0.0,
  seed=1
)

# Output
df_temp <- df %>%
    mutate(election=str_extract(corpus_code,pattern="[0-9]*$")) %>%
    group_by(election) %>%
    summarise(n=n())

print(df_temp)