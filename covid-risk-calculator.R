library(tidyverse)
library(readxl)

# ggf. richtigen Workspace setzen ----
# setwd("/Users/till/Projekte/snippets/")

# Daten einlesen ----
all <- read_excel("MPIC-Covid-Risk-Calculator-long.xlsx")

# Datensätze für Tabelle erstellen ----
# Ziel:
#     | --ohne Lüften-- | --Stosslüften-- |
#     |   2h   |   4h   |   2h   |   4h   |
#   2 |   x%   |   x%   |   x%   |   x%   |
#   3 |   x%   |   x%   |   x%   |   x%   |


# 15 Quadratmeter ----

# Ohne Maske
dw_15_ohne <- all %>% 
  filter(Raum == 15 & Maske == "nein") %>% 
  pivot_wider(id_cols = Personen, names_from = c(Dauer, Lüften), values_from = Risiko)

dw_15_ohne <- bind_rows(
  c("Personen" = "", "2_nein" = "~~~ohne Lüften~~~", "4_nein" ="", "2_ja" ="~~~Stoßlüften~~~", "4_ja" =""),
  c("Personen" = "Personen", "2_nein" = "2h", "4_nein" ="4h", "2_ja" ="2h", "4_ja" ="4h"),
  dw_15_ohne %>% mutate(across(everything(), as.character))
)

# Mit Maske
dw_15_mit <- all %>% 
  filter(Raum == 15 & Maske == "ja") %>% 
  pivot_wider(id_cols = Personen, names_from = c(Dauer, Lüften), values_from = Risiko)

dw_15_mit <- bind_rows(
  c("Personen" = "", "2_nein" = "~~~ohne Lüften~~~", "4_nein" ="", "2_ja" ="~~~Stoßlüften~~~", "4_ja" =""),
  c("Personen" = "Personen", "2_nein" = "2h", "4_nein" ="4h", "2_ja" ="2h", "4_ja" ="4h"),
  dw_15_mit %>% mutate(across(everything(), as.character))
)


# 30 Quadratmeter ----

# Ohne Maske
dw_30_ohne <- all %>% 
  filter(Raum == 30 & Maske == "nein") %>% 
  pivot_wider(id_cols = Personen, names_from = c(Dauer, Lüften), values_from = Risiko)

dw_30_ohne <- bind_rows(
  c("Personen" = "", "2_nein" = "~~~ohne Lüften~~~", "4_nein" ="", "2_ja" ="~~~Stoßlüften~~~", "4_ja" =""),
  c("Personen" = "Personen", "2_nein" = "2h", "4_nein" ="4h", "2_ja" ="2h", "4_ja" ="4h"),
  dw_30_ohne %>% mutate(across(everything(), as.character))
)

# Mit Maske
dw_30_mit <- all %>% 
  filter(Raum == 30 & Maske == "ja") %>% 
  pivot_wider(id_cols = Personen, names_from = c(Dauer, Lüften), values_from = Risiko)

dw_30_mit <- bind_rows(
  c("Personen" = "", "2_nein" = "~~~ohne Lüften~~~", "4_nein" ="", "2_ja" ="~~~Stoßlüften~~~", "4_ja" =""),
  c("Personen" = "Personen", "2_nein" = "2h", "4_nein" ="4h", "2_ja" ="2h", "4_ja" ="4h"),
  dw_30_mit %>% mutate(across(everything(), as.character))
)


# 45 Quadratmeter ----

# Ohne Maske
dw_45_ohne <- all %>% 
  filter(Raum == 45 & Maske == "nein") %>% 
  pivot_wider(id_cols = Personen, names_from = c(Dauer, Lüften), values_from = Risiko)

dw_45_ohne <- bind_rows(
  c("Personen" = "", "2_nein" = "~~~ohne Lüften~~~", "4_nein" ="", "2_ja" ="~~~Stoßlüften~~~", "4_ja" =""),
  c("Personen" = "Personen", "2_nein" = "2h", "4_nein" ="4h", "2_ja" ="2h", "4_ja" ="4h"),
  dw_45_ohne %>% mutate(across(everything(), as.character))
)

# Mit Maske
dw_45_mit <- all %>% 
  filter(Raum == 45 & Maske == "ja") %>% 
  pivot_wider(id_cols = Personen, names_from = c(Dauer, Lüften), values_from = Risiko)

dw_45_mit <- bind_rows(
  c("Personen" = "", "2_nein" = "~~~ohne Lüften~~~", "4_nein" ="", "2_ja" ="~~~Stoßlüften~~~", "4_ja" =""),
  c("Personen" = "Personen", "2_nein" = "2h", "4_nein" ="4h", "2_ja" ="2h", "4_ja" ="4h"),
  dw_45_mit %>% mutate(across(everything(), as.character))
)


# Datensätze abspeichern ----

write_csv(dw_15_ohne, "dw_15_ohne.csv", col_names = FALSE)
write_csv(dw_15_mit, "dw_15_mit.csv", col_names = FALSE)
write_csv(dw_30_ohne, "dw_30_ohne.csv", col_names = FALSE)
write_csv(dw_30_mit, "dw_30_mit.csv", col_names = FALSE)
write_csv(dw_45_ohne, "dw_45_ohne.csv", col_names = FALSE)
write_csv(dw_45_mit, "dw_45_mit.csv", col_names = FALSE)
