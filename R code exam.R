# PROBLEMATIC CHOSEN
# Which effets on the ecosystems had the heatwave of July 2021 in the urban area of Tours (France) ?

# STEP 1. CALCULATION OF THE NDVI (VEGETATION INDEX), NDWI (WATER INDEX) 
# CALCULATE THE NDVI FOR 2021
install.packages("ggplot2") # Use colours scales
install.packages("viridis") # Make the plot more aesthetic
install.packages("devtools") # Speed up tasks 
install.packages("terra") # Spatial analyse with vectors, predictors
devtools::install_github("ducciorocchini/imageRy") # Image in 4D

library(imageRy)
library(ggplot2) 
library(viridis)
library(devtools)
library(terra)
file <- setwd("C:/Users/leabd/Documents/Erasmus courses/SPATIAL ECOLOGY IN R/FINAL REPORT/DATA")
jpg2021 <- rast("2021-07-22-00_00_2021-07-22-23_59_Sentinel-2_L1C_False_color.jpg")
redband <- im.plotRGB(jpg2021, 1, 2, 3) # Red band
blueband <- im.plotRGB(jpg2021, 2, 3, 1) # Blue band
greenband <- im.plotRGB(jpg2021, 2, 1, 3) # Green band
ndvi2021 = (jpg2021[[1]] - jpg2021[[2]]) / (jpg2021[[1]] + jpg2021[[2]]) # (NIR-RED) / (NIR+RED)
c <- colorRampPalette(c("darkolivegreen1", "chartreuse", "chartreuse2", "darkgreen"))(100)

# CALCULATION OF THE NDVI FOR 2023
jpg2023 <- rast("2023-07-22-00_00_2023-07-22-23_59_Sentinel-2_L1C_False_color.jpg")
ndvi2023 = (jpg2023[[1]] - jpg2023[[2]]) / (jpg2023[[1]] + jpg2023[[2]]) # (NIR-RED) / (NIR+RED)

# PLOT AND COMPARE THE NDVI FOR THE TWO PERIODS
par(mfrow=c(2,1))
plot(ndvi2021, col=c)
plot(ndvi2023, col=c)
dev.off()

# CALCULATION OF THE NDWI FOR 2021
ndwi2021 = (jpg2021[[3]] - jpg2021[[1]]) / (jpg2021[[3]] + jpg2021[[1]]) # NDWI (McFEETERS) = (Green-NIR) / (Green+NIR)
c2 <- colorRampPalette(c("darkslategray1", "cyan4", "blue", "darkblue")) (100)

# CALCULATION OF THE NDWI FOR 2023
ndwi2023 = (jpg2023[[3]] - jpg2023[[1]]) / (jpg2023[[3]] + jpg2023[[1]]) # NDWI (McFEETERS) = (Green-NIR) / (Green+NIR)

# PLOT AND COMPARE THE NDWI FOR THE TWO PERIODS
par(mfrow=c(2,1))
plot(ndwi2021, col = c2)
plot(ndwi2023, col = c2)
dev.off()

-------------------------------------------------------------------------------------------------------------------------------
## TO GO FURTHER
# CUTTING THE CALOPTERYX VIRGO DATA AT THE RASTER OBTAINED
install.packages("ggplot2")
install.packages("sf")
install.packages("terra")
library(ggplot2)
library(sf)
library(terra)
c_virgo <- vect(file) # Insert the shape file
c_virgo # Have the extent to compute below
ndvi <- rast("NDVI.png")
ndvicrop <- crop(ndvi, extent(0.17476, 0.91719, 46.91004, 47.48635)) # Extent of the .shp file (Data of Calopteryx Virgo)
datframe_ndvi <- as.data.frame(ndvicrop, xy = TRUE)
plot(ndvicrop)
points(C_virgo, cex =.5)

# Same procedure for the NDWI.

