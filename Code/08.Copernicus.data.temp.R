# DATA AVAILABLE HERE (need an acount) :
# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html

# INSTALL AND OPEN THE PACKAGES
install.packages("ncdf4") # Ce qui permet de lire les données de Copernicus
library(ncdf4)
library(terra)

# PLOT THE COPERNICUS DATA IN R
# setwd("C:/Users/leabd/Documents/Erasmus courses/SPATIAL ECOLOGY IN R/07. DOWNLOAD IMAGES") # On copie le chemin (path) où se trouve la donnée téléchargée, en changeant les slashs de sens comme ici
soilm <- rast("c_gls_SSM1km_202311250000_CEURO_S1CSAR_V1.2.1.nc") # nameoftheobjectwewanttogive <- rast("nameoftheimage")
plot(soilm) 
plot(soilm[[1]]) # Il y a deux graphiques, on ne conserve que le premier (Surface Soil Moisture)

# CHANGE THE COLORAMPALETTE
cl <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(soilm[[1]], col=cl)

# EXTENT FUNCTION : TO CROP THE IMAGE AND CREATE A NEW IMAGE WITH DATA YOU WANT TO CONSERVE
# ext <- c(22, 26, 55, 57) # minlongitude, maxlongitude, minlatitude, maxlatitude. Pour obtenir ces données, on prends les valeurs max et min sur le graph. (en rouge) : latitude = ordonnées, longitude = abcsisses.
soilmc <- crop(soilm, ext) # Graphique avec que les valeurs qui nous intéressent (max et min longitude et latitude)
plot(soilmc[[1]], col=cl)
