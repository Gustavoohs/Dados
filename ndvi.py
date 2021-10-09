import processing

NIR = QgsRasterLayer('C:/B4.tif')
RED = QgsRasterLayer('C:/B3.tif')
output = 'C:/NDVI.tif'

parameters = {'INPUT_A' : NIR,
        'BAND_A' : 1,
        'INPUT_B' : RED,
        'BAND_B' : 1,
        'FORMULA' : '(A-B)/(A+B)',
        'OUTPUT' : output}
        


processing.runAndLoadResults('gdal:rastercalculator', parameters)

