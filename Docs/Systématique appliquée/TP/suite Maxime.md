# suite Maxime


donnéesListe$HR$val <- as.numeric(donneesListe$HR$val)
str(donnéesListe$val)

# Même chose pour pH (on remplace HR)

HR <- data.frame(grp = donneesListe$HR$grp), dat = donnéesListe$HR$dat, mod = donnéesListe$HR$mod, rep = donnéesListe$HR$rep, horiz = donnéesListe$HR$horiz, HR = donnéesListe$HR$val

pH <- data.frame(grp = donneesListe$pH$grp), dat = donnéesListe$pH$dat, mod = donnéesListe$pH$mod, rep = donnéesListe$pH$rep, horiz = donneesListe$pH$horiz, pH = donnéesListe$pH$val

str(donneesListe(macro)
donneesListe$macro$val<-factor(donneesListe$macro$val)
str(donneesListe$macro)
macro <- dcast(data = donneesListe$macro, formula = code - val, fun.aggregate = length)

boxplot(HR - mod, HR)

hr

HR$HR(28:30) <- HR$HR(28:30)/100 

boxplot(HR~mod, HR)

par(mar = c(2,2,1,1))

lm1<-lm(HR - mod, HR)

res1<-residuals(lm1)

shapiro.test(res1)
bartlett.test(HR$HR, HR$mod)

kruskal.test(HR$HR, HR$mod)

install.packages("pgirmess")

species(esnumber())





