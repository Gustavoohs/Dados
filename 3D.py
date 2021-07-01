from osgeo import gdal
import  matplotlib.pyplot as plt
import numpy as np

dem = gdal.Open('dem.tif')
transform  = dem.GetGeoTransform()
dem = dem.ReadAsArray()

x_res = transform[1]
y_res = transform[5]
X = np.arange(transform[0], transform[0] + dem.shape[1]*x_res, x_res)
Y = np.arange(transform[3], transform[3] + dem.shape[0]*y_res, y_res)

X, Y = np.meshgrid(X, Y)

fig, ax = plt.subplots(figsize=(16,8), subplot_kw={'projection': '3d'})

surf = ax.plot_surface(X,Y,dem, rstride=1, cstride=1, cmap=plt.cm.Spectral_r, 
                       vmin=1010,vmax=1350, linewidth=0, antialiased=True)

ax.set_zlim(1000, 1350) 

fig.colorbar(surf, shrink=0.5, aspect=15)
