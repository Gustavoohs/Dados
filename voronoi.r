# Pacotes
library(sf)
library(mapview)

# Leitura dos arquivos vetoriais
pts <- st_read("C:/Users/Aluga.com/Documents/estacoes1.shp")
df <- st_read("C:/Users/Aluga.com/Documents/DF.shp")

# Criando diagrama de Voronoi
vor <- st_voronoi(st_combine(pts))

# Extraindo apenas os polígonos de voronoi 
vor_pol <- st_collection_extract(vor)

# Visualizando resultado
mapview(vor_pol, alpha = 0.7) + 
    mapview(pts, cex=2, alpha = 0.8) 