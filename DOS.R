# Pacotes
library(raster)
library(RStoolbox)

# Lendo arquivo mtl
mtl <- readMeta("C:/LT05_L1TP_221071_20010712_20161210_01_T1_MTL.txt")

# Empilhando com base no mtl
l5_stack <- stackMeta(mtl)

# Aplicando DOS
l5_DOS <- radCor(l5_stack, mtl, method = "dos")

# Gravando resultado em disco
writeRaster(l5_DOS, datatype="FLT4S", filename = "C:/l5_DOS.tif", 
            format = "GTiff", overwrite=TRUE)

# Lendo imagens
L5 <- brick('C:/cubo_L5.tif')
DOS <- brick('C:/l5_DOS.tif')

# Visualizando resultado
options(repr.plot.width=40, height=20)
l <- rbind(c(1,2))
layout(l)
plotRGB(L5, r=3, g=2, b=1, stretch='lin')
plotRGB(DOS, r=3, g=2, b=1, stretch='lin')

