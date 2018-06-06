#!/usr/local/bin/perl 
# Copyright (C) 2018 by Yours Truly
# Author: kotomi

#use diagnostics;
#use warnings;
use Math::Trig;
use utf8;
use 5.010;

# exercise 1
=pod
my $what = "fred|barney";
$text = "fred" x 3;
if ($text =~ /($what){3}/) {
	print "pattern matched\n";
}
=cut

# exercise 2
# usage: ./regex_exercises.plx regex_ex2.txt
=pod
if (@ARGV != 1) {
	die "usage: $0 regex_ex2.txt";
}
my $input_filename = shift @ARGV;
my $output_filename = $input_filename;
$output_filename =~ s/(.+)[.].+/$1.out/;

# we can combine read and write together
open (my $in, "<", $input_filename) or die "cannot open $input_filename: $!";
open (my $out, ">", $output_filename) or die "cannot open $output_filename with write permission! $!";
while (<$in>) {
	s/fred/Larry/ig;
	print $out $_;
}
close $in;
close $out;
=cut

# exercise 3
#=pod
if (@ARGV != 1) {
	die "usage: $0 regex_ex3.txt";
}
my $input_filename = shift @ARGV;
my $output_filename = $input_filename;
$output_filename =~ s/(.+)[.].+/$1.out/;

open (my $in, "<", $input_filename) or die "cannot open $input_filename: $!";
open (my $out, ">", $output_filename) or die "cannot open $output_filename with write permission! $!";
while (<$in>) {
	chomp;
	s/fred/\n/ig;
	s/wilma/Fred/ig;
	s/\n/Wilma/g;
	print $out "$_\n";
}
close $in;
close $out;
#=cut

# exercise 4
# usage: ./regex_application/regex_exercises.plx $(git ls-files | grep "plx")
=pod
my $copyright = "# Copyright (C) 2018 by Yours Truly\n# Author: kotomi\n\n";

$^I = "";

while (<>) {
	s%(^[#]!/usr/local/bin/perl.*\n)%$1$copyright%;
	print;
}
=cut
