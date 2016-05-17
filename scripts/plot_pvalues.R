
x <- read.table("../results/Rofe-vs-Ctl_cpm_chdir_comparison.csv", sep=",", header=TRUE)

logged_pvalues <- log2(x[,4])
avi_logged_pvalues <- log2(x[,2])

png("../results/pvalues.png")

plot(logged_pvalues, avi_logged_pvalues, xlab="my CPM log2(p-value)", ylab="Avi's log2(p-value)", pch=19)

dev.off()

