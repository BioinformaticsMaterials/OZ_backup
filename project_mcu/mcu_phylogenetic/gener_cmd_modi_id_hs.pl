#!/usr/bin/perl -w
use strict;


my @fa = </scratch/conte/x/xie186/OmarZayed/project_mcu/mcu_phylogenetic/ftp.ensembl.org/pub/release-80/fasta/*/pep/*.all.fa.gz>;
foreach(@fa){
    my ($name) = (split(/\//, $_))[-1];
    $name =~ s/\.gz//g;
    my ($spec) = split(/\./, $name);
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
  
