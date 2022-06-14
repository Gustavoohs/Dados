# Pacotes
library(sf) 
library(tmap)    
library(leaflet) 

# Leitura do arquivo
mt <- st_read('MT_indices.geojson')

# Visualização
mt_map<- tm_shape(mt) + tm_polygons('IVS', popup.vars=c(
  "IVS: "="IVS"), id="firjan_Mun", alpha=0.5)

# Visualização interativa
tmap_mode("view")
mt_map + tm_basemap(server = "OpenTopoMap")

