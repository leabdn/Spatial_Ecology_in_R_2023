# AVANT D'INSTALLER OVERLAP
install.package("vegan")
library(vegan)

# TO KNOW RELATION AMONG SPECIES IN TIME
install.package("overlap")
library(overlap)

# AFFICHER LES DONNEES
data(kerinci) # Les données proviennent ici de Kerinci Sebalt National Park, Indonésie
head(kerinci) # On affiche seulement les 6 premières colonnes de données
kerinci # Pour afficher toutes les données 
summary(kerinci) # Afficher un résumé des données

# CHOIX DE LA TEMPORALITE
kerinci$Timerad <- kerinci$Time * 2 * pi # On créé une nouvelle colonne où l'on assigne ce calcul de temps aux données du tigre (celle du Summary).
# NOTE SUR LE TEMPS : Le temps souhaité est linéraire (0 à 1), automatiquement il est circulaire dans R (horloge) : le package Overlap fonctionne en radiants. 
# Fonction Timerad : permet de convertir le temps en radiants, pour utiliser le package Overlap. 
# SI ERREUR " ... is not a numeric data " : vérifier que les données sont biens numériques, en utilisant la fonction class(...) (ex. : class(tiger)). Si pas le cas, vérifier la fonction Timerad.

# ANALYSER LE MOUVEMENT D'UNE ESPECE DANS L'ESPACE AVEC UNE TEMPORALITE DONNEE (here, the tiger and the unit of time is the day, so the values range from 0 to 1).
# CHOISIR LES DONNEES UNIQUEMENT LIEES AU TIGRE
tiger <- kerinci[kerinci$Sps=="tiger",] # Crochets : uniquement données liées au tigre. Dollard = lier. Sps = Species (voir colonne head(kerinci)).
timetig <- tiger$Timerad # Temps passé par les tigres. 

# AFFICHER LE DENSITY PLOT ET LE PLOT DES DONNEES LIEES AUX TIGRES
densityPlot(timetig, rug=TRUE) # Kernel densities : fonction that show amount of time in an axis. Ici densité de tigres présents selon l'heure de la journée.
plot(tiger$Timerad) # Ici, temps passé (en radiants ici en ordonnées comme on lirait l'heure sur une horloge) par chaque tigre (Index en abscisse = numéro du tigre observé, de 1 à 200)

# EXERCICE : SELECT ONLY THE DATA OF MACAQUE INDIVIDUALS
macaque <- kerinci[kerinci$Sps=="macaque",]
head(macaque)
timemac <- macaque$Timerad
densityPlot(timemac, rug=TRUE)

# OVERLAP PLOT (overlaping Kernel densities)
overlapPlot(timetig, timemac) # La virgule exprime Versus.
# Le graphique montre les deux courbes et partie grisée : danger pour les macaques (quand les tigres sont présents, ils sont menacés). Le temps de l'axe X est 0:00, 6:00 ...
