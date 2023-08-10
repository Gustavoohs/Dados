# Pacotes
library(raster)
library(RStoolbox)
library(ggplot2)
library(RColorBrewer)
library(gridExtra)

# Leitura da imagem
land7 <- brick("L71221071_07120010720_DN.tif")


# Calculando o tasseledCap (sem a banda termal)
lsat_tc <- tasseledCap(land7, sat = "Landsat7ETM")

# Visualizando resultado
plot(lsat_tc, col = rev(brewer.pal(n = 10, name = "Greys")))

plotRGB(lsat_tc, 1,2,3, stretch = 'lin')

# Transformando resultado em dataframe
dt <- as.data.frame(lsat_tc)

# Visualizando scatterplots
plt1 <- ggplot(data = dt, aes(x = brightness, y = greenness)) +
  geom_point()
plt2 <- ggplot(data = dt, aes(x = wetness, y = greenness)) +
  geom_point()
plt3 <- ggplot(data = dt, aes(x = brightness, y = wetness)) +
  geom_point()
grid.arrange(plt1, plt2, plt3,  ncol = 3)
