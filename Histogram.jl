# Pacotes
using ArchGDAL
using Images

# Lendo cubo
dataset = ArchGDAL.read("/home/gustavo/Downloads/cubo_L7.tif")
    
# lendo Banda 4 como array
band = ArchGDAL.getband(dataset,4)
array = ArchGDAL.read(band)
    
# Convertendo array para 1-dimensão 
vec = [(array...)...]

# Visualizando histograma
histogram(vec)

