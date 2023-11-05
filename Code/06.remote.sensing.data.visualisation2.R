
# OPEN THE DATA AND INSTALL THE PACKAGE "IMAGERY" FROM GITHUB
library(devtools) # Packages in R are also called libraries
install_github("ducciorocchini/imageRy")  # From devtools
library(imageRy)
library(terra)
# IN CASE YOU HAVE NOT TERRA
# install.packages("terra")
# list the data
im.list()

# IMPORT BANDS AND MODIFIED THEIR COLOURS (EXAMPLE WITH THE BLUE BAND)
b2 <- im.import("sentinel.dolomites.b2.tif") 

cl <- colorRampPalette(c("dark grey","grey","light grey")) (100)
cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
plot(b2, col=cl) # Afficher la bande avec les couleurs choisies, que l'on nomme "cl".

# IMPORT THE GREEN BAND FROM SENTINEL-2 (BAND 3) -> TO DO A MULTIFRAME AFTER
b3 <- im.import("sentinel.dolomites.b3.tif") 
plot(b3, col=cl) # cl = palette préalablement choisie (voir ci-dessus), on peut donner un autre nom.
# IMPORT THE RED BAND FROM SENTINEL-2 (BAND 4)
b4 <- im.import("sentinel.dolomites.b4.tif") 
plot(b4, col=cl)
# IMPORT THE NIR BAND FROM SENTINEL-2 (BAND 8)
b8 <- im.import("sentinel.dolomites.b8.tif") 
plot(b8, col=cl)

# MULTIFRAME (AFFICHAGE DE PLUSIEURS BANDES SUR UNE MEME FEUILLE, L'UNE APRES L'AUTRE)
# AVANT, ON DOIT OUVRIR TOUTES LES BANDES COMME CI-DESSUS
par(mfrow=c(2,2))
plot(b2, col=cl)
plot(b3, col=cl)
plot(b4, col=cl)
plot(b8, col=cl)

# STACK IMAGES (IMAGES EMPILEES) -> AFFICHER L'UNE APRES L'AUTRE AUTOMATIQUEMENT LES BANDES
stacksent <- c(b2, b3, b4, b8)
plot(stacksent, col=cl)
dev.off() # It closes devices (or plots)

# N'AFFICHER QUE LA BANDE OUVERTE EN 4EME
plot(stacksent[[4]], col=cl)

# EXERCICE : PLOT IN A MULTIFRAME THE BANDS WITH DIFFERENT COLOR RAMPS
par(mfrow=c(2,2))

clb <- colorRampPalette(c("dark blue", "blue", "light blue")) (100)
plot(b2, col=clb)

clg <- colorRampPalette(c("dark green", "green", "light green")) (100)
plot(b3, col=clg)

clr <- colorRampPalette(c("dark red", "red", "pink")) (100)
plot(b4, col=clr)

cln <- colorRampPalette(c("brown", "orange", "yellow")) (100)
plot(b8, col=cln)

# RGB SPACE : INFORMATIONS ABOUT BANDS + AFFICHAGE PREALABLES DES BANDES POUR AFFICHAGE D'UNE BANDE EN VRAIES COULEURS
# stacksent: 
# band2 blue element 1, stacksent[[1]] 
# band3 green element 2, stacksent[[2]]
# band4 red element 3, stacksent[[3]]
# band8 nir element 4, stacksent[[4]]
im.plotRGB(stacksent, r=3, g=2, b=1) # Affichage en vraies couleurs
