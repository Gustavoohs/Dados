# Pacotes
library(raster)
library(RStoolbox)

# Leitura de arquivos
img_84 <- brick('RT_LT05_L1TP_232066_19840624_T1_C_w.tif')
img_20 <- brick('RT_LC08_L1TP_232066_20200729_T1_C_w.tif')

# Visualização das imagens
par(mfrow = c(1,2))
plot(img_84[[4]], col=colorRampPalette(c('black','gray','white'))(255),
     main='B4_1984')
plot(img_20[[4]], col=colorRampPalette(c('black','gray','white'))(255),
     main='B4_2020')

# Cálculo do CVA para bandas 3 e 4
cva <- rasterCVA(img_84[[3:4]], img_20[[3:4]])

# Visualização do resultado
plot(cva, col=colorRampPalette(c('darkgreen','yellow','red'))(255))

