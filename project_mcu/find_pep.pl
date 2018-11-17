#!/usr/bin/perl -w
use strict;

my ($pep, $list) = @ARGV;

$/ = "\n>";
open PEP, $pep or die "$!";
while(<PEP>){
    chomp;
    my ($id, $seq) = split(/\n/, $_);
    
}
$/ = "\n";

open LIST, $list or die "$!";
while(<LIST>){
    chomp;
    #>AT1G51370.2 | Symbols:  | F-box/RNI-like/FBD-like domains-containing protein | chr1:19045615-19046748 FORWARD LENGTH=346
    my ()
}
