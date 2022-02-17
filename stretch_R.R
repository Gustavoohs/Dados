
# Pacotes
library(raster)
library(RColorBrewer)

# Leitura da imagem
img <- brick('cubo_L7.tif')

# Banda 4
b4 <- img[[4]]

# Realizando expansão
s <- stretch(b4, minq = 0.02, maxq = 0.98)

# Visualizando histogramas
par(mfrow = c(1,2))
hist(b4, breaks=200, main='B4 Original')
hist(s, breaks=200, main='B4 com expansão')

# Visualizando imagens
par(mfrow = c(1,2))
plot(b4, col=colorRampPalette(c("black", "gray", "white"))(255), 
     main='B4 Original')
plot(s, col=colorRampPalette(c("black", "gray", "white"))(255),
     main='B4 com expansão')

