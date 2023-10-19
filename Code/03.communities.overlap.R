# Avant d'installer Overlap
install.package("vegan")
library(vegan)

# To know relation among species in TIME
install.package("overlap")
library(overlap)

# Afficher les données
data(kerinci) # Les données proviennent ici de Kerinci Sebalt National Park, Indonésie
head(kerinci) # On affiche seulement les 6 premières colonnes de données
kerinci # Pour afficher toutes les données 
summary(kerinci) # Afficher un résumé des données

# Choix de la temporalité (PROBLEME ICI)
kerinci$Timerad <- kerinci$Time * 2 * pi # On créé une nouvelle colonne où l'on assigne ce calcul de temps aux données du tigre (celle du Summary)
# NOTE SUR LE TEMPS : Le temps souhaité est linéraire (0 à 1), automatiquement il est circulaire dans R (horloge) : le package Overlap fonctionne en radiants.

# Analyser le mouvement d'une espèce dans l'espace avec une temporalité donnée (here, the tiger and The unit of time is the day, so the values range from 0 to 1).
# Choisir les données uniquement liées au tigre
tiger <- kerinci[kerinci$Sps=="tiger",] # Crochets : uniquement données liées au tigre. Dollard = lier. Sps = Species (voir colonne head(kerinci)).

# Afficher le plot
timetig <- tiger$TimeRad
densityPlot(timetig, rug=TRUE) # Kernel densities : fonction that show amount of time in an axis
plot(tiger$TimeRad)

# Exercice : select only the data of macaque individuals
macaque <- kerinci[kerinci$Sps=="macaque",]
head(macaque)
timemac <- macaque$timeRad
densityPlot(timemac, rug=TRUE)

# Overlap Plot (overlaping Kernel densities)
overlapPlot(timetig, timemac) # La virgule exprime Versus
# Le graphique montre les deux courbes et partie grisée : danger pour les macaques (quand les tigres sont présents, ils sont menacés). Le temps de l'axe X est 0:00, 6:00 ...





