library(raster)
library(ggplot2)
library(tidyr)


S2 <- brick('C:/S2_2021_06_26.tif')
pontos <- readOGR('C:/pts.shp')

options(repr.plot.width=40, height=20)
l <- rbind(c(1,2))
layout(l)

plotRGB(S2, r=3, g=2, b=1, stretch='lin')
plot(pontos, add =TRUE, col='red')
plotRGB(S2, r=3, g=4, b=2, stretch='lin')
plot(pontos, add =TRUE, col='red')


df = raster::extract(S2, pontos, df=TRUE)
df <- subset( df, select = -ID )
df <- data.matrix(df)

colnames(df) <- c('B2','B3','B4','B8') 
rownames(df) <- c('Água', 'Campo', 'Cultivo', 'Mata')

color <- c('blue', 'green', 'orange', 'darkgreen')


plot(1, ylim=c(50, 5000), xlim = c(1,4), xlab = "Bandas", xaxt='n')

axis(1, at=1:4, lab=colnames(df))

for (i in 1:nrow(df)){
  lines(df[i,], type = "o", lwd = 3, col = color[i])
}
legend("topleft", rownames(df), cex=0.8, col=color, lwd = 3, bty = "n")
