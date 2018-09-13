*Semestre 5*

# Exploration et analyse des données environnementales


## I) Introduction et définitions

### A) La statistique

C'est un ensemble d'outils et de méthodes mathématiques pour quantifier des objets et des phénomènes à des fins analytiques.

R.A Fisher : "*La discipline qui étudie les **méthodes des réductions de données, la variabilité et les populations**.*"

La réduction des données, les méthodes de réduction des données font partie de la **statistique descriptive**, décrit unn jeu de donnée -> graphique, moyenne (ou **exploratoire**).

**Statistique descriptive**
* essayer de décrire de manière synthétique des tendances susceptibles d'exister dans des jeux de données
*  essayer de caractériser des relations entre des variables

**La variabilité**, l'étude de la variabilité cherche à expliquer cette variabilité. Elle fait partie de la théorie de l'échantilllonage.

**Théorie de l'échantillionnage**, étude des liaisons existant entre une pop et les échantillions de cette Pop. Elle est fondamentale
* estimer les paramètres de la pop à partir des paramètres correspondant de l'échantillion
* savoir si les diff observées entre deux échantillions sont dues au hasard ou réellement significatives

**Les populations**, l'étude des pop fait partie de la **statistique inférentielle** qui prend un échantillion et en tire des ccl pour toute la population
Elle utilise des hypothèses de départ et des tests statistiques pour voir si les résultats obtenus diffèrent ou non de ce que l'on aurait par le simple effet du hasard.

![Statistique](Images/1.jpg)

### B) Notion de variabilité

La variabilité est inhérente à toute mesure et à tout système étudié.
A cause de cette variabilité, l'expérimentateur se retrouve fréquemment dans une situation où il ne peut déterminer avec certitude à l'aide de ses résultats si l'effet qu'il cherche à mesurer est réellement présent, où s'il pourrait être le fruit du hasard.
Or, l'expérimentateur doit poser un choix sur les résultats de son expérience.

**La variabilité de la mesure:**
*ex essayer de mesurer plusieurs fois la taille de l'individu, des valeurs différentes seront trouvés alors que dans l'absolu, cet individu ne bouge pas.*

**La variabilité inter-individus:**
*ex observation de la taille des crapauds autour d'une mare, il y aura des diff de taille*

**La variabilité intra-individu:**
*ex essayer de mesurer la tension artérielle d'un individu à diff moments de la journée ou au même moment plusieurs jours de suite d'un individu, des valeurs diff seront trouvées*

**BCP D INCERTITUDES**

### C) Variable, pop, échantillion

Variable une grandeur mesurée (X) à laquelle on s'interresse.
* une seule variable = **statistique univariée** (*taille, poids*)
* deux ou plusieurs variablies = **statistique multivarié** (*la taille en fonction du poids*)


Population est une ensemble de valeurs que peut prendre une variable
* **population finie** 
* **population statistique**

**Individu**, une entité sur laquelle une ou plusieurs observations sont réalisées. C'est un élément de la pop.

**Observation**, mesure particulière d'une variable (x<sub>i</sub>) sur un individu

**Echantillon**, sous ensensemble de la pop statistique constitué des observations réalisées. La taille de l'échantillon est généralement notée *n*. Le processus qui mène à la création de l'échantillon se nomme simplement échantillionnage.

Un des fondements des statistiques est de considérer que les échantillions sont **aléatoires**.
Les probabilités d'être échantillonné, ou d'appartenir à un groupe doivent être identiques pour tous les individus étudiés.

### D) Les types de variables (à savoir)

* Les variables ordonnées (cellle qu'on peut classer)
* Les variables non ordonnées

![Statistique](Images/2.jpg)

![Statistique](Images/3.jpg)

> Quand on fait un partiel garder le même nb de chiffre derrière la virgule

![Statistique](Images/4.jpg)

![Statistique](Images/5.jpg)

![Statistique](Images/6.jpg)

![Statistique](Images/7.jpg)

## II) Les statistiques descriptives

Comme le nom l'indique, les stat descriptives servent à décrire un jeu de données ou un échantillon.
Un tableau brut et rarement compréhensible tel quel, comment présenter les données autrement pour les rendre plus compréhensibles ?

Deux grands groupes, les méthodes numériques ( descripteurs statistiques) et les méthodes graphiques 
> Elles sont complémentaires

Distinction entre jeux de données **univariés** (une seule variable), **bivariés** (deux variables) et **multivariés** (plus de deux variables dans le jeu de données)

On décrit  de façon synthétique une pop à l'aide de paramètres ou estimateurs statistiques tirés de l'échantillon.

On utilise 2 types de paramètres:
* **paramètre de position** (valeur centrale)
* **paramètre de dispersion** (variabilité)

![Statistique](Images/8.jpg)

![Statistique](Images/9.jpg)

![Statistique](Images/10.jpg)

![Statistique](Images/11.jpg)

![Statistique](Images/12.jpg)

La variance représente la dispersion de la moyenne.

![Statistique](Images/13.jpg)

![Statistique](Images/14.jpg)

![Statistique](Images/15.jpg)

![Statistique](Images/16.jpg)

![Statistique](Images/17.jpg)

![Statistique](Images/18.jpg)

![Statistique](Images/19.jpg)

## III) Les distributions de probabilité

Au delà de la caractérisation d'un échantillon par un ou plusieurs paramètres, il est possible de décrire la façon dont les obeservations d'une variable sont distribués ou réparties.

On construit alors une courbe de distribution des **fréquences** observée.

La distribution permettra de définir les tests statistiques à utiliser par la suite.

![Statistique](Images/20.jpg)

![Statistique](Images/21.jpg)

![Statistique](Images/22.jpg)

![Statistique](Images/23.jpg)

![Statistique](Images/24.jpg)

Courbe 1 = fréquence et courbe 2 = fonction

### D) Les lois de distribution théorique

Connaître un échantillon c'est
* connaître sa moyenne
* connaître sa variance et donc son écart type
* avoir une représentation des données par un histogramme ou un diagramme en bâtons (en fonction de la nature de la variable).

Problématique:

On veut connaître la pop de laquelle est issu l'échantillon, c'est à dire être capable de tracer l'histogramme représentant la pop.

Observation des histogrammes:

Les histogrammes illustrant des échantillons de pop présentent **tous** la particularité d'une forme de cloche quand on tend vers l'infini

![Statistique](Images/25.jpg)

![Statistique](Images/26.jpg)

![Statistique](Images/27.jpg)

![Statistique](Images/28.jpg)

![Statistique](Images/29.jpg)

![Statistique](Images/30.jpg)

![Statistique](Images/31.jpg)

![Statistique](Images/32.jpg)

![Statistique](Images/33.jpg)

![Statistique](Images/34.jpg)

![Statistique](Images/35.jpg)

![Statistique](Images/36.jpg)

![Statistique](Images/37.jpg)

![Statistique](Images/38.jpg)

![Statistique](Images/39.jpg)

![Statistique](Images/40.jpg)

![Statistique](Images/41.jpg)

![Statistique](Images/42.jpg)

![Statistique](Images/43.jpg)

![Statistique](Images/44.jpg)

![Statistique](Images/45.jpg)

![Statistique](Images/46.jpg)

![Statistique](Images/47.jpg)

![Statistique](Images/48.jpg)

![Statistique](Images/49.jpg)

![Statistique](Images/50.jpg)

![Statistique](Images/51.jpg)

![Statistique](Images/52.jpg)

![Statistique](Images/53.jpg)

![Statistique](Images/54.jpg)

![Statistique](Images/55.jpg)

![Statistique](Images/56.jpg)

![Statistique](Images/57.jpg)

![Statistique](Images/58.jpg)

![Statistique](Images/59.jpg)

![Statistique](Images/60.jpg)

Loi de Ficher est toujours positive. Unilatérale à droite car la courbe n'est pas exactement symétrique. 

![Statistique](Images/61.jpg)

![Statistique](Images/62.jpg)

![Statistique](Images/63.jpg)

![Statistique](Images/64.jpg)

![Statistique](Images/65.jpg)

P joue sur la symétrie, et n sur la largeur

![Statistique](Images/66.jpg)

![Statistique](Images/67.jpg)

Une loi binomiale, qu'on on augmente n et que la probabilité d'une deux issues, est très petit, cela devient une loi de Poisson.


### III) Les distributions de proba

#### g) Les intervalles de confiance

Un I.C d'un paramètre est une estimation **par intervalle** de ce paramètre.

*ex la moyenne de la variable X de la pop statistique se situe entre la valeur a et la valeur b*.

Un coeff de risque (alpha) est attibrué aux estimations par intervalle de confiance

*ex j'ai 5% de chances de me tromper lorsque je dis que la moyenne de la variable X de la pop stat se situe entre la valeur a et la valeur b*

> En général, on prend: alpha = 0,05 ou alpha = 0,01 ou alpha = 0,001

![Statistique](Images/68.jpg)

![Statistique](Images/69.jpg)
 
![Statistique](Images/70.jpg)
 
![Statistique](Images/71.jpg) 

![Statistique](Images/72.jpg)

![Statistique](Images/73.jpg)
 
![Statistique](Images/74.jpg)
 
![Statistique](Images/75.jpg)
 
![Statistique](Images/76.jpg)

![Statistique](Images/77.jpg) 

![Statistique](Images/78.jpg)

![Statistique](Images/79.jpg)

![Statistique](Images/80.jpg)

![Statistique](Images/81.jpg)

![Statistique](Images/82.jpg)

![Statistique](Images/83.jpg)

![Statistique](Images/84.jpg)

![Statistique](Images/85.jpg)

![Statistique](Images/86.jpg)

### IV) La Statistique inférentielles 

* Les tests se présentent sous la forme d'un élément de réponse à la question suivante: 
	* la différence constatée est liée au hasard H<sub>0</sub> ou a une 		différence *réelle* entre les pop concernées H<sub>1</sub>?

	* la réponse est probaliste
    * la proba d'un *faux positif* est indiquée par alpha.
    
* Le test statistique calcule une valeur en fonction des moyennes et écart-types dans les échantillons.

![Statistique](Images/87.jpg)

![Statistique](Images/88.jpg)

![Statistique](Images/89.jpg)

![Statistique](Images/90.jpg)

![Statistique](Images/91.jpg)

![Statistique](Images/92.jpg)

Significativement = tester

![Statistique](Images/93.jpg)

Alpha tjs = 0,05

![Statistique](Images/94.jpg)

Ce graphe marche toujours, à mémoriser, ne marche que pour les lois continues (normale, student, ficher)

![Statistique](Images/95.jpg)

![Statistique](Images/96.jpg)

![Statistique](Images/97.jpg)

![Statistique](Images/98.jpg)

![Statistique](Images/99.jpg)

![Statistique](Images/100.jpg)

## IV) Les stat inférentielles

### B) Principe: 2 types de risques

> 1) rejet, d'une hypothèse nulle H<sub>0</sub> correcte

* On décide que les moyennes de 2 échantillons sont différentes alors qu'elles ne le sont pas 
* Les deux échantillons sont issus d'une même pop 

> 2) acceptation d'une hypothèse nulle H<sub>0</sub> incorrecte

* On décide que les moyennes des 2 échantillons ne sont pas diff alors que'elle le sont

* Les 2 échantillons ne sont pas issus d'une même pop

![Statistique](Images/101.jpg)

![Statistique](Images/102.jpg)

![Statistique](Images/103.jpg)

![Statistique](Images/104.jpg)

![Statistique](Images/105.jpg)

![Statistique](Images/106.jpg)

![Statistique](Images/107.jpg)

![Statistique](Images/108.jpg)

![Statistique](Images/109.jpg)

![Statistique](Images/110.jpg)

![Statistique](Images/111.jpg)

Ecart entre les extrémités

![Statistique](Images/112.jpg)

Il n'y a pas de diff significative entre ma série de données et ce que serait ma série si elle suivait une loi de distribution normale. Ma série alternative n'est pas normale. 

![Statistique](Images/113.jpg)

![Statistique](Images/114.jpg)

![Statistique](Images/115.jpg)

![Statistique](Images/116.jpg)

![Statistique](Images/117.jpg)

![Statistique](Images/118.jpg)

![Statistique](Images/119.jpg)

![Statistique](Images/120.jpg)

![Statistique](Images/122.jpg)

![Statistique](Images/123.jpg)

![Statistique](Images/124.jpg)

Au numérateur, on met la variance la plus grande

![Statistique](Images/125.jpg)

![Statistique](Images/126.jpg)

![Statistique](Images/127.jpg)

![Statistique](Images/128.jpg)

![Statistique](Images/129.jpg)

![Statistique](Images/130.jpg)

![Statistique](Images/131.jpg)

![Statistique](Images/132.jpg)

![Statistique](Images/133.jpg)

![Statistique](Images/134.jpg)

![Statistique](Images/135.jpg)

![Statistique](Images/136.jpg)

![Statistique](Images/137.jpg)

![Statistique](Images/138.jpg)

![Statistique](Images/139.jpg)

![Statistique](Images/140.jpg)

![Statistique](Images/141.jpg)

![Statistique](Images/142.jpg)

![Statistique](Images/143.jpg)

![Statistique](Images/144.jpg)

![Statistique](Images/145.jpg)

![Statistique](Images/146.jpg)

![Statistique](Images/147.jpg)

![Statistique](Images/148.jpg)

![Statistique](Images/149.jpg)

![Statistique](Images/150.jpg)

![Statistique](Images/151.jpg)

![Statistique](Images/152.jpg)

![Statistique](Images/153.jpg)

![Statistique](Images/154.jpg)

