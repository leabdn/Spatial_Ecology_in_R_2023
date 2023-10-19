# Why populations disperse over the landscape in a certain manner ?
# Species Distribution Modelling
install.packages("sdm")
install.packages("rgdal", dependencies=T)
library(sdm)
library (terra) # predictors
library(rgdal) # species

system.file("external/species.shp", package="sdm")
file <- system.file("external/species.shp", package="sdm") # ouvrir les données .shp

# Créer vecteur (coordonnées de l'espèce / l'individu)
rana <- vect(file)  # dans terra, fonction de vecteur avec coordonnées et système de données (vect) / rana = espèce de grenouille, permet de représenter l'espèce (sa localisation)
rana$Occurrence
plot(rana)

# Selecting presences
# Sélectionner uniquement la présence des grenouilles (pas absence)
présence <- rana[rana$Occurrence== 1,]  # == veut dire égal, [] permet de séléctionner un élément (1 veut dire ici présence)
présence # afficher caractéristiques
plot(présence) # graphique des présences

# Select absence and call them absences
absences <- rana[rana$Occurrence== 0,]
plot(absences)

# Plot presences and absences, one beside the other
par(mfrow=c(1,2)) # Deux encadrés and 1 colonne # mfrow = multiframerow
plot(présence)
plot(absences) # ajouter anciennes fonctions si depuis le début

# Your new friend in case of graphical nulling : 
dev.off()

# Plot presences and absences abse altogether with two different colour
plot(présence, col="dark blue")
points(absences, col="light blue")

# list the predictors : environmental variables
elev <- system.file("external/elevation.asc", package="sdm") # on ajoute un raster (même méthode que vecteur)
elevmap <- rast(elev) # même principe que vect, avec raster
plot(elevmap)

# Ajouter points sur la carte
points(présence, cex=.5)

# Temperature predictor
temp <- system.file("external/temperature.asc", package="sdm")
temp # obtenir le chemin où se trouve la donnée
tempmap <- rast(temp)
plot(tempmap)
points(présence, cex=.5)

# Represent the vegetation cover
veg <- system.file("external/vegetation.asc", package="sdm")
veg
vegmap <- rast(veg)
plot(vegmap)
points(présence, cex=.5) 

# Represent the precipitations
prec <- system.file("external/precipitation.asc", package="sdm")
prec
precmap <- rast(prec)
plot(precmap)
points(présence, cex=.5) 

# Multiframe : represent all plots created
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
