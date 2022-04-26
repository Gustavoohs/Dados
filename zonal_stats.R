# Pacotes
library(raster)
library(maptools)

# Leitura da imagem
img <- brick('/home/gustavo/Documentos/L71221071_07120010720_DN.tif')

# Leitura do arquivo vetorial
poly <- readShapePoly("/home/gustavo/Documentos/ROI.shp")

# Extraindo média dos valores de pixel para cada polígono
for (i in 1:dim(img)[3]){
  z_stats <- extract(img, poly, fun=mean, na.rm=TRUE, df=TRUE)
}
