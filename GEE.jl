# Pacotes
using EarthEngine
Initialize()

# Definindo coleção
collection = EE.ImageCollection("COPERNICUS/S1_GRD")

# Filtros 
datafilter = And(
    eq(EE.Filter(), "instrumentMode", "IW"),
    listContains("transmitterReceiverPolarisation", "VV"),
    eq(EE.Filter(), "orbitProperties_pass", "DESCENDING"),
)

# Aplicando filtros
filtered = select(filter(collection,datafilter),["VV"])

# Média com base em intervalo de tempo
r = mean(filterDate(filtered,"2020-03-01", "2020-04-20"))
g = mean(filterDate(filtered,"2020-04-21", "2020-06-10"))
b = mean(filterDate(filtered,"2020-06-01", "2020-08-31"))

# Criando composição
composite = cat(EE.Image(),[r,g,b])

# Região para visualização
geometry = Point(-47, -16)
region = bounds(buffer(geometry,10000))

# Visualização
getThumbURL(composite, Dict(
    :min => -25,
    :max => 0,
    :region => region,
    :dimensions => 1024,
))