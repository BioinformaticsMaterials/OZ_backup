perl /scratch/conte/x/xie186/perl_scripts_lab/find_pep_MCU.pl /scratch/conte/x/xie186/data/ara/Proteins/TAIR10_protein_lists/TAIR10_pep_20101214 mcu_list.txt > mcu_list.fasta

/group/bioinfo/apps/apps/blast-2.2.22/bin/blastall -d /scratch/conte/x/xie186/XingangWang/ana_phylo/ftp.ncbi.nih.gov/blast/db/nr -i prot_56_seq.fa -p blastp  -o prot56_to_nrdb

