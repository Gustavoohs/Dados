# Pacotes
using ImageContrastAdjustment
using Images
using Plots
using ArchGDAL

# Leitura dos arquivos
ds1 =  ArchGDAL.read("C:/Users/Aluga.com/Documents/a2_b08.tif")
ds2 =  ArchGDAL.read("C:/Users/Aluga.com/Documents/a1_b08.tif")
ds1_band = ArchGDAL.getband(ds1,1)
ds2_band = ArchGDAL.getband(ds2,1)

# Conversão para array
img_source = ArchGDAL.read(ds1_band)
img_reference = ArchGDAL.read(ds2_band)

# Histogram matching
img_transformed = adjust_histogram(img_source, Matching(targetimg = img_reference))

# Visualização do resultado
mosaicview(img_source, img_reference, img_transformed; nrow = 1)