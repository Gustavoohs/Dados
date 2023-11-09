# Pacotes
library(raster)
library(RStoolbox)

# Leitura das imagens
img_a <- brick("C:/Users/Documents/2022-07-14.tif")

img_b <- brick("C:/Users/Documents/2023-07-14.tif")

# Rodando modelo
PIF <- pifMatch(img_b, img_a, returnPifMap = TRUE, 
                         returnSimMap = TRUE, returnModels = TRUE)

# Similaridade
ggR(PIF$simMap, geom_raster = TRUE) 

# Máscara de pixels pseudo-invariante
ggR(PIF$pifMap)