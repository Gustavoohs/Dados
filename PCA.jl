# Pacotes
using Colors
using ArchGDAL
using Statistics
using StatsBase
using LinearAlgebra
using Images
using Plots

# Lendo o arquivo
dataset = ArchGDAL.read("C:/Users/aluga.com/Documents/L71221071_07120010720_DN.tif")

# Transformando em array
array = ArchGDAL.read(dataset)

# Transpondo o array
array2 = permutedims(array,(2,1,3))

# Transformando cubo em matrix com 2 dimensões
img2d = reshape(array2,(size(array2)[1]*size(array2)[2], size(array2)[3]))

# Calculando a matrix de covariância
cova = cov((img2d))

# Calculando autovalores e autovetores
autos = eigen(cova, sortby = x -> -abs(x))
autos.vectors[:,:] = autos.vectors[:,:]*-1

# Extraindo PCs 
PCs = img2d * autos.vectors

# Retornando para as dimensões originais (cubo)
cubo = reshape(PCs,(size(array2)[1], size(array2)[2], size(array2)[3]))

# Definindo função de expansão
function expansao(img, percent_ini=2, percent_fim=98)
    img_flat = reshape(img,(size(img,1)*size(img,2)))
    s = zeros(size(img_flat,1))
    x,y = 0,255  
    w = percentile(img_flat, percent_ini)
    z = percentile(img_flat, percent_fim)        
    p = x.+ (img_flat.- w) * (y - x) / (z - w) 
    p[p.<x] .= x
    p[p.>y] .= y
    s = reshape(p, (size(img,1), size(img,2)))
end

# Visualizando retenção de informação por PC
x = [1,2,3,4,5,6]
y = (autos.values/sum(autos.values)*100)
Plots.plot(x,y, legend = false)
Plots.xlabel!("PCs")
Plots.ylabel!("Retenção (%)")

# Visualizando composição
RGB.(expansao(cubo[:,:,1])/255,expansao(cubo[:,:,2])/255,expansao(cubo[:,:,3])/255)
