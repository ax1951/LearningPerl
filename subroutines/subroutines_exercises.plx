#!/usr/local/bin/perl 
# Copyright (C) 2018 by Yours Truly
# Author: kotomi

#use diagnostics;
#use warnings;
use Math::Trig;
use utf8;
use strict;
use v5.10;

#exercise 1
#=for comment

sub total {
	my $sum = 0;
	foreach (@_) {
		$sum += $_;
	}
	$sum;
}

my @fred = qw{ 1 3 5 7 9 };
my $fred_total = total(@fred);
print "The total of \@fred is $fred_total.\n";

print "Enter some numbers on separate lines: ";
my $user_total = total(<STDIN>);
print "The total of those numbers is $user_total.\n";
print "\n\n";

#exercise 2
my $sum_of_1_to_1000 = total(1..1000);
print "\$sum_of_1_to_1000 = $sum_of_1_to_1000\n";
print "\n\n";

#=cut

#exercise 3
sub average {
	my $mean = 0;
	foreach (@_) {
		$mean += $_;
	}
	$mean /= @_;
}

sub above_average {
	my $mean = &average(@_);
	my @result;
	foreach (@_) {
		if ($_ > $mean) {
			push @result, $_;
		}
	}
	@result;
}

my @fred = &above_average(1..10);
print "\@fred is @fred\n";
print "(Should be 6 7 8 9 10)\n";

my @barney = above_average(100, 1..10); 
print "\@barney is @barney\n";
print "(Should be just 100)\n";
print "\n\n";

#exercise 4
sub greet {
	state $last_name = undef;
	if ($last_name eq undef) {
		print "Hi $_[0]! You are the first one here!\n";
	} else {
		print "Hi $_[0]! $last_name is also here!\n";
	}
	$last_name = $_[0];
}

greet("Fred");
greet("Barney");
print "\n\n";

#exercise 5
sub greet2 {
	state $last_names = undef;
	if ($last_names eq undef) {
		print "Hi $_[0]! You are the first one here!\n";
	} else {
		print "Hi $_[0]! I've seen: $last_names\n";
	}
	if ($last_names ne undef) {
		$last_names .= " ";
	}
	$last_names .= $_[0];
}

greet2( "Fred" ); 
greet2( "Barney" ); 
greet2( "Wilma" ); 
greet2( "Betty" );
print "\n\n";
