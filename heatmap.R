


#Create a dataset for demonstration purposes
prob_matrix=replicate(100, rnorm(20))
Garden_names=paste("Garden",letters[1:20],sep="_")
Plant_ids=paste("Plant",c(1:100),sep="_")
rownames(prob_matrix)=Garden_names
colnames(prob_matrix)=Plant_ids

#Create fake color side bars
GardenGender_colors=sample(c("darkorchid","darkred"), length(Garden_names), replace = TRUE, prob = NULL)
GardenEconomy_colors=sample(c("green","darkgreen"), length(Garden_names), replace = TRUE, prob = NULL)
subtype_colors=sample(c("red","blue","cyan","pink","yellow","green"), length(Plant_ids), replace = TRUE, prob = NULL)
Qualitycolors=sample(c("black","white","grey"), length(Plant_ids), replace = TRUE, prob = NULL)
Yieldcolors=sample(c("black","white","grey"), length(Plant_ids), replace = TRUE, prob = NULL)
Productioncolors=sample(c("black","white","grey"), length(Plant_ids), replace = TRUE, prob = NULL)
Usefulnesscolors=sample(c("black","white","grey"), length(Plant_ids), replace = TRUE, prob = NULL)
Importancecolors=sample(c("black","white","grey"), length(Plant_ids), replace = TRUE, prob = NULL)
NutritionContributioncolors=sample(c("black","white","grey"), length(Plant_ids), replace = TRUE, prob = NULL)
rlab=t(cbind(GardenGender_colors,GardenEconomy_colors))
clab=cbind(subtype_colors,Qualitycolors,Yieldcolors,Productioncolors,Usefulnesscolors,Importancecolors,NutritionContributioncolors)
rownames(rlab)=c("Gender","Economy")
colnames(clab)=c("Subtype","Quality","Yield","Production","Usefulness","Importance","NutritionContribution")

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
legend("topright",legend=c("Ornamental","Perennial","Annual","Shrub","Tree","Grass","","Poor (0)","Fair (1)","Good (2)","","Female","Male","","Subsistence","Sales"),
       fill=c("red","blue","cyan","pink","yellow","green","white","white","grey","black","white","darkorchid","darkred","white","green","darkgreen"), border=FALSE, bty="n", y.intersp = 0.7, cex=0.7)
dev.off()

