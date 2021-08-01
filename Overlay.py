from spectral import *
import tifffile as tif

img = tif.imread('cubo_L7_corte.tif')

roi = tif.imread('roi.tif')

v = imshow(img, (3, 2, 1), classes=roi, stretch=(0.02))

v.set_display_mode('overlay')

v.class_alpha = 0.5
