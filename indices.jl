# Pacotes
using Rasters
using ArchGDAL
using Plots

# Green Chlorophyll Index (GCI)
function calculate_GCI(red_band, green_band) 
    gci = (green_band .- red_band) ./ (green_band .+ red_band)
    return gci
end

# Normalized Difference Vegetation Index (NDVI)
function calculate_NDVI(nir_band, red_band) 
    ndvi = (nir_band .- red_band) ./ (nir_band .+ red_band)
    return ndvi
end

# Enhanced Vegetation Index (EVI)
function calculate_EVI(nir_band, red_band, blue_band, L=1.0, C1=6.0, C2=7.5, G=2.5)
    evi = G .* (((nir_band) - (red_band)) ./ ((nir_band) .+ C1 .* (red_band) - C2 .* (blue_band) .+ L))
    return evi
end


# Diretório onde estão os arquivos 
band_directory = "C:/Users/Gustavo/Downloads/"

# Lista de nomes dos arquivos das bandas
band_files = [
    joinpath(band_directory, "T22LGH_20230914T133151_B04.tif"),
    joinpath(band_directory, "T22LGH_20230914T133151_B03.tif"),
    joinpath(band_directory, "T22LGH_20230914T133151_B08.tif"),
    joinpath(band_directory, "T22LGH_20230914T133151_B02.tif")
]

# Carregar imagens
function load_sentinel2_bands(band_files)
    red_band =  Raster(band_files[1]) / 10000
    green_band = Raster(band_files[2]) / 10000
    nir_band = Raster(band_files[3]) / 10000
    blue_band = Raster(band_files[4]) / 10000
    
    return red_band, green_band, nir_band, blue_band
end


# Carregar as bandas da imagem
red_band, green_band, nir_band, blue_band = load_sentinel2_bands(band_files)

# Calcular os índices de vegetação
gci_result = calculate_GCI(red_band, green_band)
ndvi_result = calculate_NDVI(nir_band, red_band)
evi_result = calculate_EVI(nir_band, red_band, blue_band)

# Criar figura combinada
combined_figure = plot(
    Plots.heatmap(gci_result, aspect_ratio=:equal, color=:RdYlGn, title="GCI"),
    Plots.heatmap(ndvi_result, aspect_ratio=:equal, color=:RdYlGn, title="NDVI"),
    Plots.heatmap(evi_result, aspect_ratio=:equal, color=:RdYlGn, title="EVI"),
    layout=(1, 3), size=(1800, 900)
)

# Exibir a figura
display(combined_figure)