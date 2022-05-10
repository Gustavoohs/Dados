
# Pacotes
library(raster)
library(RStoolbox)
library(ggplot2)
library(maptools)

# leitura da imagem de dos pontos 
img <- brick('L71221071_07120010720_DN.tif')
pontos <- readShapePoints('pts_em.shp')

# Construindo endmembers com base nos pontos
df = raster::extract(img, pontos, df=TRUE)

# Transformando endmembers para matriz
df <- subset( df, select = -ID )
df <- data.matrix(df)

# Gerando imagens fração 
unmix <- mesma(img, df, method = "NNLS")

# Visualizando resultado
plotRGB(unmix, r=3, g=2, b=1, stretch='lin')

