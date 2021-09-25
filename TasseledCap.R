# Pacotes
library(raster)
library(RStoolbox)
library(ggplot2)
library(tidyverse)
library(RColorBrewer)
library(gridExtra)

# Leitura da imagem
land7 <- brick("D:/Downloads/Recente/L7_c.tif")


# Calculando o tasseledCap (sem a banda termal)
lsat_tc <- tasseledCap(land7[[c(1:5,7)]], sat = "Landsat7ETM")

# Visualizando resultado
plot(lsat_tc, col=rev(brewer.pal(n=10, name = "Greys")))

# Transformando resultado em dataframe
dt <- as.data.frame(lsat_tc)


# Visualizando scatterplots
plt1 <- ggplot(data = dt, aes(x = brightness, y = greenness)) +
  geom_point() 
plt2 <-ggplot(data = dt, aes(x = wetness, y = greenness)) +
  geom_point() 
plt3 <-ggplot(data = dt, aes(x = brightness, y = wetness)) +
  geom_point() 
grid.arrange(plt1, plt2, plt3,  ncol=3)

