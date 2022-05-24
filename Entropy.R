# Pacotes
library(raster)
library(RStoolbox)
library(rasterVis)
library(RColorBrewer)

# Leitura da imagem
img <- brick('L71221071_07120010720_DN_CUT.tif')

# Definindo rampa de cores
color = rasterTheme(region=rev(brewer.pal('RdYlGn', n=7)))

# Calculando entropia para todas as bandas
entro <- rasterEntropy(img)

# Visualizando resultado
levelplot(entro, par.settings = color, margin = list(FUN = 'mean'))



