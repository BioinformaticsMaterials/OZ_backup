perl gener_cmd_modi_id_fungi.pl > ensembl_pep_nc_dd.fa &
perl gener_cmd_modi_id_hs.pl  > ensembl_pep_hs_sc.fa
cat ensemblgeno_plant_species.spec.fa  ensembl_pep_hs_sc.fa ensembl_pep_nc_dd.fa > ensemblgeno_species.spec10.fa


