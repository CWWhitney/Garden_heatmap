#This code creates a simple clustered heatmap. 

#If not already installed
#install.packages("gplots")
#install.packages("devtools")

#Load necessary packages
library("gplots")
library("devtools")

#Load latest version of the heatmap.3 function
source_url("https://raw.githubusercontent.com/obigriffith/biostar-tutorials/master/Heatmaps/heatmap.3.R")

#Example with fewer prarmeters
mat <- matrix(1:100, byrow=T, nrow=10)
column_annotation <- sample(c("red", "blue", "green"), 10, replace=T)
column_annotation <- as.matrix(column_annotation)
colnames(column_annotation) <- c("Variable X")

row_annotation <- sample(c("red", "blue", "green"), 10, replace=T)
row_annotation <- as.matrix(t(row_annotation))
rownames(row_annotation) <- c("Variable Y")

heatmap.3(mat, RowSideColors=row_annotation, ColSideColors=column_annotation)

#Cor's file from Github 