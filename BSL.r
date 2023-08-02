# Pacotes
library(landsat)
library(raster)

setwd("C:/Users/Aluga.com/Desktop")

#Leitura dos arquivos
b3 <- as.matrix(raster("B3.tif"))
b4 <- as.matrix(raster("B4.tif"))

# Calculando e visualizando BSL
bsl <- BSL(b3, b4, method = "quantile", ulimit = 0.99, llimit = 0.005, maxval = 255)
plot(as.vector(b3), as.vector(b4))
abline(bsl$BSL, col="red")
points(bsl$top[1], bsl$top[2], col="green", cex=2, pch=16)