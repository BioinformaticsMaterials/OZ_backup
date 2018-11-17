#!/bin/sh -l
#PBS -q standby
#PBS -l nodes=1:ppn=1
#PBS -l naccesspolicy=shared
#PBS -l walltime=4:00:00
#PBS -N mcu
#PBS -o run_step2_blast_mcu.out
#PBS -e run_step2_blast_mcu.err
cd $PBS_O_WORKDIR
#/group/bioinfo/apps/apps/blast-2.2.22/bin/formatdb -p T -i ensemblgeno_species.spec10.fa

/group/bioinfo/apps/apps/blast-2.2.22/bin/blastall -m 8 -d ensemblgeno_species.spec10.fa -i mcu_list.fasta -p blastp -o mcu_blastp2spec10.m8 
perl extra_mcu_homo_blast8.pl mcu_blastp2spec10.m8 ensemblgeno_species.spec10.fa 0.000001 > mcu_blastp2spec10_E5.fa

cat mcu_list.fasta mcu_blastp2spec10_E5.fa > mcu_blastp2spec10_E5_mcu.fa
module load clustalw
clustalw2 -infile=mcu_blastp2spec10_E5_mcu.fa -type=protein -matrix=pam -outfile=mcu_blastp2spec10_E5_mcu.aln -outorder=input
clustalw2 -infile=mcu_blastp2spec10_E5_mcu.fa -tree -type=protein -outfile=mcu_blastp2spec10_E5_mcu.ph


