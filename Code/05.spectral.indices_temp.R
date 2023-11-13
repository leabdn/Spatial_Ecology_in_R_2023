# INDICES DERIVED FROM RS IMAGERY
# OPEN PACKAGES AND DATA
library(imageRy) # Beloved package developed at Unibo (to download it : copy the link in the previous script)
library(terra)
library(ggplot2) # To use colours scale
library(viridis) # To make the plot more aesthetic
im.list()

#  IMPORT THE IMAGES, IN FUNCTION OF THE YEAR, AND PLOT THEM
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg") # NIR Image
m2006 <- im.import("matogrosso_ast_2006209_lrg") # Fonctionne sans jpg
im.plotRGB(m1992, 1, 2, 3) # PLOT IN RED  # On peut aussi écrire : im.plotRGB(m1992, r=2, g=1, b=3) au lieu de juste 1, 2 et 3
im.plotRGB(m1992, 2, 1, 3) # PLOT IN GREEN
im.plotRGB(m1992, 2, 3, 1) # PLOT IN BLUE
# layer 1: NIR # layer 2: red # layer 3: green
# Professor cites "im.plotRGB.user(m1992, 1, 2, 3)" but with the user, it doesn't work in R.

# PLOT THE 2006 IMAGE WITH NIR IN THE GREEN COMPONENT OF THE RGB SPACE
im.plotRGB(m2006, 2, 1, 3) # Ou im.plotRGB(m2006, r=2, g=3, b=1)
# PLOT THE 2006 IMAGE WITH NIR IN THE BLUE COMPONENT OF THE RGB SPACE
im.plotRGB(m2006, 2, 3, 1)

# PLOT THE TWO IMAGES ONE BESIDE (à côté) THE OTHER
par(mfrow=c(1,2))
im.plotRGB(m1992, 1, 2, 3)
im.plotRGB(m2006, 1, 2, 3)


                                                                                  # INDEXES
                                          # CALCULCATING THE DVI (DIFFERENCE VEGETATION INDEX) AND SCPECIFYING A COLOR SCHEME
# DVI1992 BY CALCULATING
dvi1992 = m1992[[1]] - m1992[[2]]
dvi1992
cl <- colorRampPalette(c("darkblue", "yellow", "red", "black"))(100) # Specifying a color scheme
plot(dvi1992, col=cl)

# DVI2006
dvi2006 = m2006[[1]] - m2006[[2]] # DVI = NIR - RED where bands: 1 = NIR, 2 = RED, 3 = GREEN
dvi2006
cl <- colorRampPalette(c("darkblue", "yellow", "red", "black"))(100) # specifying a color scheme
plot(dvi2006, col=cl)

# DVI BY imageRy
dvi1992i <- im.dvi(m1992, 1, 2) # For 1992
dvi2006i <- im.dvi(m2006, 1, 2) # For 2006


                                                    # CALCULATING THE NDVI (NORMALIZED DIFFERENCE VEGETATION INDEX)
ndvi1992 = (m1992[[1]] - m1992[[2]]) / (m1992[[1]] + m1992[[2]])
# OR
ndvi1992 = dvi1992 / (m1992[[1]] + m1992[[2]])
# OR
ndvi2006 = (m2006[[1]] - m2006[[2]]) / (m2006[[1]] + m2006[[2]])
dev.off() # Fin de l'affichage des graphiques

# SPEEDING UP CALCULATION (PLOT MOR FASTER) FOR NDVI
ndvi2006a <- im.ndvi(m2006, 1, 2)
plot(ndvi2006a, col=cl)

# MULTIFRAME WITH DIFFERENTS NDVI
par(mfrow=c(1,2))
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)

# SCIENTIFICALLY MEANINGFUL IMAGE FOR EVERYONE ! (Image scientifiquement pertinente ou significative)
clvir <- colorRampPalette(c("violet", "dark blue", "blue", "green", "yellow"))(100)
plot(ndvi2006, col=clvir)
