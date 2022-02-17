# Pacotes
library(raster)
library(ggplot2)
library(RStoolbox)

# Leitura da imagem
img <- brick('cubo_L7.tif')

# Banda 1
b1 <- img[[1]]

# Banda 4
b4 <- img[[4]]

# Histogram Matching
match <- histMatch(b1, b4)

# Visualizando resultado
par(mfrow = c(1,3))
plot(b1, col=colorRampPalette(c("black", "gray", "white"))(255), 
     main='B1')
plot(b4, col=colorRampPalette(c("black", "gray", "white"))(255), 
     main='B4')
plot(match, col=colorRampPalette(c("black", "gray", "white"))(255),
     main='Matching')
