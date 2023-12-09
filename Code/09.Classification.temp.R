# CLASSIFYING SATELLITE IMAGES / REMOTE SENSING DATA AND ESTIMATE THE AMOUNT OF CHANGE
# 1. OPEN PACKAGES
install.packages("terra")
install.packages("imageRy")
install.packages("ggplot2")
install.packages("patchwork")
library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)
im.list()

# 2. IMPORT THE DATA
sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg") # Source de l'image : https://www.esa.int/ESA_Multimedia/Images/2020/07/Solar_Orbiter_s_first_views_of_the_Sun6

# 3. CLASSIFY SATELLITE DATA (CLASSES DE VALEURS)
# INTENSITE LUMINEUSE DU SOLEIL (ICI, 3 CLASSES CHOISIES DONC 3 ENTITES)
sunc <- im.classify(sun)
plotRGB(sun, 1, 2, 3) # Nombre de clusters (groupes) à afficher sur l'image
plot(sunc)
OU BIEN
sunc <- im.classify(sun, num_clusters=3) # Nombre de clusters (groupes) à afficher sur l'image
plot(sunc[[1]]) # Afficher la première image

# FORESTS (CLASSE 1) et AGRICULTURAL AREAS (CLASSE 2)
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m1992c <- im.classify(m1992, num_clusters=2)                    
plot(m1992c[[1]])
---
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
m2006c <- im.classify(m2006, num_clusters=2)
plot(m2006c)

# 4. PLOT COMPARATIVE DATA (DIFFERENTS DATES)
par(mfrow=c(1,2)) # Affichage de 1 ligne et 2 colonnes
plot(m1992c[[1]])
plot(m2006c[[1]])

# 5. COMPUTE PERCENTAGES
f1992 <- freq(m1992c)
f1992
tot1992 <- ncell(m1992c)
p1992 <- f1992 * 100 / tot1992 
p1992
# LECTURE DES RESULTATS : forêt : 83.08% et champs : 16.91%
---
f2006 <- freq(m2006c)
f2006
tot2006 <- ncell(m2006c)
p2006 <- f2006 * 100 / tot2006 
p2006
# LECTURE DES RESULTATS : forêt : 45.31% et champs : 54.69%

# 6. BUILDING THE FINAL TABLE
class <- c("forest", "human")
y1992 <- c(83, 17)
y2006 <- c(45, 55) 
tabout <- data.frame(class, y1992, y2006)
tabout

# 7. FINAL OUTPUT TABLE
cover <- c("forest", "agriculture")
perc1992 <- c(83.08, 16.91)
perc2006 <- c(45.31, 54.69)
p <- data.frame(cover, perc1992, perc2006)
p

# FINAL PLOT
p1 <- ggplot(tabout, aes(x=cover, y=perc1992, color=cover)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(p, aes(x=cover, y=perc2006, color=cover)) + geom_bar(stat="identity", fill="white"))
p1+p2

# FINAL PLOT - RESCALED rescaled
p1 <- ggplot(p, aes(x=cover, y=perc1992, color=cover)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p2 <- ggplot(p, aes(x=cover, y=perc2006, color=cover)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p1+p2

---
# Additional images: https://webbtelescope.org/contents/media/videos/1102-Video?Tag=Nebulas&page=1
