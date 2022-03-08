# Pacotes
using ArchGDAL
using Colors
using Images
using ImageShow
using ImageFiltering

#Lendo arquivo
dataset = ArchGDAL.read("/home/gustavo/Downloads/cubo_L7.tif")
    
# lendo Banda 4 como array
band = ArchGDAL.getband(dataset,4)
array = ArchGDAL.read(band)
    
# Transpondo array
transp = permutedims(array, (2,1))
    
# Reamostrando array para valores entre 0 e 1
array_float = transp / 255
    
# Visualizando banda 4
b4 = Gray.(array_float)

# Declarando kernels
kernel1 = centered([1 0 -1; 2 0 -2; 1 0 -1])
kernel2 = centered([-1 -2 -1; 0 0 0 ;1 2 1])

# Visualizando resultados
Gray.(imfilter(array_float, kernel1))
Gray.(imfilter(array_float, kernel2))


