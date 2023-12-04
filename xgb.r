# Pacotes
require(sp)
require(rgdal)
require(raster)
require(RStoolbox)

# Lendo imagem
img <- stack('C:/Users/Aluga.com/Documents/L71221071_07120010720_DN.tif')    

# Lendo áreas de treinamento
roi <- readOGR('C:/Users/Aluga.com/Downloads/ROI.shp')

# Definindo cores
pal <- c("blue", "gray", "darkgreen","green","orange","red")

# Visualizando áreas de treinamento
plotRGB(img, r=3,g=2,b=1, stretch='lin')
plot(roi, add = TRUE, col="red")

# Classificando com xgb
xgb <- superClass(img, trainData = roi, responseCol = "id", 
                       model = "xgbTree", tuneLength = 1, trainPartition = 0.5)

# Visualizando resultado
plot(xgb$map, col = pal, legend = FALSE, axes = FALSE, box = FALSE)