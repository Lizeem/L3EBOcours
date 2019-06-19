# Approche expérimentale et modèles théoriques

Effectif d'une population peut au cours du temps : 

* croître 
* rester stable
* fluctuer autour d'une valeur moyenne
* décroître jusqu'à l'extinction

Ces cinétiques démographiques dépendent :

* propriétés de l'environnement = milieu
* propriétés des individus 
* propriétés de la population dans son ensemble

Constat 1 : populations naturelles ne croissent pas indéfiniment

Constat 2 : population oscille autour d’une valeur moyenne d’
équilibre

Généralement : capacité d’accroissement absolue d’une population 
est plus importante que l’amplitude de fluctuation observée ,dans le cas d’une oscillation ou fluctuation régulière :mise en évidence d’une stabilisation de la population

*Quels sont les mécanismes contrôlant ces fluctuations ?*

Objet d’étude de la dynamique des populations

Constat 3: Si densité de la population concernée influe sur l’intensité 
d’action des mécanismes régulateurs, mise en évidence d’un phénomène de 
régulation

3 notions sont ainsi identifiées :

* limitation
* stabilisation
* régulation

ces trois notions 

- ne sont pas nécessairement régies par les mêmes mécanismes 
- ne sont pas indépendantes les unes des autres
- sont les premiers degrés de compréhension du fonctionnement 
d’une population

2 types d’approches peuvent être envisagées :

* approche expérimentale: mise en culture de la population étudiée (conditions contrôlées)
* approche théorique: basée sur une démarche mathématique (modélisation théorique)

Historiquement : démarche théorique fut la première mise en œuvre (Lotka et Voltera 1908)

démarche expérimentale est venue ensuite pour valider ou non les modèles théoriques

## I) Modèles mathématiques de croissance d’une population = modèles théoriques

plusieurs cas de figures :

-  populations isolées
-  population en interaction avec une ou plusieurs populations :compétition, prédateur – proie

### A) Modèle d'accroissement simple 

Effectifs dépendent d'un équilibre entre :

* natalité = Q
* mortalité = M
* émigration = e
* immigration = i

à t on a :

 N t = N t-1 + ( Q – M + i – e)

Si la population est en équilibre :

i = e ou i et e = 0

N t = N t-1 + (Q – M)

Or nombre de morts et de naissances dépendent des taux de mortalité (M = m N t-1) et de natalité (Q = q N t-1)

D’où :

N t = N t-1 + (q N t-1 – m N t-1)

N t - N t-1 = N t-1 (q  – m)

Soit 

r = taux d’accroissement = différence entre q et m:

N t = r N t-1 + N t-1  et r = (N t - N t-1) / N t-1

Soit pour un intervalle de temps t :

dN / dt = r N t-1

r directement lié :aux conditions du milieu aux caractéristiques des individus

r peut présenter une valeur max, ressources non limitantes 

ex : colonisation d’un nouveau milieu

si effectif augmente : ressources peuvent devenir i
nsuffisantes, r décroît

-> r est directement dépendant de l’effecti

r devient nul quand N = K
croissance de la population est dite régulée par sa
propre densité

N t = N t-1 + (r m -α N t-1) N t-1

K dépend de 

* α
* r m

avec K = r m / α

Plusieurs cas de figures se présentent :

* système oscille autour d’une position d’équilibre K quand r m = 2

->oscillations comprises entre 2 bornes : stabilité 

* si r m < 2 

-> oscillations non égales qui diminuent progressivement pour revenir à la valeur K

* si r m  > 2 

-> oscillations non égales, système déstabilisé conduisant à l’extinction de la population

à partir des valeurs de r on a :

dN / dt = r m  N ((K – N) / K)

-> équation logistique de Verhulst : densité de la population  dépend de la résistance du milieu  
= (K – N) / K

Ce modèle suppose :

- population possède une structure d’âge constante
- les individus participent tous de manière équivalente à la reproduction
- milieu possède une capacité biotique constante (rare)

Il est limité par l’hypothèse de départ :

- existence d’une relation linéaire entre r et N

### B) Modèles plus complexes

effet dépresseur peut apparaître à partir d’un seuil au delà duquel son intensité va grandissante : A

taux d’accroissement peut ne pas être max. pour des densités faibles : B

## II) Approches expérimentales

Destinées à **valider** les modèles mathématiques

3 objectifs:

-  mettre en évidence les modalités de croissance d’une espèce en fonction de la quantité de nourriture
-  évaluer les effets de la compétition entre deux espèces = expression mathématique de l’intensité de la lutte pour la vie
-  définir le devenir d’un couple prédateur 
	– proie ou parasite 
    – hôte

### A) Croissance d'une population isolée

**Modèle biologique** = *Trilobium confusum*

Elevage sur farine : ressource disponible variable

courbe de croissance comparable à une courbe logistique

* si quantité nourriture = 16 g densité max. = 650 individus
* si quantité nourriture = 64 g densité max. = 1750 individus

-> charge alimentaire est le facteur limitant

-> étude ayant permis de vérifier l’ajustement d’une population sur le modèle logistique 

Observations : 

* 1er stade = accroissement de la population constant quelque soit le niveau de ressources
* à partir d'un seuil x = taux d'accroissement diminue

### B) Croissance de deux populations en compétition

Expérience de Gause

populations séparées : croissance sur le modèle d’une courbe logistique

population en présence : *P. caudatum* est éliminée. L’espèce ayant le taux d’accroissement le plus rapide est la seule à survivre

Remarque : 

*P. caudatum* réagit aux produits issus du métabolisme = sorte d’empoisonnement 

En milieu renouvelé, l’inverse se produit : *P aurelia* est éliminée

L’association P caudatum avec une autre paramécie (P. bursaria)
donne des résultats totalement différents : les 2 espèces coexistent en utilisant des territoires différents

Compétition entre les deux coléoptères : En b) Oryzaephilus s’en sort grâce aux petits tubes capillaires servant de refuge aux œufs et larves

l’hétérogénéité spatiale permet à 2 espèces de cohabiter

parfois la compétition peut aboutir à un état d’équilibre stable 

ex : Phleum pratense et Anthoxanthum odoratum

### C) Croissance d'un couple de population prédateur - proie

Expérience de Gause

**Modèle biologique** : aramecium caudatum = proie, Didinium nasutum = prédateur

dans milieu fermé : 
prédateurs éliminent rapidement les proies puis meurent de faim

ajout de sédiment d’avoine : Paramécies s’y réfugient et s’y développent, Prédateurs meurent de faim

milieu homogène avec apports réguliers de proies 

Fluctuations identiques aux observations faites dans le 1er cas 
