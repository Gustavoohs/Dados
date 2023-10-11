# Pacotes
using Rasters
using ArchGDAL
using Plots
using Shapefile
using Statistics
using DataFrames

# Caminho para o raster 
raster_path = "C:/Users/Aluga.com/Downloads/Cubo_SBSR_cut1.tif"

# Caminho para o shapefile de polígonos
shapefile_path = "C:/Users/Aluga.com/Documents/roi_PNB.shp"

# Leitura dos dados
rst = RasterStack(raster_path)
vect = Shapefile.Table(shapefile_path) |> DataFrame

# Inicializar um DataFrame vazio
all_stats_df = DataFrame()

# Calcular as estatísticas zonais e adicionar como uma coluna ao DataFrame
for i in 1:size(rst, 3)
    layer_stats = Rasters.zonal(x -> coalesce(mean(x), 0.0), rst[:, :, i]; of=vect, boundary=:touches)
    all_stats_df[!, Symbol("mean_value_layer_$i")] = getindex.(layer_stats, 1)  # Extrair o valor numérico
end

# Extrair valores do DataFrame
x_values = 1:size(all_stats_df, 2)
y_values = [collect(all_stats_df[i, :]) for i in 1:size(all_stats_df, 1)]

# Criar o gráfico 
p = plot()

for i in 1:size(all_stats_df, 1)
    plot!(x_values, y_values[i],
          label=["Água", "Solo", "Campo", "Mata", "Cerrado", "Queimada"][i],
          linewidth=2)
end

# Configurações adicionais do gráfico
plot!(xlabel="Imagem", ylabel="Valor Médio (dB)",
      title="Retroespalhamento médio por classe", legend=:topright, frame=:box)

# Exibir o gráfico
display(p)