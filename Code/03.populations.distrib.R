# WHY POPULATIONS DISPERSE OVER THE LANDSCAPE IN A CERTAIN MANNER ?
# SPECIES DISTRIBUTION MODELLING
install.packages("sdm")
install.packages("rgdal", dependencies=T)
library(sdm)
library (terra) # predictors
library(rgdal) # species

system.file("external/species.shp", package="sdm")
file <- system.file("external/species.shp", package="sdm") # ouvrir les données .shp

# CREER VECTEUR (COORDONNEES DE L'ESPECE / L'INDIVIDU)
rana <- vect(file)  # dans terra, fonction de vecteur avec coordonnées et système de données (vect) / rana = espèce de grenouille, permet de représenter l'espèce (sa localisation)
rana$Occurrence
plot(rana)

# SELECTING PRESENCES Selecting presences
# SELECTIONNER UNIQUEMENT LA PRESENCE DES GRENOUILLES (PAS ABSENCE)
présence <- rana[rana$Occurrence== 1,]  # == veut dire égal, [] permet de séléctionner un élément (1 veut dire ici présence)
présence # afficher caractéristiques
plot(présence) # graphique des présences

# SELECT ABSENCE AND CALL THEM ABSENCES
absences <- rana[rana$Occurrence== 0,]
plot(absences)

# PLOT PRESENCE AND ABSENCES, ONE BESIDE THE OTHER
par(mfrow=c(1,2)) # Deux encadrés and 1 colonne # mfrow = multiframerow
plot(présence)
plot(absences) # ajouter anciennes fonctions si depuis le début

# YOUR NEW FRIEND IN CAS OF GRAPHICAL NULLING
dev.off()

# PLOT PRESENCES AND ABSENCES ABSE ALTOGETHER WITH TWO DIFFERENT COLOUR
plot(présence, col="dark blue")
points(absences, col="light blue")

# LIST OF PREDICTORS : ENVIRONMENTAL VARIABLES
elev <- system.file("external/elevation.asc", package="sdm") # on ajoute un raster (même méthode que vecteur)
elevmap <- rast(elev) # même principe que vect, avec raster
plot(elevmap)

# AJOUTER POINTS SUR LA CARTE
points(présence, cex=.5)

# TEMPERATURE PREDICTOR
temp <- system.file("external/temperature.asc", package="sdm")
temp # obtenir le chemin où se trouve la donnée
tempmap <- rast(temp)
plot(tempmap)
points(présence, cex=.5)

# REPRESENT THE VEGETATION COVER
veg <- system.file("external/vegetation.asc", package="sdm")
veg
vegmap <- rast(veg)
plot(vegmap)
points(présence, cex=.5) 

# REPRESENT THE PRECIPITATIONS
prec <- system.file("external/precipitation.asc", package="sdm")
prec
precmap <- rast(prec)
plot(precmap)
points(présence, cex=.5) 

# MULTIFRAME : REPRESENT ALL PLOTS CREATED
par(mfrow=c(2,2)) # Deux encadrés par colonne et 2 colonnes
plot(elevmap)
points(présence, cex=.5) # on oublie pas d'ajouter les présences à chaque graph
plot(tempmap)
points(présence, cex=.5) 
plot(vegmap)
points(présence, cex=.5) 
plot(precmap)
points(présence, cex=.5) 

AUTRE (REPRESENTER LES ESPECES)
species[species$Occurrence == 1,]
install.packages("rgdal", dependencies=T)
library(rgdal) # species
