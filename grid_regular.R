# Pacotes
library(sf)
library(SpatialPosition)
library(geojsonio)

# Lendo arquivo
df <- geojson_read("DF.geojson", what = 'sp')

# Criando grid
grid <- CreateGrid(w = df, resolution = 1000, returnclass = "sf")

# Visualizando resultado
plot(st_geometry(grid), cex = 0.2)
plot(df, border="red", lwd = 2, add = TRUE)

