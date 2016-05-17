
x <- read.table("../results/Rofe-vs-Ctl_cpm_chdir_comparison.csv", sep=",", header=TRUE)

png("../results/fc.png")

plot(x[,6], x[,3], xlab="my CPM log2(fold-change)", ylab="Avi's log2(fold-change)", pch=19)

dev.off()

