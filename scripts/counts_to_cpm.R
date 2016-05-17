#options(max.print=1000000)

library(edgeR)

x <- read.table("../data/ER_Study1_Min_Norm-gene-counts_Rofe-vs-Ctl.txt", sep="\t", header=TRUE)

genes <- data.frame(x[,1])
x <- x[,-1]

group <- factor(c(0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1))
y <- DGEList(counts=x,group=group)
cpms = cpm(y)

cpms_per_genes <- cbind(genes, cpms)

write.table(cpms_per_genes, "../results/Rofe-vs-Ctl_cpm_normalized_counts.txt", sep="\t", row.names=FALSE, col.names=FALSE, quote=FALSE)

