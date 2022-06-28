# Pacotes
using Colors
using ArchGDAL
using Statistics
using Images
using CairoMakie
using LinearAlgebra

# Lendo o arquivo
dataset = ArchGDAL.read("L71221071_07120010720_DN.tif")

# Transformando em array
array = ArchGDAL.read(dataset)

# Transpondo o array
array2 = permutedims(array,(2,1,3))

# Transformando cubo em matriz com 2 dimensões
img2d = reshape(array2,(size(array2)[1]*size(array2)[2], size(array2)[3]))

# Calculando a matrix de covariância
cova = reverse(cov(img2d),dims=2)

# Visualizando resultado
heatmap(cova)

# Visualizando composição
RGB.(array2[:,:,3]/255,array2[:,:,4]/255,array2[:,:,2]/255)
