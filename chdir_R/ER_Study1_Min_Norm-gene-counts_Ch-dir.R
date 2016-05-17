source('chdir.R')
source('nipals.R')

# data <- read.table('test.txt',sep="\t")
#data <- read.table('ER_Study1_Min_Norm-gene-counts_Cele-vs-Rofe.txt',sep="\t")
data <- read.table('ER_Study1_Min_Norm-gene-counts_Rofe-vs-Ctl.txt',sep="\t")
#data <- read.table('ER_Study1_Min_Norm-gene-counts_Cele-vs-Ctl.txt',sep="\t")

# options(max.print=1000000)
# data

header <- as.list(data[1,2:dim(data)[2]])
genes <- as.vector(data[,1])[2:dim(data)[1]]
mat <- as.matrix(data[2:dim(data)[1],2:dim(data)[2]])

ctrlMat <- mat[,header==0]
expmMat <- mat[,header==1]

unitV <- chdir(ctrlMat,expmMat,genes)

out <- capture.output(unitV)
#cat("Cele vs Rofe", out, file="ER_Study1_Min_Norm-gene-counts_Cele-vs-Rofe_Ch-dir.txt", sep="\n", append=TRUE)
cat("Rofe vs Ctl", out, file="ER_Study1_Min_Norm-gene-counts_Rofe-vs-Ctl_Ch-dir.txt", sep="\n", append=TRUE)
# cat("Cele vs Ctl", out, file="ER_Study1_Min_Norm-gene-counts_Cele-vs-Ctl_Ch-dir.txt", sep="\n", append=TRUE)
