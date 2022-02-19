# Pacotes
library(raster)
library(RColorBrewer)

# Lendo imagem
img <- brick("/home/gustavo/Downloads/cubo_L7.tif")

# Instanciando classificador
Km<- kmeans(img[], centers=8)

# Criando imagem com o formato da primeira banda
class <- raster(img[[1]])

# Armazenando clusters kmeans
class <- setValues(class, Km$cluster)

# Visualizando resultado
plot(class, col=rev(brewer.pal(n=8, name="Accent")))


