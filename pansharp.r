# Pacotes
library(raster)
library(ggplot2)
library(Rstoolbox)

# Leitura dos arquivos
multi <- brick('mult.tif')
pan <- brick('pan_cut.tif')

# Pansharpening
pansharp_brovey <- panSharpen(multi, pan, r=3,g=2,b=1,
method = 'brovey')
pansharp_ihs <- panSharpen(multi, pan, r = 3, g=2,b=1, method = 'ihs' )

# Visualização do resultado
ggRGB (crop(multi, extent(multi, 300,400,300,400)),
stretch ='lin') + ggtitle('Original')
ggRGB (crop (pansharp_brovey, extent(multi, 300,400,300,400)),
stretch='lin') + ggtitle('Brovey')
ggRGB (crop (pansharp_ihs, extent(multi, 300,400,300,400)),
stretch='lin') + ggtitle('IHS')