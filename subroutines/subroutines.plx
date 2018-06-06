#!/usr/local/bin/perl 
# Copyright (C) 2018 by Yours Truly
# Author: kotomi

#use diagnostics;
#use warnings;
use Math::Trig;
use utf8;
use strict;

my $n = 0;

sub marine {
	$n += 1;
	print "hello sailor number $n!\n";
}

&marine;
&marine;

# return value of sub
my $fred = 3; 
my $barney = 4; 
sub sum_of_fred_and_barney { 
	print "Hey, you called the sum_of_fred_and_barney subroutine!\n"; 
	$fred + $barney; # That's the return value 
}

my $wilma = &sum_of_fred_and_barney; # $wilma gets 7 
print "\$wilma is $wilma.\n"; 

my $betty = 3 * &sum_of_fred_and_barney; # $betty gets 21 
print "\$betty is $betty.\n";

# a better max
sub max {
	print "arguments are: @_\n";
	print "number of arguments is ", $#_ + 1,  "\n";
	my $max_so_far = shift @_;
	foreach (@_) {
		if ($_ > $max_so_far) {
			$max_so_far = $_;
		}
	}
	$max_so_far;
}

my $maximum = &max(3, 5, 10, 4, 6);
print "the maximum of (3, 5, 10, 4, 6) is $maximum\n";

# lexical variables
foreach (1..10) {
	my($square) = $_ * $_; # private variable in this loop 
	print "$_ squared is $square.\n";
}

# the return operator
my @names = qw/ fred barney betty dino wilma pebbles bamm-bamm /; 
my $result = &which_element_is("dino", @names); 
sub which_element_is { 
	my($what, @array) = @_; 
	foreach (0..$#array) { # indices of @array's elements 
		if ($what eq $array[$_]) { 
			return $_; # return early once found
		} 
	}
	-1;  # element not found (return is optional here)
}
print "\$result = $result\n";

use 5.010; 
sub marine2 { 
    state $n = 0; # private, persistent variable $n 
    $n += 1; 
    print "Hello, sailor number $n!\n"; 
}

&marine2;
&marine2;

#state @array = qw(a b c); # Error!


