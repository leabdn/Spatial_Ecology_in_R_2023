# INSTALLER LE PACKAGE - REMOVE SENSING FOR ECOSYSTEM MONITORING
install.packages("devtools")
install.packages("terra")
library(devtools)
library(terra)


# OPEN IMAGES (BANDS, RASTERS OF REMOTE SENSING) AND MAKING THE LIST OF ALL OF THE IMAGE IN THE PACKAGE
devtools::install_github("ducciorocchini/imageRy") # install.packages("imageRy") n'est pas possible pour notre version de R, on le télécharge donc depuis le GitHub du prof.
library(imageRy)

# IMPORT AN IMAGE
b2 <- im.import("sentinel.dolomites.b2.tif")
