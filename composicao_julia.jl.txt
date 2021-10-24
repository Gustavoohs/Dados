# Pacotes
using ArchGDAL
using Images

# Lendo o arquivo
dataset = ArchGDAL.read("cubo_L7.tif")

# Transformando em array
array = ArchGDAL.read(dataset)

# Transpondo o array
array2 = permutedims(array,(2,1,3))

# Visualizando composição
RGB.(array2[:,:,3]/255,array2[:,:,4]/255,array2[:,:,2]/255)