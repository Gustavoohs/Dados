# Pacotes
library(OpenImageR)
library(raster)

# Lendo arquivo
img <- readImage('C:/Users/Documents/cubo.tif')

# Segmentação
slic <- superpixels(input_image = img,
                        method = "slic",
                        superpixel = 5000, 
                        compactness = 30,
                        return_slic_data = TRUE,
                        return_labels = TRUE, 
                        write_slic = "", 
                        verbose = TRUE)

# Visualizando resultado
imageShow(slic$slic_data)