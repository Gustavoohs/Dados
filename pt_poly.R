
# Pacotes
library(sf)
library(ggplot2)


# Leitura do arquivo
mt <- st_read("MT.shp")

# Definindo número de pontos por polígono
numero_de_pontos <- rep(5, nrow(mt))

# Calculando pontos
pontos <- st_sample(mt, numero_de_pontos)

# Visualizando resultado
ggplot() + 
  geom_sf(data = mt) + 
  geom_sf(data = pontos)


