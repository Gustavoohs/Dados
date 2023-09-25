# Pacotes
library(geobr)
library(ggplot2)
library(sf)
library(dplyr)

# Baixando arquivo do Distrito Federal
df <- geobr::read_census_tract(code_tract=5300108)

# Visualização
ggplot() +
  geom_sf(data=df, fill="#2D3E50", color="#FEBF57", size=.15, show.legend = FALSE) +
  labs(subtitle="Setores censitários - DF", size=8) +
  theme_minimal() 