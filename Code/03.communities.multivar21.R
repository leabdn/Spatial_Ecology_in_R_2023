# Comment les espèces sont liées entre elles spatialement (dans un environnement) ? Ici, exemple pour la FLORE
library(vegan) # package sur la Flore et ses fonctions (data, head, decorana) et dune = veg

# Ouvrir les données et sélectionner celles que l'on souhaite afficher
data(dune) # matrix of several plots with amount of individuals in each plot
dune
head (dune) # only the first 6 rows (6 premières colonnes)

# Débuter la Detrended correspondence analysis (DCA) : méthode pour répondre à cette question
ord <- decorana(dune) # Méthode DCA

# Après avoir affiché ord (correspondances otrhogonales), on copie les données d'Axis lengths (longueur de chaque axe)
ldc1 = 3.7004
ldc2 = 3.1166
ldc3 = 1.30055
ldc4 = 1.47888

total = ldc1 + ldc2 + ldc3 + ldc4

# Percentage of range (intervalle) for each axis
pldc1 = ldc1 * 100 / total
pldc2 = ldc2 * 100 / total
pldc3 = ldc3 * 100 / total
pldc4 = ldc4 * 100 / total

pldc1 + pldc2

# Afficher le plot (parcelle) avec ces données
plot(ord)

