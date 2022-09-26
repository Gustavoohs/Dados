# Pacotes
library(sf)
library(osmdata)

# Requisitando dados
bsb <- opq(bbox = "Brasília, Brazil")
bsb <- add_osm_feature(bsb, key = "highway")
dado <- osmdata_sf(bsb)

# Extraindo linhas
lin <- dado$osm_lines
lin <- lin[, "highway"]

# Reprojetando camada
lin <- st_transform(lin, 31983)

# Visualizando resultado
plot(lin, key.pos = 4, key.width = lcm(15))
