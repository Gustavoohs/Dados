# Pacotes
library(raster)
library(RStoolbox)
library(maptools)
library(RColorBrewer)

# leitura da imagem de dos pontos 
img <- brick('L71221071_07120010720_DN.tif')
points <- readShapePoints('pts_em.shp')

# Extraindo referências
endmembers <- extract(img, points)

# Convertendo para DataFrame
df <- as.data.frame(endmembers)
df <- t(data.matrix(df))

#Visualizando espectros de referência
color <- c('blue', 'darkgreen', 'orange', 'red','green','brown')
wave <- c(0.485, 0.555, 0.66, 0.83, 1.65, 2.22)
leg <- c('Água', 'Mata','Solo', 'Urbano', 'Cerrado', 'Campo')

matplot(y=df,x=wave,type='l',col=color,lwd=3,ylim=c(0,150))
legend('topleft', legend=leg, col=color,lwd=2)

# Calculando SAM
SAM <- RStoolbox::sam(img, endmembers, angles = TRUE)

# Visualizando resultado
plot(SAM,col=brewer.pal(n=10, name = "Greys"))
