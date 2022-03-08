# Pacotes
library(sf)
library(tmap)
library(dplyr)
library(mapview)

# Lendo arquivo
inep <- st_read("/home/gustavo/Downloads/inep_df.shp")

# Extraindo coordenadas
coord <- inep$geometry

# Criando grid
grid3km = st_make_grid(coord, c(3000, 3000), what = "polygons", square = TRUE)

# Transformando para objeto do tipo Simple Feature
grid3km_sf = st_sf(grid3km)

# Armazenando contagem de pontos no grid
grid3km_sf$contagem = lengths(st_intersects(grid3km_sf, coord))

# Visualizando grid
plot(grid3km_sf)

# Visualizando grid com valores maiores que zero
grid_count = filter(grid3km_sf, contagem > 0)
mapview(grid_count, cex = 5, alpha = 0.7)

