# INSTALLER LE PACKAGE - REMOVE SENSING FOR ECOSYSTEM MONITORING
install.packages("devtools")
install.packages("terra")
library(devtools)
library(terra)

# OPEN IMAGES (BANDS, RASTERS OF REMOTE SENSING) AND MAKING THE LIST OF ALL OF THE IMAGE IN THE PACKAGE
devtools::install_github("ducciorocchini/imageRy") # install.packages("imageRy") n'est pas possible pour notre version de R, on le télécharge donc depuis le GitHub du prof.
library(imageRy)
im.list() # Faire la liste de toutes les images dans le package

# IMPORT THE BANDS AND MOFIDIED THEM
# IMPORT THE BLUE BAND FROM THE SENTINEL-2 (BAND 2)
b2 <- im.import("sentinel.dolomites.b2.tif") # b2 is the blue wavelength
b2

# IMPORT GREEN BAND FROM THE SENTINEL-2 (BAND 3)
b3 <- im.import("sentinel.dolomites.b3.tif") 
b3

# IMPORT RED BAND FROM THE SENTINEL-2 (BAND 4)
b4 <- im.import("sentinel.dolomites.b4.tif") 
b4

# IMPORT NIR (Near Infra-Red, PROCHE INFRAROUGE) BAND FROM THE SENTINEL-2 (BAND 8)
b8 <- im.import("sentinel.dolomites.b8.tif")
b8

# MODIFIED COLOURS OF THE RASTER
cl <- colorRampPalette(c("dark grey","grey","light grey")) (100)
plot(b2, col=cl)

# PLOT THE BANDS OF SENTINEL WITH A NEW COLOR PALETTE
clg <- colorRampPalette(c("dark green", "green", "light green")) (100) # 100 is the amount of colours in the gradient
plot(b3, col=clg)

clr <- colorRampPalette(c("dark red", "red", "pink")) (100) # 100 is the amount of colours in the gradient
plot(b4, col=clr)

cln <- colorRampPalette(c("brown", "orange", "yellow")) (100) # 100 is the amount of colours in the gradient
plot(b8, col=cln)

# PLOT ALL THE BANDS
par(mfrow=c(2,2))

# SENTINEL-2 IMAGE IN GREY (sentdo = sentinel-2 en abrégé)
sentdo <- c(b2, b3, b4, b8) # Afficher les quatre bandes
clall <- colorRampPalette(c("black", "dark gray", "gray")) (100) # Bandes en nuances de gris
plot(sentdo, col=clall) # Afficher les 4 graphiques en nuances de gris

# CLEANING THE PLOTS (NE PLUS LES AFFICHER)
dev.off()

# MULTIFRAME WITH THE NATURAL COLOURS IMAGE AND THE FASLE COLOUR IMAGE
par(mfrow=c(1,2)) # Permet d'afficher côte à côte les Bandes écrites ci-après
im.plotRGB(sentdo, 3, 2, 1)  # It plots (trace) the first three layers (couches) in the RGB components -> POUR BANDS AUTRES QUE NIR
im.plotRGB(sentdo, 4, 3, 2)  # It plots (trace) the first three layers (couches) in the RGB components -> POUR NIR (PROCHE INFRAROUGE)
# Peut-être im.plotRGB.user(sentdo, 3, 2, 1) mais ne marche pas ici

par(mfrow=c(1,2)) # Permet d'afficher côte à côte les Bandes écrites ci-après
im.plotRGB(sentdo, 3, 4, 2)  # It plots (trace) the first three layers (couches) in the RGB components
im.plotRGB(sentdo, 3, 2, 4)  # It plots (trace) the first three layers (couches) in the RGB components

# WHAT IS THE BAND CARRYING THE HIGHEST INFORMATION (LA BANDE QUI DONNE LE PLUS D'INFORMATIONS)
pairs(sentdo)

------------------------------------------------------------------------------------------------
# BUILT A GRAPHIC : ARRAYS (TABLEAUX) WITH POINTS
diameter <- c(100, 10, 50, 20, 15) # 100 en Abscisses, 10 en Ordonnées, 10 en Abscisses, 1000 en Ordonnées, etc. 
iron <- c(10, 1000, 20, 700, 900)
# BUILT A FUNCTION (ABSCISSA AND ORDERED)
plot(iron, diameter, pch=19, cex=2, col="red") # Iron and Diameter are arguments. Iron = Ordonnées (Ordered) et Diameter = Abscisses (Abscissa). 
