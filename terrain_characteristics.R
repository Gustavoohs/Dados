# Pacotes
library(RColorBrewer)
library(raster)
library(rasterVis)

# Leitura da imagem
srtm <- raster('C:/dem.tif')

# Definindo projeção 
crs(srtm) <- "+proj=utm +zone=23 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs"

# Visualização 3D
plot3D(srtm)

# Geração de atributos morfométricos
slope <- terrain(srtm, opt='slope', unit='degrees', neighbors=8)
aspect <- terrain(srtm, opt='aspect', unit='degrees', neighbors=8)
tpi <- terrain(srtm, opt='TPI', neighbors=8)
tri <- terrain(srtm, opt='TRI', neighbors=8)

# Visualização dos atributos
plot(slope, col = terrain.colors(n=10))
plot(aspect, col=colorRampPalette(c("red", "white", "blue"))(255))
plot(tpi, col = brewer.pal(n = 20, name = "RdYlGn"))
plot(tri, col = brewer.pal(n = 10, name = "Spectral"))

