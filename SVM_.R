# Pacotes
library(RStoolbox)
library(sp)
library(raster)

# Leitura da imagem
img <- brick('/home/gustavo/Documentos/L71221071_07120010720_DN.tif')

# Leitura das áreas de treinamento
roi <- readOGR('/home/gustavo/Documentos/ROI.shp')

# Definindo paleta de cores
pal <- c('blue','gray','darkgreen','green','orange','red')

# Rodando classificador
svm<- superClass(img, trainData = roi, responseCol = "id", 
                      model = "svmLinear3", tuneLength = 1, 
                      trainPartition = 0.7)

# Visualizando resultado
plot(svm$map, col = pal, legend = FALSE, axes = FALSE, box = FALSE)

