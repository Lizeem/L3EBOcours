# Script Gastéropode

```R
read.table("gastdef18.csv", sep="\t", header=T, dec=",") -> gast
gast

summary(gast)
```
La richesse en gastéropodes est -elle équivalente le long du transect ?
```R
table(gast$zone, gast$sp)

paste(gast$zone, gast$rep)

cbind(paste(gast$zone, gast$rep), gast) -> gast1

head(gast1)

colnames(gast1)[1] <- "zonerep"

head(gast1)

table(gast1$zonerep, gast1$sp)

gast1[-which(gast1$zonerep=="Ser 12"),] -> gast2

dim(gast1)

gast2$zonerep[which(gast2$zonerep=="Ser 121")] <-"Ser 12"

table(gast2$zonerep, gast2$sp)

gast2$sp[which(gast2$sp == "Gump")] <- "Gumb"

gast2$sp[which(gast2$sp == "Gcin"&gast2$zonerep =="Ser 2")] <- "Gum"

write.table(gast2, "gast2.txt")
read.table("gast2.txt") -> gast3

table(gast3$zonerep, gast3$sp)

gast3 -> gast2
head(gast2)

table(gast2$zonerep, gast2$sp) -> table56
write.table(table56, "table56.txt")

rowSums(table56>0) -> ric56
```

gl = génère des niveaux

```R

gl(4, 14, labels = c("Lam", "Ser", "Spi", "Ves")) -> fac56

boxplot(ric56~fac56)
```
relevel = ordonne des graphiques

```R
relevel(fac56,"Lam") -> fac56 
relevel(fac56,"Ser") -> fac56 
relevel(fac56,"Ves") -> fac56 
relevel(fac56,"Spi") -> fac56 
fac56

boxplot(ric56~fac56)

library(agricolae)
(kruskal(ric56,fac56))

rowSums(tab56) -> ab56
boxplot(ab56~fac56)

(kruskal(ab56,fac56))

library(vegan)
diversity(tab56)/log(ric56) -> even56

boxplot(even56~fac56)

(kruskal(even56,fac56))

colnames(tab56)

espece <- 1
boxplot(tab56[,espece]~fac56, main = colnames(tab56)[espece])


espece <- espece +1
boxplot(tab56[,espece]~fac56, main = colnames(tab56)[espece])
(kruskal(tab56[,espece], fac56))
gast2[gast2$sp == "Patsp",] -> Pat

hist(Pat$biom, breaks =30)

par(mfrow=c(5,1))

hist(Pat$biom, breaks =30, xlim=c(0,30))
hist(Pat$biom[Pat$zone =="Spi"], breaks =30, xlim=c(0,30))
hist(Pat$biom[Pat$zone =="Ves"], breaks =30, xlim=c(0,30))
hist(Pat$biom[Pat$zone =="Ser"], breaks =30, xlim=c(0,30))
hist(Pat$biom[Pat$zone =="Lam"], breaks =30, xlim=c(0,30))

plot(density(Pat$biom))
lines(density(Pat$biom[Pat$zone =="Spi"]), col="red")
lines(density(Pat$biom[Pat$zone =="Ves"]), col="blue")
lines(density(Pat$biom[Pat$zone =="Ser"]), col="green")
lines(density(Pat$biom[Pat$zone =="Lam"]), col="pink")
```
