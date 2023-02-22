# Pacotes
library(raster)

# Leitura da imagem
raster_file <- raster("/home/gustavo/Documentos/VH.tif")

# Parâmetros do filtro Lee
window <- 11
num_looks <- 11

# Cálculo do filtro
lee_filter <- focal(raster_file, w=matrix(1, nrow=window, ncol=window),
                     fun= function(x) {
                       mean <- mean(x)
                       var <- var(x)
                       
                       coef <- var / (var + num_looks * (mean ^ 2))
            
                       res <- mean + coef * (x - mean)
                       return(res)
                     })

# Gravando resultado em disco
writeRaster(lee_filter, "/home/gustavo/Documentos/VH_lee.tif", format="GTiff")
