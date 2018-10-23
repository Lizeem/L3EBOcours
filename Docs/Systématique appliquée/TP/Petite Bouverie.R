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

read.table("facteurs2018.txt") -> fac

install.packages("agricolae")

fac

library(ade4)

head(fac)

head(dat42)

rowSums(dat42>0) -> ric

ric


colnames(dat42)

# La fréquence de fauchage a t-elle un impacte sur la présence d'espèce néctarifère

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

















