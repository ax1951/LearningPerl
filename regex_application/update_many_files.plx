#!/usr/local/bin/perl -w 
use strict; 

# usage: ./update_many_files.plx fred*.dat

chomp(my $date = `date`); 
$^I = ".bak"; 
while (<>) { 
    s/^Author:.*/Author: Randal L. Schwartz/; 
    s/^Phone:.*\n//; 
    s/^Date:.*/Date: $date/; 
    print; 
}

