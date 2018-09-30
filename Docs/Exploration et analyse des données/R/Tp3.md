Exercice 1

Question biologique: y-a-t-il une différence significative entre la richesse en 2 années

```R
BI <- read.table("birds.txt", sep="\t", header=T, row.names =1)
head(BI)
```

Echantillons indépendants 

```R
dim(BI) # grands échantillons 
```
Test Z

Test de Normalité 

H0: pas d différence significative entre la variable et ce qui serait la variable si elle suivait une loi normale

H1 : différence significative entre la variable et ce qui serait la variable si elle suivait une loi normale

```R
shapiro.test(BI$rs1)
```

pvalue< 0.05 donc Ho est rejeté

```R
shapiro.test(BI$rs3)
```

pvalue < 0.05 donc H0 est rejeté

```R
shapiro.test(log(BI$rs1))
```

pvalue > 0.05 donc normalité

```R
shapiro.test(log(BI$rs3))
```

 pvalue > 0.05 donc normalité

Test Z

H0 : pas d différence significative entre les richesses moyennes de 2001 à 2003

H1 : différence significative entre les richesses moyennes de 2001 à 2003

```R
library(BSDA)

z.test(log(BI$rs1), log(BI$rs3), sigma.x=sd(log(BI$rs1)), sigma.y=sd(log(BI$rs3)), alt="less")
```

Il y a une différence significative entre 2001 et 2003. La richesse spécifique est plus évoluée en 2003

Representation graphique 

```R
lab <- c("2001","2003")
boxplot(BI$rs1, BI$rs3, names = lab, ylab ="Richesse spécifique")
points(1, mean(BI$rs1),pch=16,col="red")
points(2,mean(BI$rs1),pch=16, col="blue")
```
![Répartition des richesses entre 2001 et 2003](Images/20012003.JPG)

### Exercice 2

Ces données confirment-elles l'hypothèse d'une réduction du domaine vital de l'élan durant la période hivernale ?

```R
ha <- read.table("elan.csv", sep=",", header=T, row.names =1)
ha
```

Echantillon appariés 

```R
dim(ha) # petits échantillons

H0: il n'y a pas de différence significative entre les deux périodes 
H1: il y a une différence significative entre les deux périodes

shapiro.test(ha$Hiver)
```

pvalue > 0.05 donc normalité

```R
shapiro.test(ha$Printemps)
```

pvalue > 0.05 donc normalité

```R
t.test(ha$Printemps, ha$Hiver, var.equal =F, paired = T, alt="greater")

pvalue < 0.05 donc H1 : il y a une différence significative entre les deux périodes

Saison <- c("Printemps", "Hiver")

boxplot(ha$Printemps, ha$Hiver, main = "Représentation graphique", ylab = "taille domaine vital de l'élan (ha)", names =Saison)

points(2,mean(ha$Hiver), pch=16, col="yellow")
points(1,mean(ha$Printemps), pch=16=, col="grey")
```
![Domaine vital entre le Printemps et l'Hiver](Images/PrintempsHiver.JPG)

### Exercice 3

```R
Bufo <- read.table("toads.txt", sep="\t", header=T)
Bufo
```

Existe t-il une différence significative de poids entre les mâles et les femelles ?

Echantillons indépendants

```R
dim(Bufo)
```
C'est un petit échantillon (19<30)

```R
male <- subset(Bufo, sexe =="m")$poids
male

femelle <- subset(Bufo, sexe =="f")$poids
femelle

```
H0: il n'y a pas de différence significative de poids entre les mâle et les femelles 
H1: il y a une différence significative de poids entre les mâles et les femelles

```R
shapiro.test(male)
```

pvalue >0.05 donc normalité

```R
shapiro.test(femelle)
```

pvalue >0.05 donc normalité

```R
var.test(male, femelle)

t.test(male, femelle, var.equal =F, paired = F, alt ="greater")
```

pvalue > 0.05 donc H0, il n'y a pas de valeurs significatives de poids entre les mâles et les femelles

```R
sexe <- c("mâle", "femelle")

boxplot(male, femelle, main = "Représentation graphique", ylab = "poids", names =sexe)

points(1,mean(male), pch=16, col="green")
points(2,mean(femelle), pch=16, col="purple")
```
![Représentation graphique du poids des mâles et ds femelles](Images/poidsmalefemelle.JPG)