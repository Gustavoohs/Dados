# Pacotes
require(raster)
require(RSAGA)

# Leitura do DEM
srtm <- raster("DEM.tif")

# Iniciando o ambiente SAGA
env <- rsaga.env()

# Convertendo o DEM para o formato SAGA
writeRaster(srtm, filename="srtm_rsaga.sgrd",format="SAGA",overwrite=TRUE)

# Acessando funções de declividade e aspecto
rsga.slope(in.dem= "srtm_rsaga.sgrd", out.slope="slope", env=env)
rsga.aspect(in.dem= "srtm_rsaga.sgrd", out.aspect="aspect", env=env)

# Lendo resultados como raster
slope <- raster("slope.sdat")
aspect <- raster("aspect.sdat")

# Visualizando resultados
plot(slope)
plot(aspect)