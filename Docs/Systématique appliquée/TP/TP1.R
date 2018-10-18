ls()
plot(runif(10), main = "Titre du graphique")

poids <- c(60, 72, 57, 90, 95, 72)
poids

taille <- c(1.75, 1.8, 1.65, 1.9, 1.74, 1.92)
taille
taille^2

IMC <- poids/taille^2
IMC

log(IMC)

c(0,2)

IMC+ c(0,2)

poids.moy <- sum(poids)/length(poids)
poids.moy

plot(x = taille, y = poids)

args(plot.default)

names(par())

plot(taille, poids, pch = 19, col = "royalblue3", las = 1, main = "Poids vs. taille", xlab = "Taille[m]", ylab = "Poids[kg]")

x <- seq(from = min(taille),to = max(taille), length = 100)

lines(x=x, y=22.5*x^2, col = "red", lwd = 3)

lines(x=x, y= 24*x^2, col = "blue", lwd = 3)

dev.off()

pdf("IMC.pdf")

example(log)

example(boxplot)

search()

imc2 <- data.frame(poids, taille)
imc2

edit(imc2)

fix(imc2)
imc2

read.table("mf.txt", h = T) -> fm
fm

str(fm)

attributes(fm)


par(mfrow=c(3,1))

hist(fm$taille, xlim = c(140, 210))

hist(fm$taille[fm$genre == "F"], xlim = c(140, 210))

hist(fm$taille[fm$genre == "M"], xlim = c(140, 210))

min(fm$taille)

which.min(fm$taille)

fm$genre[85]

rtot <- rank(fm$taille)

rtot

rtot[fm$genre == "F"] -> rtotf
rtotf

rtot[fm$genre =="M"] -> rtotm
rtotm

sum(rtotf)
sum(rtotm)

mean(rtotf)
mean(rtotm)

wilcox.test(fm$taille~fm$genre)

bxp1 <- boxplot(fm$taille~fm$genre, main = "L3, 2018-2019", ylab = "Taille déclarée(cm)",  sub = "nF=62, nM=31, p<0.001, test des sommes des rangs de Wilcoxon", col = c("blue", "red"), names =paste(bxp1$names, "(n=", bxp1$n,")"))

bxp1

relevel(fm$genre, "M") -> fm$genre

install.packages("vegan")

