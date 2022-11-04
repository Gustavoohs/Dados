# Carregando pacotes
library(nortest)
library(raster)

options(scipen = 999)

# Lendo arquivo 
img <- stack("L71221071_07120010720_DN.tif")

# Calculando ndvi
ndvi <- (img[[4]] - img[[3]]) / (img[[4]] + img[[3]])

# Extraindo amostras regulares do ndvi
ndvi_sample <- sampleRegular(ndvi, 5000)

# Realizando teste de shapiro no ndvi
shapiro.test(as.matrix(ndvi_sample))

# Realizando teste de shapiro em todas as bandas da imagem original
list_1 = list()

for(i in 1:6) {
    test_shap = shapiro.test(as.matrix(sampleRegular(img[[i]], 5000)))

    list_1 <- append(list_1, list(c(test_shap[1], test_shap[2])))
}

# Transformando resultado e, dataframe e gravando em CSV
df <- data.frame(list_1)
write.csv(t(df), "df.csv")

# Visualizando histogramas
hist(img, breaks = 255)