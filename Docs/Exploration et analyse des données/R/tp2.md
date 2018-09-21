-## I) Explorer les données d'une variable

```R
tab1 <- read.table("trees.txt", sep= "\t", header = TRUE)
tab1
```

**range()** renvoie un vecteur contenant le minimum et le maximum de tous les arguments donnés

```R
range(tab1$Height)
c(min(tab1$Height), max(tab1$Height))
```

**sum()** permet de sommer les éléments du tableau
**cumsum()** permet de faire une somme cumulative des éléments du tableau

```R
sum(tab1$Height)
cumsum(tab1$Height)
```

**summary()** permet de faire le résumé du tableau

```R
summary(tab1$Height)
```

**sd()** est la fonction de l'écart-type

```R
sd(tab1$Height)
sdt <- function(x)sqrt(var(x))
sdt(tab1$Height) 
```

**sort()** est l'ordre croissant entre les données de Height

```R
sort(tab1$Height)
```

**rank()** donne l'ordre des éléments d'un vecteur : 

```R
rank(tab1$Height)
```

On tire aléatoirement dans ce vecteur grâce à la fonction **sample()**

```R
sample(tab1$Height, 20)

res<-c();nn=1000;
for(i in 1:nn){ 
x=sample(tab1$Girth,10);
res[i]=mean(x,na.rm = T);
}
res

par(mfrow=c(2,2))
hist(res,prob=T)
hist(res,freq=F)
```

## II) Manipuler les data frames

Même chose sans la 13e ligne

```R
res<-c();nn=1000;  
for(i in 1:nn){ 
x=sample(tab1[-13,]$Girth,10); 
res[i]=mean(x,na.rm = T);
}
res

par(mfrow=c(2,2))
hist(res,prob=T)
hist(res,freq=F)
```
On utilise maintenant un second tableau

```R
tab2 <- read.table("HF.txt", sep= "\t", header = TRUE)
tab2

names(tab2)[3] ="taille"
tab2[,(dim(tab2)[2]+1)] = ifelse(tab2$sexe=="h",0,1)
tab2
```
**colnames()** permet de nommer une colonne

```R
colnames(tab2)[4] = "femme"
tab2
```
On retire la ligne 32 du tableau

```R
tab2[-32,]
tab2 <- tab2[-32,]
tab2
```
On retire la 4e colonne du tableau
```R
tab2 <- tab2[,-4]
tab2
```
Création de 67e ligne
```R
Q <- list("f",58,175)
tab2[67,] <- Q
tab2
```

## Les lois de probabilité

```R
s1=rnorm(10,mean=2)
summary(s1)
s2=rnorm(100,mean=2)
summary(s2)
s3=rnorm(10000,mean=2)
summary(s3)

par(mfrow=c(3,3))

hist(s1,prob=T)
hist(s2,prob=T)
hist(s3,prob=T)
plot(density(s1))
x= seq(-5,5,by=.01)
lines(x,dnorm(x,mean=2),col=2) 
plot(density(s2))
lines(x,dnorm(x,mean=2),col=2)
plot(density(s3))
lines(x,dnorm(x,mean=2),col=2)

pnorm(1.96)
qnorm(0.975)
```

### Loi binomiale

```R
n=20;p=0.3;mu=n*p;s2=n*p*(1-p)
mu
s2

x= rbinom(100,n,p)
x
```
Création de l'histogramme
```R
hist(x,freq=FALSE)
mean(x)
var(x)

n=length(x)
n
```
Courbe faisant la somme cumulée des valeurs en ordre croissant

```R
plot(sort(x),(1:n)/n,type="s")
hist(x,prob=T,col=grey(0.4))
```

**curve()** dessine une courbe directement sur une fonction donnée

```R
curve(dnorm(x,mu,s2),add=T)  
qqnorm(x);qqline(x)
plot(qpois(ppoints(x),mu),sort(x))
plot(qbinom(ppoints(x),n,p),sort(x))

n=50;p=0.03;mu=n*p;s2=n*p*(1-p);
x=rbinom(100,n,p)
plot(qpois(ppoints(x),mu),sort(x))

x=rnorm(100)
hist(x,freq=F)
curve(dnorm(x),add=T)
```

## Les données de taille

```R
tab3 <- read.table("HF.txt", sep= "\t", header = TRUE)
tab3

homme <- subset(tab3$taille, sexe == "h") 
homme

femme <- subset(tab3$taille, sexe == "f")
femme

hist(homme, proba = TRUE, col = grey(0.8), main = "Taille des hommes")
provi <- seq(160,200,length = 50)
lines(provi,dnorm(provi,mean(homme),sd(homme)),lwd = 2)
```

Pour calculer un intervalle de confiance à 95% de la moyenne d'une variable numérique:

```R
t.test(VA)$conf.int[1:2]
```

Il est possible de préciser le taux de confiance (ici 90%):

```R
t.test(VA,conf.level=0.90)$conf.int[1:2]
```