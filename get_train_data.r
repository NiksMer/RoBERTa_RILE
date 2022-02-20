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
df_roh <- get_training_data(
  api_key = "manifesto_apikey.txt",
  start_day = lubridate::date("1945-01-01"),
  country_vec = c(
    "United Kingdom",
    "Australia",
    "New Zealand",
    "United States",
    "Canada",
    "Ireland",
    "South Africa"
  ),
  reliability = 0.0,
  seed=1
)

# Daten rausfiltern.
## USA
## Die Republikaner verwendeten 2020 das gleiche Wahlprogramm wie 2016. Daher wird 61620_2020 gelöscht.
df_roh <- df_roh %>%
    dplyr::filter(corpus_code!="61620_202011")

## Kanada
## Der Quebec Bloc (62901) schreibt nur französich.
df_roh <- df_roh %>%
    dplyr::filter(str_starts(corpus_code,"62901")==FALSE)
## Im Jahr 2011 sind alle Wahlprogramme auf Französisch.
df_roh <- df_roh %>%
    dplyr::filter(corpus_code!="62110_201105") %>%
    dplyr::filter(corpus_code!="62320_201105") %>%
    dplyr::filter(corpus_code!="62420_201105") %>%
    dplyr::filter(corpus_code!="62623_201105") %>%
    dplyr::filter(corpus_code!="62901_201105")
    
## Australien
## Vor dem Jahr 2010 wurden überwiegend politische Reden von Kandidierenden kodiert. Erst ab dem Jahr 2010 wurden mehrheitlich Wahlprogramme verwendet.
df_roh <- df_roh %>%
    dplyr::filter(corpus_code!="63620_201111") %>%
    dplyr::filter(corpus_code!="63810_201111") %>%
    dplyr::filter(corpus_code!="63110_200410") %>%
    dplyr::filter(corpus_code!="63320_200410") %>%
    dplyr::filter(corpus_code!="63620_200410") %>%
    dplyr::filter(corpus_code!="63810_200410") %>%
    dplyr::filter(corpus_code!="63110_200711") %>%
    dplyr::filter(corpus_code!="63320_200711") %>%
    dplyr::filter(corpus_code!="63620_200711") %>%
    dplyr::filter(corpus_code!="63810_200711")
## Die Parteien 63621 und 63622 sind, ähnlich wie die CSU, Schwesterparteien von 63620
df_roh <- df_roh %>%
    dplyr::filter(str_starts(corpus_code,"63621")==FALSE) %>%
    dplyr::filter(str_starts(corpus_code,"63622")==FALSE)

df <- df_roh %>%
    select(text,corpus_code,countryname)

# Output
df_temp <- df %>%
    group_by(countryname) %>%
    summarise(manifestos=n_distinct(corpus_code),quasi_saetze=n())

print(head(df_temp,n=10))