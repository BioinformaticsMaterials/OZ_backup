#!/usr/bin/perl -w
use strict;

die usage() unless @ARGV ==3;
my ($blast8, $seq, $cut) = @ARGV;
open SEQ, $seq or die "$!";
$/="\n>";
my %rec_seq;
while(<SEQ>){
    chomp;
    my ($id, $seq) = split(/\n/, $_, 2);
    $rec_seq{$id} = $seq;
}
close SEQ;

$/ = "\n";
my %rec_id;
open M8, $blast8 or die "$!";
while(<M8>){
    chomp;
    my ($queryId, $subjectId, $percIdentity, $alnLength, $mismatchCount, $gapOpenCount, $queryStart, $queryEnd, $subjectStart, $subjectEnd, $eVal, $bitScore) = split(/\t/);
    if($eVal < $cut && $subjectId !~ /Arabidopsis_thaliana/){
        print ">$subjectId\n$rec_seq{$subjectId}\n" if !exists $rec_id{$subjectId};
        $rec_id{$subjectId} ++;
    }
}
close M8;

sub usage{
    my $die =<<DIE;
perl $0 <blast8> <seq> <e value cutoff>
DIE
}

