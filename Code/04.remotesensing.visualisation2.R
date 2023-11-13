# INSTALLER LE PACKAGE - REMOVE SENSING FOR ECOSYSTEM MONITORING

# OPEN THE DATA AND INSTALL THE PACKAGE "IMAGERY" FROM GITHUB
library(devtools) # Packages in R are also called libraries
install_github("ducciorocchini/imageRy")  # From devtools
install.packages("devtools")
library(devtools)
library(terra)
library(imageRy)
library(terra)

# IN CASE YOU HAVE NOT TERRA
# install.packages("terra")
# list the data
im.list()


                                                                          # IMPORT AND OPEN DATA

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



                                                       # MODIFIED COLOURS AND PLOT ONE BY ONE : DO A MULTIFRAME

# 1. IMPORT AND OPEN DATA (AVANT, ON DOIT OUVRIR TOUTES LES BANDES COMME CI-DESSSOUS)
# EXAMPLE WITH THE 4 BANDS
cl <- colorRampPalette(c("dark grey","grey","light grey")) (100)
par(mfrow=c(2,2)) # Plot all the bands
plot(b2, col=cl)
plot(b3, col=cl)
plot(b4, col=cl)
plot(b8, col=cl)

# IMPORT THE GREEN BAND FROM SENTINEL-2 (BAND 3) -> TO DO A MULTIFRAME AFTER
b3 <- im.import("sentinel.dolomites.b3.tif") 
plot(b3, col=cl) # cl = palette préalablement choisie (voir ci-dessus), on peut donner un autre nom.
# IMPORT THE RED BAND FROM SENTINEL-2 (BAND 4)
b4 <- im.import("sentinel.dolomites.b4.tif") 
plot(b4, col=cl)
# IMPORT THE NIR BAND FROM SENTINEL-2 (BAND 8)
b8 <- im.import("sentinel.dolomites.b8.tif") 
plot(b8, col=cl)

# 2. DO THE MULTIFRAME WITH COLOURS MODIFICATIONS
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

# PLOT IN A MULTIFRAME THE BANDS WITH DIFFERENT COLOR RAMPS
par(mfrow=c(2,2))
clb <- colorRampPalette(c("dark blue", "blue", "light blue")) (100)
plot(b2, col=clb)
clg <- colorRampPalette(c("dark green", "green", "light green")) (100)
plot(b3, col=clg)
clr <- colorRampPalette(c("dark red", "red", "pink")) (100)
plot(b4, col=clr)
cln <- colorRampPalette(c("brown", "orange", "yellow")) (100)
plot(b8, col=cln)

# MULTIFRAME WITH THE NATURAL COLOURS IMAGE AND THE FASLE COLOUR IMAGE
par(mfrow=c(1,2)) # Permet d'afficher côte à côte les Bandes écrites ci-après
im.plotRGB(sentdo, 3, 2, 1)  # It plots (trace) the first three layers (couches) in the RGB components -> POUR BANDS AUTRES QUE NIR
im.plotRGB(sentdo, 4, 3, 2)  # It plots (trace) the first three layers (couches) in the RGB components -> POUR NIR (PROCHE INFRAROUGE)
# Peut-être im.plotRGB.user(sentdo, 3, 2, 1) mais ne marche pas ici
# OTHER SAME EXAMPLE
par(mfrow=c(1,2)) # Permet d'afficher côte à côte les Bandes écrites ci-après
im.plotRGB(sentdo, 3, 4, 2)  # It plots (trace) the first three layers (couches) in the RGB components
im.plotRGB(sentdo, 3, 2, 4)  # It plots (trace) the first three layers (couches) in the RGB components

# IMPORT BANDS AND MODIFIED THEIR COLOURS (EXAMPLE WITH THE BLUE BAND IN GREY)
b2 <- im.import("sentinel.dolomites.b2.tif") 
cl <- colorRampPalette(c("dark grey","grey","light grey")) (100) # OR cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
plot(b2, col=cl) # Afficher la bande avec les couleurs choisies, que l'on nomme "cl".

# 4 BANDS IN GREY (sentdo = sentinel-2 en abrégé)
sentdo <- c(b2, b3, b4, b8) # Afficher les quatre bandes
clall <- colorRampPalette(c("black", "dark gray", "gray")) (100) # Bandes en nuances de gris
plot(sentdo, col=clall) # Afficher les 4 graphiques en nuances de gris



                                                                # PLOT BANDS ONE BY ONE AUTOMATICALLY

# STACK IMAGES (IMAGES EMPILEES) -> AFFICHER L'UNE APRES L'AUTRE AUTOMATIQUEMENT LES BANDES
stacksent <- c(b2, b3, b4, b8)
plot(stacksent, col=cl)
dev.off() # It closes devices (or plots)

# N'AFFICHER QUE LA BANDE OUVERTE EN 4EME
plot(stacksent[[4]], col=cl)



                      # RGB SPACE : INFORMATIONS ABOUT BANDS + AFFICHAGE PREALABLES DES BANDES POUR AFFICHAGE D'UNE BANDE EN VRAIES COULEURS

# stacksent: 
# band2 blue element 1, stacksent[[1]] 
# band3 green element 2, stacksent[[2]]
# band4 red element 3, stacksent[[3]]
# band8 nir element 4, stacksent[[4]]
im.plotRGB(stacksent, r=3, g=2, b=1) # Affichage en vraies couleurs

------------------------------------------------------------------------------------------------
# BUILT A GRAPHIC : ARRAYS (TABLEAUX) WITH POINTS
diameter <- c(100, 10, 50, 20, 15) # 100 en Abscisses, 10 en Ordonnées, 10 en Abscisses, 1000 en Ordonnées, etc. 
iron <- c(10, 1000, 20, 700, 900)
# BUILT A FUNCTION (ABSCISSA AND ORDERED)
plot(iron, diameter, pch=19, cex=2, col="red") # Iron and Diameter are arguments. Iron = Ordonnées (Ordered) et Diameter = Abscisses (Abscissa). 

# CLEANING THE PLOTS (NE PLUS LES AFFICHER)
dev.off()

# WHAT IS THE BAND CARRYING THE HIGHEST INFORMATION (LA BANDE QUI DONNE LE PLUS D'INFORMATIONS)
pairs(sentdo)
