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


