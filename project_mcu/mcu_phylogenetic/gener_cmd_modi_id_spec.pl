#!/usr/bin/perl -w
use strict;

my @fa = </scratch/conte/x/xie186/data/ensembl_db/ftp.ensemblgenomes.org/pub/plants/release-25/fasta/*/pep/*.all.fa.gz>;
foreach(@fa){
    if ((/Zea_mays/ || /Sorghum_bicolor/ || /Populus_trichocarpa/ || /Oryza_sativa/ || /Brassica_rapa/ || /Glycine_max/)){
        my ($name) = (split(/\//, $_))[-1];
        $name =~ s/\.gz//g;
        my ($spec) = split(/\./, $name);
        #'Zea_mays\|Sorghum_bicolor\|Populus_trichocarpa\|Oryza_sativa\|Brassica_rapa\|Glycine_max'
        open FA, "zcat $_|" or die "$!";
        while(my $line = <FA>){
            chomp $line;
            if($line =~ />/){
                my ($id)=split(/\s+/, $line);
                print "$id\_$spec\n";
            }else{
                print "$line\n";
            }
        }
    }
}
  
