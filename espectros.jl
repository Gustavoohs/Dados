# Pacotes
using ArchGDAL
using Colors
using Plots

# Lendo cubo
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
img = [lista[1];;;lista[2];;;lista[3];;;lista[4];;;lista[5];;;lista[6]]

# Visualizando espectro do pixel 600,1400
x = [485, 560, 660, 836, 1650, 2210 ]
plot(x, img[600,1400,:], title = "Vegetação", lw=3, legend = false, color = [:green])
xlabel!("Comprimento de onda (nm)")


