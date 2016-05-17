
x <- read.table("../results/Rofe-vs-Ctl_cpm_normalized_counts.txt", sep="\t", header=TRUE)

fold_changes <- data.frame(x[,1],log2(rowMeans(x[,2:9])/rowMeans(x[,10:17])))

write.table(fold_changes, "../results/Rofe-vs-Ctl_CPM_FC.txt", sep="\t", quote=FALSE)

