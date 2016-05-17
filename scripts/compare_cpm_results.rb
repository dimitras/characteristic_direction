require 'rubygems'
require 'csv'

genes_list = Hash.new {|h,k| h[k] = []}
CSV.foreach("../data/All_genes_ChDir_CPM.txt") do |row|
	(gene,coef,direction,fold_change) = row[0].split(" ")
	genes_list[gene][0] = coef
	genes_list[gene][1] = direction
	genes_list[gene][2] = fold_change
end

CSV.foreach("../results/Rofe-vs-Ctl_cpm_chdir.txt") do |row|
	(gene, direction) = row[0].split(" ")
	genes_list[gene][3] = direction
end

CSV.foreach("../chdir_python/results/ER_Study1_Min_Norm-gene-counts_Rofe-vs-Ctl_Ch-dir.txt") do |row|
        (gene, direction) = row[0].split(" ")
        genes_list[gene][4] = direction
end

CSV.foreach("../results/Rofe-vs-Ctl_CPM_FC_.txt") do |row|
        (gene, fc) = row[0].split(" ")
        genes_list[gene][5] = fc
end

#puts genes_list.inspect

CSV.open("../results/Rofe-vs-Ctl_cpm_chdir_comparison.csv", "wb") do |csv|
	csv << ["gene", "Avi's Rofe-vs-Ctl coefficient", "Avi's Rofe-vs-Ctl chdir", "Avi's Rofe-vs-Ctl log2(fold-change)", "CPM Rofe-vs-Ctl chdir", "Rofe-vs-Ctl chdir", "CPM Rofe-vs-Ctl log2(fold-change)"]
	genes_list.each_key do |gene|
		csv << [gene, genes_list[gene][0], genes_list[gene][1], genes_list[gene][2], genes_list[gene][3], genes_list[gene][4], genes_list[gene][5]]
	end
end	
