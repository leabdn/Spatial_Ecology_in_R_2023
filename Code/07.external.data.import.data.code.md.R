#DOWNLOAD EXTERNAL AVAILABLE DATA
#EARTH OBSERVATORY : https://earthobservatory.nasa.gov/

#SENTINEL-2 DATA (ESA, 10m = time period) : https://www.youtube.com/watch?v=KA2L4bDmo98

#LANDSAT (30m) AND MODIS (> 500m) DATA (NASA) : https://www.youtube.com/watch?v=JN-P04Dkx48

#COPERNICUS DATA : https://land.copernicus.vgt.vito.be/PDF/portal/Application.html

#STEPS (WITH EXAMPLE WITH AN IMAGE COME FROM EARTH OBSERVATORY)
#STEP 1 : Download an image from the network (in .jpeg for example)
#STEP 2 : Store it in your computer (enregistrer sous)
#STEP 3 : Set the working directory on your path (CHOIX DU REPERTOIRE DE TRAVAIL) : setwd("path")
library(terra)
setwd("C:/Users/leabd/Documents/Erasmus courses/SPATIAL ECOLOGY IN R/07. DOWNLOAD IMAGES") # On note le chemin d'accès aux données inverse les slashs

# STEP 4 : Import the data and plot the image : nomdonnéàl'imagedansterra <- rast("yourdata_in_the_working_directory.jpg")
naja <- rast("najafiraq_etm_2003140_lrg - EARTH OBSERVATORY.jpg") # rast créé un SpaRaster (un raster)
plotRGB (naja, r=1, g=2, b=3) # Ici, exemple avec image de Najaf en Iraq, télécharge sur Earth Observatory

# EXERCICE : DOWNLOAD THE SECOND IMAGE FROM EARTH OBSERVATORY AND PLOT IT
library(terra)
setwd("C:/Users/leabd/Documents/Erasmus courses/SPATIAL ECOLOGY IN R/07. DOWNLOAD IMAGES")
najaaug <- rast("najafiraq_oli_2023219_lrg - SECOND PICTURE.jpg")
plotRGB(najaaug, r=1, g=2, b=3)

# MULTITEMPORAL CHANGE DETECTION
najadif = naja[[1]] - najaaug [[1]]
cl - coloRampPalette ("brown", "grey", "orange")) (100)
dev.off()
plot(najadif, col=cl) 

# EXERCICE : DOWNLOARD YOUR OWN IMAGE (LIGHTS BETWEEN FRANCESE AND ITALIAN BORDER)
lights <- rast("ISS023-E-029061_lrg.jpg")
plotRGB(lights, r=1, g=2, b=3)
