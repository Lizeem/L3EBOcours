 					#SCRIP - TD Phytosociologie et statistiques (L3), 2019#


	#######################################################################
	#Avant de faire n'importe quel export sous R, mettre un raccouci  de R#
	#dans le repertoire où l'on veut récupérer les données                #
	#Puis une fois R ouvert, faire fichier/changer le repertoire courant  #
	#choisir le dossier où l'on souhaite récupérer les données. Sinon R   #
        # ne trouve pas le chemin pour acceder aux données brutes             #
	#######################################################################


	  #######################################################################################
 	 #Entre # je mets ce que je veux ce n'est pas lu par R, ne pas être avare de commentaire!#
  	  #######################################################################################

	 #######################################################
	# à savoir : les arguments non numérique se mettent en 'x'#
	 #######################################################

	 ##############################################################################################
	#il arrive souvent que R ne change pas les graphiques avec nos modifications                   #
	#dans ce cas il faut le redémarrer, c'est pour cela qu'il faut tjrs travailler sur un script   #
	# et non pas directement sur la console R                                                      #
	#pour atténuer les risques d'erreur ne pas donner lemême nom aux objets	                       #
	#  car R attribue souvent le nom aux premières données chargées				       #
	#							                                       #
	 ##############################################################################################

   
#ouverture du dossier enregister sous bloc-note#
#soit p2 le nom que je donne au jeu de donnés que je veux tester#

p2<-read.table("RP.txt",header=T,dec=",",row.names=1,na.strings=NA)
p2
	#header=T, indique que la 1ère ligne est la légende de colonnes#
	#dec=indique comment les décimales sont représentées dans le fichier chargé#
	#row.name= 1 indique que la première colonne est la légende des lignes#
	#na.string=NA, R n'accepte pas les vides (données abs) il faut donc remplacer#
	#par NA et lui indiquer qu'il s'agit de données non existantes#
	#p2<- Donne un nom à l'objet, c'est plus simple pour les lignes de codes suivantes#

summary(p2) #indique les différents calculs sous le jeu de données#
library(ade4)  #package à télécharger, executer cette ligne à chaque ouverture pr le charger#
library(vegan)


   #Aide au tri de tableaux de relevés phytosociologiques#

					 ###
					#AFC#
					 ###

	#l'AFC simple#

z2<-dudi.coa(df = p2, scannf = F)
z2
	#df= la data.frame, c'est à dire le dossier que l'on a importé au format .txt#
	#scannf = définit si on souhaite afficher le barplot des valeurs propres#
	#nf= permet d'imposer le nombre d'axes#


	#L'éboulis des valeurs propres#

inertie<-z2$eig/sum(z2$eig)*100
barplot(inertie,ylab="% d'inertie",names.arg=round(inertie,2))
title("Eboulis des valeurs propres en %")

	#z2$eig= variable qui contient les valeurs propres#
	#inertie= fonction pr avoir les résultats en %, plus parlant#
	#barplot= fonction qui permet de créer des histogrammes#


	#Les valeurs propres en %#

round(z2$eig/sum(z2$eig)*100,2)

	#une représentation du plan factoriel#
afc<-scatter.coa(z2,xax=1,yax=2, method = 1,  
main="le nom que je veux", posieig = "bottom",clab.row=0.7)
s.label(z2$li,boxes=FALSE)

	#scatter.coa () fonction graph pour AFC#
	#z2= les résultats de l'AFC#
	# xax= l'axe représenté en abscisse#
	# yax= l'axe rep en ordonnée#
	# method ?#
	# sub= sous-titre graph, si besoin#
	# posieig= position du barplot des valeurs propres, "none" si on ne veut pas qu'il apparaisse#
	#clab.row=taille étiquette des lignes, clab.col idem pour colonnes#
	#s.label() permet de contrôler les paramètres d'affichage du graphique#
	#1= ; 2= ; 3= ; 4 = #



	#les contributions relatives#

inertia.dudi(z2,col.inertia = T)$col.abs  #pour colonnes#
inertia.dudi(z2,row.inertia = T)$row.abs  #pour les lignes#

#aide graphique à l'interprétation des axes#

score.coa (z2,xax = 1,dotchart = TRUE)
title("Répartition des modalités sur l'axe 1") 
abline(v=0)                                       #affiche répartition, contribution pr les axes#
score.coa (z2,xax = 2,dotchart = TRUE)
title("Répartition des modalités sur l'axe 2")
abline(v=0)

			 ###################
			#CAH méthode de Ward#
			 ###################

	#Calcul du tableau des distances#
dc2<-dist(z2$li, method ="euclidean", diag=FALSE, upper=FALSE)
	
	#z2$li= contient les variables de l'AFC#
	#methode= calcul des distances, ici des distances euclidiennes#
	#diag=indique si la diagonale des distances de la matrice doit être affichée#
	#upper=triangle des distances doit être affiché#


	#Dendrogramme#
hier2<-hclust(dc2,"ward")
par(cex=0.7)
plot(hier2,hang=-1,
main='cluster le nom que je veux'
)
rect.hclust(hier2,k=4, border='red')

	#hclust() permet de dessiner le dendrogramme#
	#"ward"-> méthode que l'on va utiliser, autre par ex:UPGMA#
	#par()définit les différent paramètres du graph#
	#cex permet de modifier la taille du graphique obtenu#
	#plot() fonctoin qui crée les graphiques#
	#hang=?#
	#main=titre#
	#rect.hclust () permet d'afficher des rectangles autour des classes sur le dendro#
	#k=nb de classe#
	#border=couleur de la bordure du rect#

#Récupération des groupes (4 classes)#
classes<-cutree(hier2,4)
classes
#exporter au format Excel#
library(xlsx)
write.xlsx(classes, "classes.xlsx")
write.csv(classes, "classes.xlsx")

	#une autre représentation#
library(cluster)
par(cex.lab=0.8)
clusplot(dc2,classes,diss=T,shade=T,color=T,labels=4,main="le nom que je veux")
abline(v=0,h=0)

	#shade argument pour mettre un remplissage en tiret des patates#
	#abline permet de tracer les axes à l'origine quand la valeur est 0#
	#dc2 nom du résultat de la classification#
	#cl2 définit le nb de classes#
	#color=T affiche la couleur des classes en fonction de la densité du nuage#
	#labels= indique comment on souhaite afficher les étiquettes de 1à5#
	#cex.tex= taille du texte des étiquettes#
	#cex.lab= modifie la taille...#

	#Mettre les classes de la CAH sur le graphe de l'AFC#
col.border<- c("blue","orange","green")
#création d'un vecteur couleur, pour connaître les différentes variations taper colors()#

s.class(z2$li,as.factor(classes),col=col.border, 
sub="Classes CAH")
#s.class() permet d'afficher les classe de la CAH sur le graphique#
#col définit les couleurs du graphe#
		 
