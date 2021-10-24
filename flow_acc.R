# Pacotes
library(raster)
library(whitebox)
library(tmap)

whitebox::wbt_init()

# Relevo sombreado
wbt_hillshade(dem = 'D:/Desk/R/DEM.tif',
              output = 'D:/Desk/R/hill.tif',azimuth = 115)

# Fluxo acumulado
wbt_d8_flow_accumulation('D:/Desk/R/DEM.tif', 'D:/Desk/R/flw.tif')

hill <- raster('D:/Desk/R/hill.tif')
flow <- raster('D:/Desk/R/flw.tif')

# Visualizando relevo sombreado
tm_shape(hill)+
  tm_raster(style = "cont", palette = "-Greys", legend.show = FALSE)+
  tm_scale_bar()

# Visualizando fluxo acumulado
tm_shape(hill)+
  tm_raster(style = "cont",palette = "-Greys", legend.show = FALSE)+
  tm_shape(log(flow))+
  tm_raster(style = "cont", palette = "Blues", legend.show = TRUE, alpha = .5)+
  tm_scale_bar()
