# COMMENT LES ESPECES SONT LIEES ENTRE ELLES SPATIALEMENT (DANS UN ENVIRONNEMENT) ? ICI, EXEMPLE POUR LA FLORE
library(vegan) # package sur la Flore et ses fonctions (data, head, decorana) et dune = veg

# OUVRIR LES DONNERS ET SELECTIONNER CELLES QUE L'ON SOUHAITE AFFICHER
data(dune) # matrix of several plots with amount of individuals in each plot
dune
head (dune) # only the first 6 rows (6 premières colonnes)

# DEBUTER LE DETREND CORRESPONDENCE ANALYSIS (DCA) : METHODE POUR REPONDRE A CETTE QUESTION
ord <- decorana(dune) # Méthode DCA

# APRES AVOIR AFFICHE ORD (CORRESPONDANCE ORTHOGONALES), ON COPIE LES DONNEES D'AXIS LENGHTS (LONGUEUR DE CHAQUE AXE)
ldc1 = 3.7004
ldc2 = 3.1166
ldc3 = 1.30055
ldc4 = 1.47888

total = ldc1 + ldc2 + ldc3 + ldc4

# PERCENTAGE OF RANGE (INTERVALLE) FOR EACH AXIS
pldc1 = ldc1 * 100 / total
pldc2 = ldc2 * 100 / total
pldc3 = ldc3 * 100 / total
pldc4 = ldc4 * 100 / total

pldc1 + pldc2

# AFFICHER LE PLOT (PARCELLE) AVEC CES DONNEES
plot(ord)

