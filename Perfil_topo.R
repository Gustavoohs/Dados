# Pacotes
library(raster)
library(topoDistance)

# Leitura dos arquivos
dem <- raster("C:/dd.tif")
pts = readOGR("C:/coords.shp")

# Extração de coordenadas dos pontos
xy <- matrix(ncol = 2, byrow = TRUE,
             c(pts@coords[1], pts@coords[3],
               pts@coords[2], pts@coords[4]))

# Calculando caminho entre os dois pontos
caminho <- topoDist(dem, xy, paths = TRUE)


# Visualizando caminho no relevo sombreado
topoPathMap(dem, xy, topoPaths = caminho, type = "hillshade",
            pathWidth = 4, cex = 2, bg = "blue")

# Visualizando perfil
topoProfile(dem, topoPaths = caminho, type = "plotly")

