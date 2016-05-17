from chdir import chdir

# The example.txt is a gene expression file. In the file there are a control 
# group of 20 replicates and an experiment group of 6 replicates. This script 
# shows how to calculate the characteristic direction vector from the data
# using the chdir module.

# Author: Qiaonan Duan
# Ma'ayan Lab, Icahn School of Medicine at Mount Sinai
# Oct. 15, 2013
#

#filename = '../chdir_R/ER_Study1_Min_Norm-gene-counts_Cele-vs-Rofe.txt'
#filename = '../data/ER_Study1_Min_Norm-gene-counts_Rofe-vs-Ctl.txt'
filename = '../results/ER_Study1_Min_Norm-gene-counts_Rofe-vs-Ctl_cpm_normalized_counts.txt'
#filename = '../chdir_R/ER_Study1_Min_Norm-gene-counts_Cele-vs-Ctl.txt'
#filename = 'ER_Study1_Min_Norm-gene-counts_Rofe-vs-Ctl_noconstants.txt'
#filename = 'ER_Study1_Min_Norm-gene-counts_Cele-vs-Ctl_noconstants.txt'
#filename = 'ER_Study1_Min_Norm-gene-counts_Cele-vs-Rofe_noconstants.txt'

with open(filename) as nf:
	header = next(nf).rstrip('\r\n').split('\t')
	header = header[1:]
	ctrlIdx = [i for i in range(len(header)) if header[i]=='0']
	expIdx = [i for i in range(len(header)) if header[i]=='1']
	assert((len(ctrlIdx)+len(expIdx))==len(header))
	#next(nf) #skip 2nd line

	identifiers = []
	ctrlMat = []
	expMat = []
	for line in nf:
		words = line.rstrip('\r\n').split('\t')
		identifiers.append(words[0])
		values = words[1:]
		ctrlMat.append([float(values[i]) for i in ctrlIdx])
		expMat.append([float(values[i]) for i in expIdx])
		#if all(i==0 for i in ctrlMat):
		#	ctrlMat.remove(line)

chdirVector = chdir(ctrlMat,expMat,identifiers,1)
#f = open('ER_Study1_Min_Norm-gene-counts_Cele-vs-Rofe_Ch-dir.txt','w')
f = open('../results/ER_Study1_Min_Norm-gene-counts_Rofe-vs-Ctl_cpms_Ch-dir.txt','w')
#f = open('ER_Study1_Min_Norm-gene-counts_Cele-vs-Ctl_Ch-dir.txt', 'w')
#f = open('ER_Study1_Min_Norm-gene-counts_Rofe-vs-Ctl_noconstants_Ch-dir.txt','w')
#f = open('ER_Study1_Min_Norm-gene-counts_Cele-vs-Ctl_noconstants_Ch-dir.txt','w')
#f = open('ER_Study1_Min_Norm-gene-counts_Cele-vs-Rofe_noconstants_Ch-dir.txt','w')

for i in chdirVector:
	f.write('\t'.join(str(s) for s in reversed(i)) + '\n')
#print chdirVector

