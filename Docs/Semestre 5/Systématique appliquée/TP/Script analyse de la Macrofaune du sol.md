## Chargement des données

Execute l'ensemble du script de nettoyage et charge du coup les données correctes
```R
source("script_nettoyage_L3EBO_2018-2019.R")
```
## Analyses de données 

### Exemple de visualisation: humidité relative en fonction de la topographie

Visualisation catégorisée des données
```R
boxplot(HR ~ mod, HR)
```
Essai de tesqt paramétrique: l'Analyse de la Variance (ANOVA)

Conditions: normalité des résidus de regression, indépendance, homoscédasticité
```R
lm1 <- lm(HR ~ mod, HR) # Regression linéaire de l'humidité relative par la topographie 
```
Terme de gauche (lhs): variable dépendante

Terme de droite (rhs): variable explicative
```R
res1 <- residuals(lm1) # Résidus de la regression
shapiro.test(res1) # Test de normalité sur les résidus: on a bien la normalité
bartlett.test(HR$HR, HR$mod) # Test d'homoscédasticité: on a une hétéroscédasticité
```

Normalité, indépendance mais pas homoscadasticité: 

L'interprétation des résultats de ce test paramétrique serait fausse, on ne peut l'utiliser

Test non-paramétrique: test de Kruskal-Wallis

Seule condition: indépendance des données

H0: les données proviennent de la même distribution, pas de différences entre groupes
```R
kruskal.test(x = HR$HR,   # Données à tester
             g = HR$mod)  # Facteurs pour subdiviser les données en k groupes dont on                   # compare les distributions
```
La p-value étant inférieure à 0.05 nous pouvons rejeter H0 au seuil alpha de 0.05

Jusqu'à preuve du contraire nous admettons donc H1 avec un risque alpha (i.e. d'erreur de type I (faux-positif)) de 5%

Où sont ces différences? B-H? B-M? H-M? -> Test post-hoc
```R
kruskalmc(
  resp = HR$HR,   # Les données
  categ = HR$mod, # Le factor de groupement
  probs = 0.05    # Le seuil alpha
)
```
La différence trouvée au-dessus par le test de Kurskal-Wallis est entre le Haut et le Bas de la pente


### L'abondance totale de la macrofaune varie en fonction de la situation topographique

Calcul de l'abondance totale
```R
macro$abd <-               # Création d'une colonne "abondance" (abd) dans 'macro'
  rowSums(                 # Calcul de la somme de chaque ligne du data.frame fourni
    macro[,-c(75:78)]      # Uniquement les valeurs, pas les 4 colonnes de facteurs
  )
macro$abd # Abondances pour chaque site
```
Boxplot permettant la visualisation des différences
```R
boxplot(abd ~ mod, macro)
```
Présence de valeurs 'aberrantes' (statistiquement) à abondance très élevées

Essayez de creuser pour comprendre pourquoi:
```R
sort(macro$abd) # les 'outliers' sont: 259, 350, 504, 511, 588
orderAbdMacro <-
  order(
    macro$abd, # permet de voir la nouvelle position de la valeur au sein du vecteur après "sort"
    decreasing = TRUE # par défaut, ordination acendante (i.e. les valeurs les plus élevées à la fin)
  )                 # Si 'TRUE', ordination descendante
rownames(macro)[orderAbdMacro] # Les échantillons, de la densité la plus importante à la plus faible
rownames(macro)[orderAbdMacro][1:5] # Les 5 outliers sont:
```
Biais méthodologique dans les comptage? A vérifier.

Représentatif de l'hétérogénéité du site? Replat dans la pente, etc

Cas particulier? Par exemple les Hyménoptères trouvés dans des gales de racine par le groupe 1B

Test statistique (même chose que plus haut)
```R
lm2 <- lm(abd ~ mod,macro)
res2 <- residuals(lm1)
shapiro.test(res1) # Normalité des résidus
bartlett.test(macro$abd, macro$mod) # Hétéroscédasticité, on ne peut pas faire d'ANOVA

kruskal.test(x = macro$abd,   # Données à tester
g = macro$mod)   # Facteur de découpage
```

Il existe une différence entre groupes au sein du jeu de données (avec un risque alpha de faux-positif, toujours)

Nous pouvons faire un test post-hoc pour déterminer la nature de cette différence
```R
kruskalmc(
  resp = macro$abd,   # Les données
  categ = macro$mod, # Le factor de groupement
  probs = 0.05    # Le seuil alpha
)
```
Quelles modalités diffèrent et lesquelles ne diffèrent pas entre elles?

Regardez également la première colonne: différence observée



### Relation entre l'humidité relative et abondance de la macrofaune du sol dans l'horizon A

Extraction des données

```R
macro$horiz # plutôt régulier
which(macro$horiz == "A") # effectivement, il s'agit de tous les chiffres impairs
seq(from = 1, to = 71, by = 2) # Générère un vecteur allant de 2 en 2 de 1 à 71
seq(from = 1, to = 71, by = 2) == which(macro$horiz == "A") # C'est la même chose!
macroHorizA <- seq(from = 1, to = 71, by = 2)
```
Visualisation

```R
plot(
  HR$HR,                 # Les valeurs d'humidité en abscisse
  macro$abd[macroHorizA] # Sélectionne uniquement les valeurs des horizons A pour l'ordonnée
) # Ok nos valeurs d'abondance sont tirées vers le haut par les outliers, il faut essayer d'expliquer ces valeurs très élevées

lm3 <- lm(macro$abd[macroHorizA] ~ HR$HR)
abline(lm3) # Ajout de la droite de regression au modèle
```

La regression linéaire détermine l'équation y = ax+b pour laquelle la ligne est la plus proche de l'ensemble des points

```R
residuals(lm3) # Distance (euclidienne) entre chaque point et la droite de regression
coefficients(lm3) # les coefficients de la droite de regression y = ax+b
# b = intercept, a = HR$HR
summary(lm3) # Affichage des résultats du modèles
```
R² (ajusté): indique la proximité des points à la ligne de regression, basé donc sur les résidus

Si R² = 1: tous les points sont sur la ligne, la valeur de la variable explicative (ici l'HR) prédit parfaitement la variable dépendante (ici l'abondance)

Si R² = 0: la variable explicative n'a aucune utilité prédictive sur la variable dépendante

Ici R² = 0.1538 donc forte variabilité au sein des résidus, l'humidité relative n'est qu'un  indicateur partiel de l'abondance de la macrofaune dans l'horizon A

La relation est néanmoins significative (p < 0.05) malgré le R² faible



### Espèces indicatrices de la topograhie chez les annélides

```R
colnames(macro) # En-têtes pour trouver les annélides
lumbriculida <- c(4,16,20,42,43,  # Numéro de colonne des annélides identifiés à l'espèce 76 # Et la topographie
lumbriculida <- macro[,lumbriculida]
head(lumbriculida) # Le tableau ne contient bien que les espèces d'intérêt
```
Problème pour cette analyse: les NAs dans le tableau, il faut les retirer du tableau
```R
is.na(lumbriculida$Aporrechodea.longa) # 2 NAs
which(is.na(lumbriculida$Aporrechodea.longa)) # A ces lignes ci
lumbriculida <- lumbriculida[-which(is.na(lumbriculida$Aporrechodea.longa)),] 
```
Retrait des NAs du tableau

```R
indvalLumbriculida <-
  indval(
    x = lumbriculida[,1:5], # Le tableau de données des annélides (sans la topographie)
    clustering = lumbriculida$mod # Regarder pour les différents niveaux topographiques
  )

names(indvalLumbriculida)
indvalLumbriculida$relabu # Abondance relative par niveau topo
```
Apporectodea.longa: uniquement en bas

Pas d'annélides au milieu, etc

```R
indvalLumbriculida$indval # Valeur indicatrice pour chaque espèce et chaque niveau topo
indvalLumbriculida$maxcls # Indique le niveau topo pour lequel chaque espèce a la meilleure valeur indicatrice
levels(lumbriculida$mod) # Pour 'maxcls', 1 = "B", 2 = "H", 3 = "M"
```