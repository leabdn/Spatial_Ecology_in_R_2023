# PROBLEMATIC CHOSEN
# Face to the heatwaves and urban heat island phenomenon, how qualify the resilience of ecosystems hosting Calopteryx virgo ?

# STEP 1. CALCULATION OF THE NDVI (VEGETATION INDEX), NDWI (WATER INDEX) and NDPI (POND INDEX) INDEX AND CUTTING THE RASTER FILE OBTAINED
# CALCULATE THE NDVI FOR 2020 AND 2021
install.packages("ggplot2") # Use colours scales
install.packages("viridis") # Make the plot more aesthetic
install.packages("devtools")
install.packages("htmltools") # Have the last version of devtools ???????????  
install.packages("terra")
devtools::install_github("ducciorocchini/imageRy")
library(imageRy)
library(ggplot2) 
library(viridis)
library(devtools)
library(htmltools)
library(terra) # Predictors
setwd("C:/Users/leabd/Documents/Erasmus courses/SPATIAL ECOLOGY IN R/FINAL REPORT/COPERNICUS") # path we we found the .jpg
# 2020
2020jpg <- rast("2023-07-07-00_00_2023-07-07-23_59_Sentinel-2_L1C_True_color.jpg")
redband <- im.plotRGB(2020jpg, 1, 2, 3) # Red band
blueband <- im.plotRGB(2020jpg, 2, 3, 1) # Blue band
greenband <- im.plotRGB(2020jpg, 2, 1, 3) # Green band
ndvi2020 = (2020jpg[[1]] - 2020jpg[[2]]) / (2020jpg[[1]] + 2020jpg[[2]]) # (NIR-RED) / (NIR+RED)
ndvi2020
c <- colorRampPalette(c("lightgreen", "chartreuse", "green", "darkgreen")) (100) # Specifying a colour scheme
plot(ndvi2020, col=cl1)

# CALCULATION OF THE NDWI FOR 2020
# 2020
ndwi2020 = (2020jpg[[3]] - 2020jpg[[1]]) / (2020jpg[[3]] + 2020jpg[[1]])
ndwi2020
c <- colorRampPalette(c("lightgreen", "chartreuse", "green", "darkgreen")) (100)
plot(ndwi2020, col = c)

# CALCULATION OF THE NDPI FOR 2020 AND 2021
# 2020
...
dev.off()

# STEP 2. ADD THE OCCURENCES OF CALOPTERYX VIRGO ON THE RASTER OBTAINED
# OPEN THE C_virgo.shp FILE
install.packages("terra")
library(terra)
fileA <- setwd("C:/Users/leabd/Documents/Erasmus courses/SPATIAL ECOLOGY IN R/FINAL REPORT/CALOPTERYX_VIRGO")
C_virgo <- vect(file) # Insert the shape file
C_virgo # Informations about geometry data of Calopteryx virgo
# PLOT THE OCCURENCES ON THE 3 RASTERS (NDVI, NDWI AND NDTI)
plot(ndvi2020) # Plot the presence (points) of Calopteryx virgo
points(C_virgo, cex=.5) # Plot the presence (points) of Calopteryx virgo on the raster
plot(ndwi2020) # Plot the presence (points) of Calopteryx virgo
points(C_virgo, cex=.5) # Plot the presence (points) of Calopteryx virgo on the raster
plot(ndti2020) # Plot the presence (points) of Calopteryx virgo
points(C_virgo, cex=.5) # Plot the presence (points) of Calopteryx virgo on the raster

# STEP 3. ANALYSE OF THE POPULATION DISTRIBUTION OF CALOPTERYX VIRGO CARACTERISTICS AND CARACTERISTICS OF THE EXOSYSTEMS HIGHLIGHTED
# Explained during the oral

-------------------------------------------------------------------------------------------------------------------------
# STEP 1. OPEN THE SENTINEL-2 DATA IN R STUDIO
install.packages("terra")
library(terra)
setwd("C:/Users/leabd/Documents/Erasmus courses/SPATIAL ECOLOGY IN R/FINAL PRESENTATION/DATA") # path we we found the .jpg
recentjpg <- rast("2023-07-07-00_00_2023-07-07-23_59_Sentinel-2_L1C_True_color.jpg")
plotRGB(recentjpg, r=1, g=2, b=3)

# STEP 1. OPEN THE SENTINEL-2 DATA IN R STUDIO
# THE OLDER RASTER : 06/07/2015
install.packages("terra")
library(terra)
setwd("C:/Users/leabd/Documents/Erasmus courses/SPATIAL ECOLOGY IN R/FINAL PRESENTATION/DATA") # path we we found the .jpg
olderjpg <- rast("2015-07-06-00_00_2015-07-06-23_59_Sentinel-2_L1C_True_color.jpg") 
olderjpg # plot the informations of the raster
plotRGB(olderjpg, r=1, g=2, b=3) # plot the raster in real colours

# THE MOST RECENT RASTER : 06/07/2023
recentjpg <- rast("2023-07-07-00_00_2023-07-07-23_59_Sentinel-2_L1C_True_color.jpg")
plotRGB(recentjpg, r=1, g=2, b=3)

# (BIRGHTNESS INDEX), BI = root((Red²+Green²)/2)
x1 <- recentjpg[[1]] # NIR
y1 <- 2
x1^y1
x2 <- recentjpg[[3]] # GREEN
y2 <- 2
y1^y2
# The power

# CALCULATE OF THE DVI
dvi2023 = recentjpg[[1]] - recentjpg [[2]]
dvi2023
cl <- colorRampPalette(c("darkblue", "yellow", "red", "black"))(100) # Plot a colour scheme for the DVI
plot(dvi2023, col=cl)

