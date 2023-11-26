# PLOT EXTERNAL DATA
library(terra)

# SET THE WORKING DIRECTORY BASED ON YOU PATH :
setwd("youtpath") # Par exemple, setwd("C://path/Downloads")
naja <- rast("najafiraq_etm_2003140_lrg.jpg")  # Like in im.import()
plotRGB(naja, r=1, g=2, b=3) # im-plotRGB

# MULTITEMPORAL CHANGE DETECTION
najadif = naja[[1]] - najaaug[[1]] 
cl <- colorRampPalette(c("brown", "grey", "orange")) (100)
plot(najadif, col=cl)
