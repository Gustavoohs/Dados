# Pacotes
library(glcm)
library(raster)

# Leitura da imagem
img <- raster('C:/Users/Aluga.com/Documents/ndvi.tif')

# Cálculo da GLCM 
GLCM <- glcm(img)

# Visualização dos atributos texturais
plot(GLCM)