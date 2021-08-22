# Pacotes
library(spdep)
library(ggplot2)
library(sf)

# Lendo shapefile
mt <- st_read('C:/Users/Pichau/MT_indices.shp')

# Visualizando mapa
ggplot() + 
  geom_sf(data = mt, aes(fill=IVS), color = NA, size = .15) +
  labs(subtitle = "Índice de Vulnerabilidade Social", size=8) +
  scale_fill_distiller(palette= "Reds", trans = "reverse", name='IVS')+
  theme_minimal()
  
# Calculando a matriz de vizinhança  
matriz_v <- poly2nb(mt, row.names = mt$IVS)

# Calculando pesos espaciais
pesos <- nb2listw(matriz_v, style='B')

# Índice de Moran
mor <- moran(mt$IVS, pesos, n=length(pesos$neighbours), S0=Szero(pesos))

# Teste de significância
teste <- moran.test(mt$IVS, pesos, randomisation = FALSE)

# Calculando matriz de peso padronizada
matriz_p <- nb2mat(matriz_v, style='B')
m_padro <- mat2listw(matriz_p, style = 'W')
IVS <- mt$IVS

moran.plot(IVS, m_padro)

