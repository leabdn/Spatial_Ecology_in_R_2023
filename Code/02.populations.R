# Code related to population ecology

# A package is needed for point pattern analysis

install.packages("spatstat")
library(spatstat)

# let's use the bei data :
# data description
# https://cran.r-project.org/web/packages/spatstat/index.html

bei

# plotting the data
plot(bei)

# changing dimension - cex
plot(bei, cex=0.5) # ou .5

# changing the symbol - pch
plot(bei, cex=.2, pch=19)

# additional datasets
bei.extra
plot(bei.extra)

# let's use only part of the dataset : elev ici
plot(bei.extra$elev)

# change the name of the raster / graph
elevation <- bei.extra$elev
plot(elevation)

# second method to select elements
elevation2 <- bei.extra[[1]]
plot(elevation2)

# passing from points to a continuous surface
bei
plot(bei, cex=.5)
density map <- density(bei)
densitymap
plot(densitymap)
points(bei, cex=.2)

# colorRampPalette
colorRampPalette(c("black", "red", "orange", "yellow"))(100)
cl <- colorRampPalette(c("black", "red", "orange", "yellow"))(100)
plot(densitymap, col=cl)
# essai couleurs du tableau 
new <- colorRampPalette(c("cyan2", "darkolivegreen1", "darkorange", "chocolate1"))(19)
plot(densitymap, col=new)

# multiframe
par(mfrow=c(1,2)) # 1 row (deux encadrés pour les graphiques : ce sont densitymap et elev) and 2 COLONNES
plot(densitymap)
plot(elev) # apparaît la carte de densité à gauche PUIS l'élévation à droite

par(mfrow=c(2,2)) # 2 encadrés et 2 colonnes
plot(densitymap)
plot(elev)

par(mfrow=c(2,1)) # 2 row (deux encadrés) and 1 colonne
plot(densitymap)
plot(elev)

par(mfrow=c(3,1)) # Trois encadrés and 1 colonne
plot(densitymap)
plot(elev)
plot(bei)

par(mfrow=c(3,3)) # Trois encadrés and 3 colonnes (côte à côte)
plot(densitymap)
plot(elev)
plot(bei)
