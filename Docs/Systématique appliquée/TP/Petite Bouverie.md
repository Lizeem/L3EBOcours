```R
read.table("data18.txt") -> data
dim(data)
head(data)

t(data) -> data

dim(data)

colSums(data)

data[,-which(colSums(data)==0)] -> data1

dim(data1)

data1 -> data

apply(data, 2, mean)

rep(1:42, each = 5) -> fac42

list(fac42) -> fac42

aggregate(data, fac42, sum) -> dat42

dat42[,-1] -> dat421

dat421 -> dat42

rm(dat421)



head(dat421)

order(colSums(dat42))

dat42[,order(-colSums(dat42))]

head(dat42)
rowSums(dat42>0) -> richesse

rowSums(ifelse(dat42>0, 1, 0)) -> richesse2

richesse2==richesse

install.packages("ade4")


library(ade4)

rep(1:6, 7) -> x
rep(c(14,12,10,8,6,4,2),each=6) -> y

cbind(x,y) -> xy

xy

plot(xy)
```
![Graphique respresentant les différentes parcelles](Images/plotxy.JPG)
```R
s.value(xy,richesse, method ="greylevel")
```
![Graphique représentant la richesse de chaque parcelle](Images/richesse.JPG)
```R
s.value(xy, richesse-15.28)
```
![Graphique représentant la richesse de chaque parcelle](Images/richesse2.JPG)
```R
mdu <- 1

s.value(xy, dat42[,mdu], sub=colnames(dat42)[mud], csub=3)

read.table("facteurs2018.txt") -> fac

install.packages("agricolae")

fac

library(ade4)

head(fac)

head(dat42)

rowSums(dat42>0) -> ric

ric


colnames(dat42)
```
 La fréquence de fauchage a t-elle un impacte sur la présence d'espèce néctarifère

```R
dat42[,c(1,9,10,19,23,35)] -> datnec

rowSums(datnec) -> abnec

rowSums(datnec>0) -> rnec

head(fac)
summary(fac$Freq)

sunflowerplot(fac$Freq, abnec)

boxplot(abnec~fac$Freq)

library(agricolae)

print(kruskal(abnec,fac$Freq))

boxplot(abnec~fac$Exp)


kruskal(abnec,fac$Exp)

print(kruskal(abnec,fac$Exp))

which.max(abnec)

boxplot(abnec~fac$gestion)

boxplot(abnec~fac$Exp*fac$Freq)

boxplot(ric~fac$Exp*fac$Freq)
```

