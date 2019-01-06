tab1 <- read.table("trees.txt", sep= "\t", header = TRUE)
tab1

range(tab1$Height)
c(min(tab1$Height), max(tab1$Height))

sum(tab1$Height)
cumsum(tab1$Height)

summary(tab1$Height)

fivenum(tab1$Height)

sd(tab1$Height)

sdt <- function(x)sqrt(var(x))
std(tab1$Height) # à revoir

sort(tab1$Height)

rank(tab1$Height)

sample(tab1$Height, 20)

res<-c();nn=1000; # création d'un vecteur vide possédant 1000 places 
for(i in 1:nn){ 
x=sample(tab1$Girth,10);
res[i]=mean(x,na.rm = T);
}
res
# res (vecteur)

par(mfrow=c(2,2))
hist(res,prob=T)
hist(res,freq=F)

res<-c();nn=1000; # création d'un vecteur vide possédant 1000 places 
for(i in 1:nn){ 
x=sample(tab1[-13,]$Girth,10); #sans la ligne 13
res[i]=mean(x,na.rm = T);
}
res
# res (vecteur)

par(mfrow=c(2,2))
hist(res,prob=T)
hist(res,freq=F)

tab2 <- read.table("HF.txt", sep= "\t", header = TRUE)
tab2

names(tab2)[3] ="taille"
tab2[,(dim(tab2)[2]+1)] = ifelse(tab2$sexe=="h",0,1)
tab2

colnames(tab2)[4] = "femme"
tab2

tab2[-32,]
tab2 <- tab2[-32,]
tab2

tab2 <- tab2[,-4]
tab2

Q <- list("f",58,175)
tab2[67,] <- Q
tab2

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
lines(x,dnorm(x,mean=2),col=2) #donner x et y pour qu'elle fonctionne
plot(density(s2))
lines(x,dnorm(x,mean=2),col=2)
plot(density(s3))
lines(x,dnorm(x,mean=2),col=2)

pnorm(1.96)
qnorm(0.975)

n=20;p=0.3;mu=n*p;s2=n*p*(1-p)
mu
s2

x= rbinom(100,n,p)
x

hist(x,freq=FALSE)
mean(x)
var(x)

n=length(x)
n

plot(sort(x),(1:n)/n,type="s")

hist(x,prob=T,col=grey(0.4))
curve(dnorm(x,mu,s2),add=T) # fonctionne directement sur une fonction donnée
qqnorm(x);qqline(x)
plot(qpois(ppoints(x),mu),sort(x))
plot(qbinom(ppoints(x),n,p),sort(x))

n=50;p=0.03;mu=n*p;s2=n*p*(1-p);
x=rbinom(100,n,p)
plot(qpois(ppoints(x),mu),sort(x))

x=rnorm(100)
hist(x,freq=F)
curve(dnorm(x),add=T)

tab3 <- read.table("HF.txt", sep= "\t", header = TRUE)
tab3

homme <- subset(tab3, sexe == "h")$tai
homme


histogramme <- hist(homme, proba = TRUE, col = grey(0.8), main = "Taille des hommes")
histogramme

provi <- seq(160,200, length = 50)
provi

lines(provi, dnorm(provi, mean(homme), sd(homme)), lwd=2, col = "red")

femme <- subset(tab3, sexe != "h")$tai
femme

hist <- hist(femme, proba = TRUE, col= grey(0.8), main = "Taille des femmes")
hist

provi <- seq(150,200,length = 50)
provi

lines(provi, dnorm(provi, mean(femme), sd(femme)), lwd = 2, col ="blue")



# Exercice 1

dosage <- c(0.96,1.04,1.08,0.92,1.04,1.18,0.99,0.99,1.25,1.08)
dosage
 mean(dosage)

t.test(dosage)$conf.int[1:2]


# Exercice 2

n = 150; p= 0.02

dbinom(5,150,0.02)

pbinom(3,150,0.02)
# ou
sum(dbinom(0:3,150,0.02))

qbinom(0.99,150,0.02)







