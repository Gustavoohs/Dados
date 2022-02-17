# Pacotes
library(raster)
library(RStoolbox)
library(ggplot2)

# Leitura da imagem
img <- brick('cubo_L7.tif')

# Aplicando Principal components
pca <- rasterPCA(img)

# Visualizando resultado em composição colorida
ggRGB(pca$map,1,2,3, stretch="lin", q = c(0.02, 0.98))

# Visualizando componentes separadas
ggR(pca$map, 1:6, geom_raster=TRUE, stretch = "lin") +
  scale_fill_gradientn(colors=grey.colors(256), guide = FALSE) +
  theme(axis.text = element_text(size=5), 
        axis.text.y = element_text(angle=90),
        axis.title=element_blank())
