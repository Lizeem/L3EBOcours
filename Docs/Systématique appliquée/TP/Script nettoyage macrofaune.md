### Chargement et installation des packages ###
```R
install.packages(c("vegan", "reshape2", "labdsv", "pgirmess"))
library(vegan)
library(reshape2)
library(labdsv)
library(pgirmess)
```
### Chargement des donnees ###
```R
donneesBrutes <-
  read.table(
    file = "Base_de_donnees_2018-2019.txt",
    header = TRUE,
    sep = "\t", 
    dec = ",",
    stringsAsFactors = TRUE # Assure que les chaîne de caractères soient enregistrées en facteurs
  )
```
### Verifications du tableau ###
```R
nrow(donneesBrutes) 
```
1042 lignes, 1043 sur Excel - 1 pour les headers, check
```R
str(donneesBrutes)
```
colonnes identifiees correctement comme facteurs

date: integer numeric, parfait

rep: convertir en factor, on remplace 'rep' en caractères par 'rep' en facteur
```R
class(donneesBrutes$rep)
donneesBrutes$rep <- as.factor(donneesBrutes$rep)
class(donneesBrutes$rep)
```
mod: 10 level, il y a un soucis
```R
levels(donneesBrutes$mod) # Différents niveaux pour la même chose
levels(donneesBrutes$mod) <- c("B", "B", "H", "H", "H", "M", "M", "M", "M", "M") # On remplace ces niveaux
levels(donneesBrutes$mod) # check, mais l'ordre n'est pas le bon
donneesBrutes$mod <- factor(x = donneesBrutes$mod, # Le facteur à modifier
levels = c("H", "M", "B"), # L'ordre souhaité des niveaux
ordered = TRUE) # Oui, l'ordre doit être maintenu comme tel
levels(donneesBrutes$mod) # check
```
horiz: 10 niveaux de facteur, ça parait beaucoup
```R
levels(donneesBrutes$horiz) # Même chose qu'au dessus, nomenclatures différentes pour la même chose
levels(donneesBrutes$horiz) <- c("A", "O", "O", "O", "OF", "OH", "OL", "A", "A", "A")
levels(donneesBrutes$horiz) # check
```
var: 18 niveaux de facteur, ça fait beaucoup, vérifier
```R
levels(donneesBrutes$var) # Ok, répétitions, doublons, nettoyer
levels(donneesBrutes$var) <- c("macro", rep("epaisseur", 5), 
rep("macro", 3), # répéter "macro" trois fois, correspond à c("macro", "macro", "macro")
"HR", "HR", rep("macro", 5), "pH", "pH")
levels(donneesBrutes$var) # check
```
grp: 5 niveaux?
```R
levels(donneesBrutes$grp) # Ok, il y a un "2B." en trop
levels(donneesBrutes$grp) <- c("1A", "1B", "2A", rep("2B", 2))
levels(donneesBrutes$grp) # Parfait, plus que 4 groupes
```
Derniere verification
```R
str(donneesBrutes)
```
ça a l'air bon, on peut continuer


### Création d'un code unique par point d'échantillonnage ###

exemples
```R
paste("a", "b", "c", sep = "_")
paste(c("a", "b", "c"), c(1,2,3), c("x", "y", "z"), sep = "_")
```
# application
```R
donneesBrutes$code <- # création d'une nouvelle colonne dans le tableau
  paste(donneesBrutes$grp, # colle l'ensemble des éléments de 'grp'
donneesBrutes$mod, # aux éléments correspondant dans 'mod'
donneesBrutes$rep, # puis dans 'rep'
substr(x = donneesBrutes$horiz, # sélectionner uniquement le premier caractère de l'horizon
start = 1, stop = 1),    # extrait donc "O" de "OL" et de "OF"
sep = "_") # colle les différentes colonnes en séparant par des "_": par exemple 1B_H_2_A
donneesBrutes$code <- as.factor(donneesBrutes$code) # transformation en facteur
levels(donneesBrutes$code) # vérification, 117 valeurs uniques
sort(levels(donneesBrutes$code)) # ordination des codes pour vérification
```
72 valeurs, check


### Séparation des données par type (i.e. un data.frame pour le pH, un pour l'humidité, etc)

exemple simple
```R
x <- c(1,2,3,4,5,6) # vecteur de valeurs
f <- factor(c("a", "a", "a", "b", "b", "b")) # factor de découpage du vecteur
listeTest <- split(x = x, f = f) # application du découpage de x par f grâce à al fonction split()
listeTest$a # accès facile à chaque tableau
rm(list = c("x", "f", "listeTest")) # nettoyage de l'environnement de travail
```
application
```R
donneesListe <- # création d'une nouvelle variable, une liste
  split( # fonction permettant un "subset" automatique en fonction d'un facteur
    x = donneesBrutes,  # données à couper
    f = donneesBrutes$var # facteur utilisé pour le découpage, ici les différents types de données
à savoir pH, HR, epaisseur et macro.                      
  )
names(donneesListe) # On a bien nos quatres types de données séparées
lapply(donneesListe, head) # Applique la fonction 'head()' à chaque élément de la liste
```


### Création de tableaux croisés pour analyse

Humidité relative
```R
head(donneesListe$HR) # voir la partie supérieure du tableau
class(donneesListe$HR) # il s'agit d'un data.frame
str(donneesListe$HR) # structure du data.frame
donneesListe$HR$val <- as.character(donneesListe$HR$val) # transformation d'un factor en character
donneesListe$HR$val <- gsub(pattern = ",", # Elément recherch": ,
                            replacement = ".", # A remplacer par: .
                            x = donneesListe$HR$val) # dans ce vecteur
donneesListe$HR$val <- as.numeric(donneesListe$HR$val) # transformation des lettres en valeurs numériques
str(donneesListe$HR) # vérification du contenu du tableau
HR <- data.frame(grp = donneesListe$HR$grp, # à gauche du "=": nom de la colonne/objet
                 dat = donneesListe$HR$dat, # à droite du "=": données à placer dans l'objet
                 mod = donneesListe$HR$mod, 
                 rep = donneesListe$HR$rep, 
                 horiz = donneesListe$HR$horiz, 
                 HR = donneesListe$HR$val) # Création d'un tableau avec les bonnes valeurs
dim(HR) # 36 lignes, 6 colonnes, c'est bon
rownames(HR) <- donneesListe$HR$code # utilise le code unique comme nom de lignes
HR <- HR[order(rownames(HR)),] # Réordonne le tableau dans l'ordre des rownames
```
exemple
```R
vector <- c(4,3,5,1,2)
order(vector)
vector[order(vector)]
rm("vector")
```
Potentiel hydrogène, même chose qu'au dessus mais pour le pH
```R
head(donneesListe$pH)
class(donneesListe$pH)
str(donneesListe$pH)
donneesListe$pH$val <- as.character(donneesListe$pH$val)
donneesListe$pH$val <- gsub(pattern = ",",
                            replacement = ".",
                            x = donneesListe$pH$val)
donneesListe$pH$val <- as.numeric(donneesListe$pH$val)
str(donneesListe$pH)
pH <- data.frame(grp = donneesListe$pH$grp, 
                 dat = donneesListe$pH$dat,
                 mod = donneesListe$pH$mod, 
                 rep = donneesListe$pH$rep, 
                 horiz = donneesListe$pH$horiz, 
                 pH = donneesListe$pH$val)
dim(pH) # 36 lignes, 6 colonnes, c'est bon
rownames(pH) <- donneesListe$pH$code
pH <- pH[order(rownames(pH)),]
```
Macrofaune
```R
str(donneesListe$macro) # ok, il reste des niveaux de facteurs inutiles dans 'val' et 'horiz'
donneesListe$macro$val <- factor(donneesListe$macro$val) # réappliquer 'factor()' retire les niveaux inutiles
str(donneesListe$macro) # Parfait

macro <- dcast(data = donneesListe$macro, # source des données
               formula = code ~ val,      # formule à appliquer: 'code' en lignes et 'val' 
                                          # (i.e. Espèces, Ordres, etc) en colonnes
               fun.aggregate = length,
               fill = 0) # Que faire si valeurs manquantes. S'agissant d'abondances les valeurs
                         # vides sont bien des 0
```
La formule au dessus trouve dans 'data' tous les cas pour chaque combinaison code~val. 

L'argument 'fun.aggregate =' stipule quoi faire avec ces données. 

La fonction 'length()' permet de compter le nombre de valeurs correspondant à cette combinaison

Permet donc de déterminer une abondance, à savoir le nombre d'individus de l'espèce/ordre donné par 'val' pour une valeur de 'code', à savoir pour un point d'échatillonnage donné
```R
dim(macro) # Seulement 70 lignes, il manque 2 valeurs.
summary(macro$code) # Il manque les valeurs pour '1B_B_3_A' (pas de données dans le tableau)
                    # et '1B_M_3_A' (même chose)
                    # Pilluliers vide? Données on rentrée?
                    # Dans le doute, NA
macro <- rbind(macro, NA, NA) # Ajout de deux lignes vides à 'macro'
macro$code[71:72] <- c("1B_B_3_A", "1B_M_3_A")
rownames(macro) <- macro$code # le code unique comme rownames
macro <- macro[,-1] # on retire la colonne 1, qui contient le code est maintenant en rownames
```
On ordonne le tableau comme avec les rownames
```R
macro <- macro[order(rownames(macro)),]
```
On rajoute des colonnes avec les modalités au tableau, on extrait directement les informations des noms de ligne

```R
rownames(macro)
macro$grp <- as.factor(substr(rownames(macro), 1, 2))
macro$mod <- as.factor(substr(rownames(macro), 4, 4))
macro$rep <- as.factor(substr(rownames(macro), 6, 6))
macro$horiz <- as.factor(substr(rownames(macro), 8, 8))
```
### La suite dans "script_analyses_L3EBO_2018-2018.R"

Il manque un, ou plusieurs, tableaux pour les épaisseurs des différents horizons