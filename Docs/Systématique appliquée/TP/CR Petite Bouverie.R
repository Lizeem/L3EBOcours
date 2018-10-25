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

#Objet 


tonte14SR<-dat42[c(1,8,15),]
tonte14SR
tonte10SR<-dat42[c(2,9,16),]
tonte7SR<-dat42[c(3,10,17),]
fau3SR<-dat42[c(4,11,18),]
fau2SR<-dat42[c(5,12,19),]
fau1SR<-dat42[c(6,13,20),]
fau0<-dat42[c(7,14,21,28,35,42),]
tonte14AR<-dat42[c(22,29,36),]
tonte10AR<-dat42[c(23,30,37),]
tonte7AR<-dat42[c(24,31,38),]
fau3AR<-dat42[c(25,32,39),]
fau2AR<-dat42[c(26,33,40),]
fau1AR<-dat42[c(27,34,41),]

#tonte14SR 
tonte14SR<-tonte14SR[,-which(colSums(tonte14SR)==0)]
ifelse(tonte14SR[1,]==0,0,1)->tonte14SR1 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(tonte14SR[2,]==0,0,1)->tonte14SR8 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(tonte14SR[3,]==0,0,1)->tonte14SR15 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
c(rowSums (tonte14SR1, na.rm = FALSE, dims = 1),rowSums (tonte14SR8, na.rm = FALSE, dims = 1),rowSums (tonte14SR15, na.rm = FALSE, dims = 1))->tonte14SRfinal #on réunit les richesses spécifiques des 3 sous parcelles similaire dans une même liste

#tonte10SR
tonte10SR<-tonte10SR[,-which(colSums(tonte10SR)==0)]
ifelse(tonte10SR[1,]==0,0,1)->tonte10SR2 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(tonte10SR[2,]==0,0,1)->tonte10SR9 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(tonte10SR[3,]==0,0,1)->tonte10SR16 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
c(rowSums (tonte10SR2, na.rm = FALSE, dims = 1),rowSums (tonte10SR9, na.rm = FALSE, dims = 1),rowSums (tonte10SR16, na.rm = FALSE, dims = 1))->tonte10SRfinal

#tonte7SR
tonte7SR<-tonte7SR[,-which(colSums(tonte7SR)==0)]
ifelse(tonte7SR[1,]==0,0,1)->tonte7SR3 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(tonte7SR[2,]==0,0,1)->tonte7SR10 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(tonte7SR[3,]==0,0,1)->tonte7SR17 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
c(rowSums (tonte7SR3, na.rm = FALSE, dims = 1),rowSums (tonte7SR10, na.rm = FALSE, dims = 1),rowSums (tonte7SR17, na.rm = FALSE, dims = 1))->tonte7SRfinal



#fau3SR
fau3SR<-fau3SR[,-which(colSums(fau3SR)==0)]
ifelse(fau3SR[1,]==0,0,1)->fau3SR4 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(fau3SR[2,]==0,0,1)->fau3SR11 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(fau3SR[3,]==0,0,1)->fau3SR18 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
c(rowSums (fau3SR4, na.rm = FALSE, dims = 1),rowSums (fau3SR11, na.rm = FALSE, dims = 1),rowSums (fau3SR18, na.rm = FALSE, dims = 1))->fau3SRfinal


#fau2SR
fau2SR<-fau2SR[,-which(colSums(fau2SR)==0)]
ifelse(fau2SR[1,]==0,0,1)->fau2SR5 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(fau2SR[2,]==0,0,1)->fau2SR12 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(fau2SR[3,]==0,0,1)->fau2SR19 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
c(rowSums (fau2SR5, na.rm = FALSE, dims = 1),rowSums (fau2SR12, na.rm = FALSE, dims = 1),rowSums (fau2SR19, na.rm = FALSE, dims = 1))->fau2SRfinal


#fau1SR
fau1SR<-fau1SR[,-which(colSums(fau1SR)==0)]
ifelse(fau1SR[1,]==0,0,1)->fau1SR6 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(fau1SR[2,]==0,0,1)->fau1SR13 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(fau1SR[3,]==0,0,1)->fau1SR20 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
c(rowSums (fau1SR6, na.rm = FALSE, dims = 1),rowSums (fau1SR13, na.rm = FALSE, dims = 1),rowSums (fau1SR20, na.rm = FALSE, dims = 1))->fau1SRfinal


#fau0
fau0<-fau0[,-which(colSums(fau0)==0)]
ifelse(fau0[1,]==0,0,1)->fau07 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(fau0[2,]==0,0,1)->fau014 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(fau0[3,]==0,0,1)->fau021 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(fau0[4,]==0,0,1)->fau028 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(fau0[5,]==0,0,1)->fau035 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(fau0[6,]==0,0,1)->fau042 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
c(rowSums (fau07, na.rm = FALSE, dims = 1),rowSums (fau014, na.rm = FALSE, dims = 1),rowSums (fau021, na.rm = FALSE, dims = 1),rowSums (fau028, na.rm = FALSE, dims = 1),rowSums (fau035, na.rm = FALSE, dims = 1),rowSums (fau042, na.rm = FALSE, dims = 1))->fau0final

#tonte14AR
tonte14AR<-tonte14AR[,-which(colSums(tonte14AR)==0)]
ifelse(tonte14AR[1,]==0,0,1)->tonte14AR22 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(tonte14AR[2,]==0,0,1)->tonte14AR29 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(tonte14AR[3,]==0,0,1)->tonte14AR36 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
c(rowSums (tonte14AR22, na.rm = FALSE, dims = 1),rowSums (tonte14AR29, na.rm = FALSE, dims = 1),rowSums (tonte14AR36, na.rm = FALSE, dims = 1))->tonte14ARfinal


#tonte10AR
tonte10AR<-tonte10AR[,-which(colSums(tonte10AR)==0)]
ifelse(tonte10AR[1,]==0,0,1)->tonte10AR23 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(tonte10AR[2,]==0,0,1)->tonte10AR30 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(tonte10AR[3,]==0,0,1)->tonte10AR37 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
c(rowSums (tonte10AR23, na.rm = FALSE, dims = 1),rowSums (tonte10AR30, na.rm = FALSE, dims = 1),rowSums (tonte10AR37, na.rm = FALSE, dims = 1))->tonte10ARfinal


#tonte7AR
tonte7AR<-tonte7AR[,-which(colSums(tonte7AR)==0)]
ifelse(tonte7AR[1,]==0,0,1)->tonte7AR24 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(tonte7AR[2,]==0,0,1)->tonte7AR31 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(tonte7AR[3,]==0,0,1)->tonte7AR38 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
c(rowSums (tonte7AR24, na.rm = FALSE, dims = 1),rowSums (tonte7AR31, na.rm = FALSE, dims = 1),rowSums (tonte7AR38, na.rm = FALSE, dims = 1))->tonte7ARfinal

#fau3AR
fau3AR<-fau3AR[,-which(colSums(fau3AR)==0)]
ifelse(fau3AR[1,]==0,0,1)->fau3AR25 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(fau3AR[2,]==0,0,1)->fau3AR32 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(fau3AR[3,]==0,0,1)->fau3AR39 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
c(rowSums (fau3AR25, na.rm = FALSE, dims = 1),rowSums (fau3AR32, na.rm = FALSE, dims = 1),rowSums (fau3AR39, na.rm = FALSE, dims = 1))->fau3ARfinal

#fau2AR
fau2AR<-fau2AR[,-which(colSums(fau2AR)==0)]
ifelse(fau2AR[1,]==0,0,1)->fau2AR26 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(fau2AR[2,]==0,0,1)->fau2AR33 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(fau2AR[3,]==0,0,1)->fau2AR40 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
c(rowSums (fau2AR26, na.rm = FALSE, dims = 1),rowSums (fau2AR33, na.rm = FALSE, dims = 1),rowSums (fau2AR40, na.rm = FALSE, dims = 1))->fau2ARfinal

#fau1AR
fau1AR<-fau1AR[,-which(colSums(fau1AR)==0)]
ifelse(fau1AR[1,]==0,0,1)->fau1AR27 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(fau1AR[2,]==0,0,1)->fau1AR34 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
ifelse(fau1AR[3,]==0,0,1)->fau1AR41 #on met un 1 si l'espèce est présente 0 si elle ne l'est pas
c(rowSums (fau1AR27, na.rm = FALSE, dims = 1),rowSums (fau1AR34, na.rm = FALSE, dims = 1),rowSums (fau1AR41, na.rm = FALSE, dims = 1))->fau1ARfinal

#######################################################################################################################################################################

##Test AR/SR
#test tonte14
wilcox.test(tonte14ARfinal,tonte14SRfinal,paired=F,side="two.sided") #p-value=0.3687

#test tonte10
wilcox.test(tonte10ARfinal,tonte10SRfinal,paired=F,side="two.sided") #p-value=1

#test tonte7
wilcox.test(tonte7ARfinal,tonte7SRfinal,paired=F,side="two.sided") #p-value=0.07652

#test fau3
wilcox.test(fau3ARfinal,fau3SRfinal,paired=F,side="two.sided") #p-value=0.07625

#test fau2
wilcox.test(fau2ARfinal,fau2SRfinal,paired=F,side="two.sided") #p-value=0.7

#test fau1
wilcox.test(fau1ARfinal,fau1SRfinal,paired=F,side="two.sided") #p-value=0.2683

###############################################################################################################################################################################

##Test AR
#test tonte14/tonte10
wilcox.test(tonte14ARfinal,tonte10ARfinal,paired=F,side="two.sided") #p-value=0.5066

#test tonte14/tonte7
wilcox.test(tonte14ARfinal,tonte7ARfinal,paired=F,side="two.sided") #p-value=0.1157

#test tonte14/fau3
wilcox.test(tonte14ARfinal,fau3ARfinal,paired=F,side="two.sided") #p-value=0.2683

#test tonte14/fau2
wilcox.test(tonte14ARfinal,fau2ARfinal,paired=F,side="two.sided") #p-value=0.6531

#test tonte14/fau1
wilcox.test(tonte14ARfinal,fau1ARfinal,paired=F,side="two.sided") #p-value=0.6531

#test tonte14/fau0
wilcox.test(tonte14ARfinal,fau0final,paired=F,side="two.sided") #p-value=0.03725

#test tonte10/tonte7
wilcox.test(tonte10ARfinal,tonte7ARfinal,paired=F,side="two.sided") #p-value=0.1157

#test tonte10/fau3
wilcox.test(tonte10ARfinal,fau3ARfinal,paired=F,side="two.sided") #p-value=0.2

#test tonte10/fau2
wilcox.test(tonte10ARfinal,fau2ARfinal,paired=F,side="two.sided") #p-value=0.8248

#test tonte10/fau1
wilcox.test(tonte10ARfinal,fau1ARfinal,paired=F,side="two.sided") #p-value=0.2683

#test tonte10/fau0
wilcox.test(tonte10ARfinal,fau0final,paired=F,side="two.sided") #p-value=0.8955

#test tonte7/fau3
wilcox.test(tonte7ARfinal,fau3ARfinal,paired=F,side="two.sided") #p-value=0.6579

#test tonte7/fau2
wilcox.test(tonte7ARfinal,fau2ARfinal,paired=F,side="two.sided") #p-value=0.1157

#test tonte7/fau1
wilcox.test(tonte7ARfinal,fau1ARfinal,paired=F,side="two.sided") #p-value=0.8222

#test tonte7/fau0
wilcox.test(tonte7ARfinal,fau0final,paired=F,side="two.sided") #p-value=0.02688

#test fau3/fau2
wilcox.test(fau3ARfinal,fau2ARfinal,paired=F,side="two.sided") #p-value=0.2

#test fau3/fau1
wilcox.test(fau3ARfinal,fau1ARfinal,paired=F,side="two.sided") #p-value=0.5066

#test fau3/fau0
wilcox.test(fau3ARfinal,fau0final,paired=F,side="two.sided") #p-value=0.02753

#test fau2/fau1
wilcox.test(fau2ARfinal,fau1ARfinal,paired=F,side="two.sided") #p-value=0.3687

#test fau2/fau0
wilcox.test(fau2ARfinal,fau0final,paired=F,side="two.sided") #p-value=0.2393

#test fau1/fau0
wilcox.test(fau1ARfinal,fau0final,paired=F,side="two.sided") #p-value=0.03725

##test SR
#test tonte14/tonte10
wilcox.test(tonte14SRfinal,tonte10SRfinal,paired=F,side="two.sided") #p-value=1

#test tonte14/tonte7
wilcox.test(tonte14SRfinal,tonte7SRfinal,paired=F,side="two.sided") #p-value=0.4

#test tonte14/fau3
wilcox.test(tonte14SRfinal,fau3SRfinal,paired=F,side="two.sided") #p-value=0.6428

#test tonte14/fau2
wilcox.test(tonte14SRfinal,fau2SRfinal,paired=F,side="two.sided") #p-value=0.7

#test tonte14/fau1
wilcox.test(tonte14SRfinal,fau1SRfinal,paired=F,side="two.sided") #p-value=1

#test tonte14/fau0
wilcox.test(tonte14SRfinal,fau0final,paired=F,side="two.sided") #p-value=0.5133

#test tonte10/tonte7
wilcox.test(tonte10SRfinal,tonte7SRfinal,paired=F,side="two.sided") #p-value=0.6428

#test tonte10/fau3
wilcox.test(tonte10SRfinal,fau3SRfinal,paired=F,side="two.sided") #p-value=1

#test tonte10/fau2
wilcox.test(tonte10SRfinal,fau2SRfinal,paired=F,side="two.sided") #p-value=0.6579

#test tonte10/fau1
wilcox.test(tonte10SRfinal,fau1SRfinal,paired=F,side="two.sided") #p-value=1

#test tonte10/fau0
wilcox.test(tonte10SRfinal,fau0final,paired=F,side="two.sided") #p-value=0.6924

#test tonte7/fau3
wilcox.test(tonte7SRfinal,fau3SRfinal,paired=F,side="two.sided") #p-value=0.3758

#test tonte7/fau2
wilcox.test(tonte7SRfinal,fau2SRfinal,paired=F,side="two.sided") #p-value=1

#test tonte7/fau1
wilcox.test(tonte7SRfinal,fau1SRfinal,paired=F,side="two.sided") #p-value=0.5066

#test tonte7/fau0
wilcox.test(tonte7SRfinal,fau0final,paired=F,side="two.sided") #p-value=0.5978

#test fau3/fau2
wilcox.test(fau3SRfinal,fau2SRfinal,paired=F,side="two.sided") #p-value=0.6979

#test fau3/fau1
wilcox.test(fau3SRfinal,fau1SRfinal,paired=F,side="two.sided") #p-value=1

#test fau3/fau0
wilcox.test(fau3SRfinal,fau0final,paired=F,side="two.sided") #p-value=0.6924

#test fau2/fau1
wilcox.test(fau2ARfinal,fau1ARfinal,paired=F,side="two.sided") #p-value=0.3687

#test fau2/fau0
wilcox.test(fau2ARfinal,fau0final,paired=F,side="two.sided") #p-value=0.2393

#test fau1/fau0
wilcox.test(fau1ARfinal,fau0final,paired=F,side="two.sided") #p-value=0.03725


