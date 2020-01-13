data<-read.table("data18.txt")
data
data<-t(data)
colSums(data)
data1<-data[,-which(colSums(data)==0)]
data1
apply(data,2,mean)
fac42<-rep(1:42,each=5)
fac42


fac42<-list(fac42)
dat42<-aggregate(data,fac42,sum)
dat42
dat421<-dat42[,-1]
dat42<-dat421
rm(dat421)
head(dat42)
order(colSums(dat42))
dat42<-dat42[,order(-colSums(dat42))]

richesse<-rowSums(dat42>0)
richesse2<-rowSums(ifelse(dat42>0,1,0))
richesse2==richesse
library(ade4)
x<-rep(1:6,7)
y<-rep(c(14,12,10,8,6,4,2),each=6)

xy<-cbind(x,y)
xy
plot(xy)
s.value(xy,richesse,method="greylevel")

head(dat42)
dat45<-dat42[,-c(12,26,35,33,39,31)]
dat45
dat42<-dat45
dat42
#Objet 

ls()

data(santacatalina)
santacatalina

santa <- t(santacatalina)
apply(santa, 1, sum)


barplot(sort(santa[1,]))
barplot(sort(santa[2,]))
par(mfrow=c(2,5))
for(i in 1:nrow(santa)){
barplot(sort(santa[i,]))}

sum(santa[1,])
santa[1,]/sum(santa[1,]) -> pi1
pi1

log(pi1)

pi1[-which(pi1==0)] -> pi01
log(pi01)
pi01*log(pi01)
# Il devient maximal quand on se rapproche de 1/r

-sum(pi01*log(pi01))
santa[8,]/sum(santa[8,]) -> pi8
pi8[-which(pi8==0)] -> pi08
-(pi08*log(pi08))
-sum(pi08*log(pi08))

x <- seq(0,1,by=0.0001)
x
par(mfrow=c(1,1))
plot(-(x*log(x)),x)
plot(x,-(x*log(x)))
-sum(pi08*log(pi08))

length(pi08)

1/7
0.142*log(0.142)
(0.142*log(0.142))*7
-sum(pi08*log(pi08))/1.94

# équirépartition -> pi = 1/r
# Heq = Hmax = -r(1/r ln 1/r) = -ln 1/r = lnr











