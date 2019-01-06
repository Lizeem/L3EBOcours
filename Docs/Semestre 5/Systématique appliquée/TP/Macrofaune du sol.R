read.table("Base_de_donnees_2018-2019_v2.txt", sep="\t", header=T)-> TP 
TP
library(vegan)
library(reshape2)
nrow(TP)
str(TP)
TP$rep <- as.factor(TP$rep)
str(TP$rep)

levels(TP$mod) <- c("B","B","H","H","H","N","N","N","N","N")
levels(TP$mod)

TP$mod <- factor(x = TP$mod, levels =c("H","N","B"), ordered = T)

levels(TP$mod)

