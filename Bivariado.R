# Pacotes
library(biscale)
library(ggplot2)
library(sf)
library(cowplot)

# Lendo arquivo
mt <- st_read('C:/Users/Pichau/MT_indices.shp')

# Criando classe bivariada
data <- bi_class(mt, x = IVS, y = IDHM, style = "quantile", dim = 3)

# Criando mapa
map <- ggplot() +
  geom_sf(data = data, mapping = aes(fill = bi_class), color = "white", 
          size = 0.1, show.legend = FALSE) +
  bi_scale_fill(pal = "DkBlue", dim = 3) +
  bi_theme()

# Criando legenda
legend <- bi_legend(pal = "DkBlue",
                    dim = 3,
                    xlab = "IVS ",
                    ylab = "IDHM ",
                    size = 10)

# Visualização
ggdraw() +
  draw_plot(map, 0, 0, 1, 1) +
  draw_plot(legend, 0.2, .8, 0.2, 0.2)

