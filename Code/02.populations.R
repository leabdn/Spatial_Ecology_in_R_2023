# CODE RELATED TO POPULATION ECOLOGY 
# A PACKAGE IS NEEDED FOR POINT PATTERN ANALYSIS : SPATSTAT
install.packages("spatstat")
library(spatstat)

# LET'S USE THE BEI DATA
# DATA DESCRIPTION
# https://cran.r-project.org/web/packages/spatstat/index.html
bei

# PLOTTING THE DATA
plot(bei)

# CHANGING DIMENSION - CEX (TAILLE DU POINT)
plot(bei, cex=0.5) # ou .5

# CHANGING THE SYMBOL - PCH
plot(bei, cex=.2, pch=19)

# ADDITIONAL DATASETS
bei.extra
plot(bei.extra)

# LET'S USE ONLY PART OF THE DATASET : elev ICI
plot(bei.extra$elev)

# CHANGE THE NAME OF THE RASTER / GRAPH
elevation <- bei.extra$elev
plot(elevation)

# SECOND METHOD TO SELECT ELEMENTS 
elevation2 <- bei.extra[[1]]
plot(elevation2)

# PASSING FROM POINTS TO A CONTINUOUS SURFACE
bei
plot(bei, cex=.5)
density map <- density(bei)
densitymap
plot(densitymap)
points(bei, cex=.2)

# colorRampPalette
cl <- colorRampPalette(c("black", "red", "orange", "yellow"))(100)
plot(densitymap, col=cl)

# ESSAI COULEUR DU TABLEAU 
new <- colorRampPalette(c("cyan2", "darkolivegreen1", "darkorange", "chocolate1"))(19)
plot(densitymap, col=new)

# MULTIFRAME
par(mfrow=c(1,2)) # 1 row (deux encadrés pour les graphiques : ce sont densitymap et elev) and 2 COLONNES
plot(densitymap)
plot(elev) # apparaît la carte de densité à gauche PUIS l'élévation à droite

par(mfrow=c(2,2)) # 2 encadrés par colonne et 2 colonnes
plot(densitymap)
plot(elev)

par(mfrow=c(2,1)) # 2 row (deux encadrés) par colonne et 1 colonne
plot(densitymap)
plot(elev)

par(mfrow=c(3,1)) # Trois encadrés par colonne et 1 colonne
plot(densitymap)
plot(elev)
plot(bei)

par(mfrow=c(3,3)) # Trois encadrés par colonne et 3 colonnes (côte à côte)
plot(densitymap)
plot(elev)
plot(bei)
