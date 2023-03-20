# Pacotes
using Images
using ImageFiltering
using Statistics
using FileIO
using Plots

# Carregando imagem
img = load("C:/Users/Aluga.com/Documents/S1A_VH.tif")

# Definindo tamanho do kernel
k = 9

# Definindo tamanho do pad
pad_size = (k-1)/2 |> Int8

# Aplicando pad na imagem
padded = padarray(img, Pad(pad_size, pad_size))

# Primeira etapa do filtro
filtered = similar(img)

# Iterando em cada pixel da imagem
for i in 1:size(img, 1), j in 1:size(img, 2)
    
    # Janela local
    window = view(padded, (i:i+k-1, j:j+k-1))
    
    # Estatística local
    local_mean = mean(window)
    local_var = var(window)
    
    # Calculando peso
    filter_weight = local_var / (local_var + mean(window .- local_mean)^2)
    
    # Aplicando filtro
    filtered[i, j] = local_mean + filter_weight * (img[i, j] - local_mean)
    
end

# Salvando resultado
save("C:/Users/Aluga.com/Documents/S1A_VH_lee.tif", filtered)