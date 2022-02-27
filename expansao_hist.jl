# Pacotes
using Images
using ArchGDAL
using Colors
using StatsBase

# Lendo imagem
dataset = ArchGDAL.read("/home/gustavo/Downloads/cubo_L7.tif")
    
# lendo como array
lista =[]
for i in range(1,6)

    band = ArchGDAL.getband(dataset,i)
    array = ArchGDAL.read(band)
    transp = permutedims(array, (2,1))
    push!(lista, transp)
end

# Empilhando arrays
L7 = [lista[1];;;lista[2];;;lista[3];;;lista[4];;;lista[5];;;lista[6]]

# Definindo função de expansão
function expansao(img, percent_ini, percent_fim)
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

# Rodando função para a banda 4
exp_b4 = expansao(L7[:,:,4], 2, 98)

# Visualizando resultados
Gray.(L7[:,:,4]/255)
Gray.(exp_b4/255)

