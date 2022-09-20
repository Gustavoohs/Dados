# Pacotes
library(sp)
library(sf)
library(raster)
library(spatstat)

# Leitura de arquivos
estacoes <- st_read('estacoes.shp')
df <- st_read('DF.shp')

# Selecionando pontos
pt_est  <- as.ppp(estacoes)
marks(pt_est) <- NULL

# Calculando densidade
kde <- density(pt_est)

# Visualizando resultado
plot(kde, main=NULL)
points(pt_est, pch=20, col="black")
contour(kde, add=TRUE)
plot(df$geometry, border='black', lwd=3, add=TRUE)