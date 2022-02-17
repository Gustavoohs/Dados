# Pacotes
library(raster)
library(rasf)

# Leitura da imagem
cubo <- brick('C:/Cubo_SR.tif')

# Pontos para tabela
pts <- volcano_points(x = cubo, n = 100)

# Extraindo coordenadas
coord <- subset(pts, select = c(5,6))

# Visualizando resultado
plot(cubo[[1]], col=colorRampPalette(c("black", "gray", "white"))(255))
points(coord, col='green')












# Criando 100 pontos aleatórios
ext <- extent(160665, 206265, 8242285, 8279275 )
set.seed(124)
pontos <- randomPoints(cubo, 100, ext=ext)


