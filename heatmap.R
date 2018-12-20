#If not already installed
#install.packages("gplots")
#install.packages("devtools")

#Load necessary packages
library("gplots")
library("devtools")

#Load latest version of heatmap.3 function
source_url("https://raw.githubusercontent.com/obigriffith/biostar-tutorials/master/Heatmaps/heatmap.3.R")

#Set a working directory for output files
#setwd("/Users/macbook/Publications/15 Uganda HomePlants/R/heatmap")

#Create a dataset for demonstration purposes
prob_matrix=replicate(100, rnorm(20))
Garden_names=paste("Garden",letters[1:20],sep="_")
Plant_ids=paste("Plant",c(1:100),sep="_")
rownames(prob_matrix)=Garden_names
colnames(prob_matrix)=Plant_ids

#Create fake color side bars
Gardenclass_colors=sample(c("darkorchid","darkred"), length(Garden_names), replace = TRUE, prob = NULL)
Gardencategory_colors=sample(c("green","darkgreen"), length(Garden_names), replace = TRUE, prob = NULL)
subtype_colors=sample(c("red","blue","cyan","pink","yellow","green"), length(Plant_ids), replace = TRUE, prob = NULL)
Mcolors=sample(c("black","white","grey"), length(Plant_ids), replace = TRUE, prob = NULL)
Ncolors=sample(c("black","white","grey"), length(Plant_ids), replace = TRUE, prob = NULL)
Tcolors=sample(c("black","white","grey"), length(Plant_ids), replace = TRUE, prob = NULL)
HER2colors=sample(c("black","white","grey"), length(Plant_ids), replace = TRUE, prob = NULL)
PRcolors=sample(c("black","white","grey"), length(Plant_ids), replace = TRUE, prob = NULL)
ERcolors=sample(c("black","white","grey"), length(Plant_ids), replace = TRUE, prob = NULL)
rlab=t(cbind(Gardenclass_colors,Gardencategory_colors))
clab=cbind(subtype_colors,Mcolors,Ncolors,Tcolors,HER2colors,PRcolors,ERcolors)
rownames(rlab)=c("Class","Category")
colnames(clab)=c("Subtype","M","N","T","HER2","PR","ER")

#Define custom dist and hclust functions for use with heatmaps
mydist=function(c) {dist(c,method="euclidian")}
myclust=function(c) {hclust(c,method="average")}

#Create heatmap using custom heatmap.3 source code loaded above
pdf(file="heatmap3_example.pdf")
main_title="Garden Response Predictions"
par(cex.main=1)
heatmap.3(prob_matrix, hclustfun=myclust, distfun=mydist, na.rm = TRUE, scale="none", dendrogram="both", margins=c(6,12),
          Rowv=TRUE, Colv=TRUE, ColSideColors=clab, RowSideColors=rlab, symbreaks=FALSE, key=TRUE, symkey=FALSE,
          density.info="none", trace="none", main=main_title, labCol=FALSE, labRow=Garden_names, cexRow=1, col=rev(heat.colors(75)),
          ColSideColorsSize=7, RowSideColorsSize=2, KeyValueName="Prob. Response")
legend("topright",legend=c("Ornamental","Perennial","Annual","Shrub","Tree","Grass","","Poor(0)","Fair(1)","Good(2)","","Female","Male","","Subsistence","Tomato"),
       fill=c("red","blue","cyan","pink","yellow","green","white","black","white","grey","white","darkorchid","darkred","white","green","darkgreen"), border=FALSE, bty="n", y.intersp = 0.7, cex=0.7)
dev.off()

