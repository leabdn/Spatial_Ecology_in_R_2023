# TIME SERIES ANALYSIS
# OPEN THE PACKAGES
library(imageRy)
library(terra)
im.list()

# IMPORT THE DATA (SENTINEL-5P NITROGEN DIOXIDE TROPOSPHERIC COLUMN IN THE WORLD)
EN01 <- im.import("EN_01.png")
EN13 <- im.import("EN_13.png")

par(mfrow=c(2,1)) # 2 ligns, 1 column
im.plotRGB.auto(EN01)
im.plotRGB.auto(EN13)

# USING THE FIRST ELEMENT (BAND) OF IMAGES
dif = EN01[[1]] - EN13[[1]] # Difference between 

# CHANGE THE PALETTE
cldif <- colorRampPalette(c("blue", "white", "red")) (100)
plot(dif, col=cldif)

# NEW EXAMPLE : PLOT TEMPERATURE IN GREENLAND WITH A NEW COLORPALETTE
g2000 <- im.import("greenland.2000.tif")
clg <- colorRampPalette(c("black", "blue", "white", "red")) (100)
plot(g2000, col=clg)
g2005 <- im.import("greenland.2005.tif")
g2010 <- im.import("greenland.2010.tif")
g2015 <- im.import("greenland.2015.tif")
plot(g2015, col=clg)
par(mfrow=c(1,2))
plot(g2000, col=clg)
plot(g2015, col=clg)

# STACKING THE DATA : PLOT THE 4 IMAGES AUTOMATICALLY
stackg <- c(g2000, g2005, g2010, g2015)
plot(stackg, col=clg)

# EXERCICE : MAKE THE DIFFERENCE BETWEEN THE FIRST AND THE FINAL ELEMENTS OF THE STACK
difg <- stackg[[1]] - stackg[[4]]
# difg <- g2000 - g2015
plot(difg, col=cldif)

# EXERCICE : MAKE A RGB PLOT USING DIFFERENT YEARS
im.plotRGB(stackg, r=1, g=2, b=3)
