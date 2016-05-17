require 'rubygems'
require 'csv'

genes_list = Hash.new {|h,k| h[k] = []}
CSV.foreach("ER_Study1_Min_Norm-gene-counts_Cele-vs-Rofe_Ch-dir.txt") do |row|
	(gene,direction) = row[0].split(" ")
	genes_list[gene][0] = direction
end

CSV.foreach("ER_Study1_Min_Norm-gene-counts_Cele-vs-Rofe_noconstants_Ch-dir.txt") do |row|
        (gene, direction) = row[0].split(" ")
        genes_list[gene][1] = direction
end

CSV.foreach("ER_Study1_Min_Norm-gene-counts_Rofe-vs-Ctl_Ch-dir.txt") do |row|
	(gene, direction) = row[0].split(" ")
	genes_list[gene][2] = direction
end

CSV.foreach("ER_Study1_Min_Norm-gene-counts_Rofe-vs-Ctl_noconstants_Ch-dir.txt") do |row|
        (gene, direction) = row[0].split(" ")
        genes_list[gene][3] = direction
end

CSV.foreach("ER_Study1_Min_Norm-gene-counts_Cele-vs-Ctl_Ch-dir.txt") do |row|
	(gene, direction) = row[0].split(" ")
	genes_list[gene][4] = direction
end

CSV.foreach("ER_Study1_Min_Norm-gene-counts_Cele-vs-Ctl_noconstants_Ch-dir.txt") do |row|
        (gene, direction) = row[0].split(" ")
        genes_list[gene][5] = direction
end

puts genes_list.inspect

CSV.open("ER_Study1_Min_Norm-gene-counts_Ch-dir_all.csv", "wb") do |csv|
	csv << ["gene", "Cele-vs-Rofe", "Cele-vs-Rofe-noconstants", "Rofe-vs-Ctl", "Rofe-vs-Ctl-noconstants", "Cele-vs-Ctl", "Cele-vs-Ctl-noconstants"]
	genes_list.each_key do |gene|
		csv << [gene, genes_list[gene][0], genes_list[gene][1], genes_list[gene][2], genes_list[gene][3], genes_list[gene][4], genes_list[gene][5]]
	end
end	
