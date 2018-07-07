#!/usr/local/bin/perl

use 5.010;
use strict;
use warnings;
use utf8;
use List::Util qw[min max];

# exercise 1
=pod
{
	my $magic_number = int(1 + rand 100);
	print "Don't tell anyone, but the secrect number is $magic_number.\n";

	say "Please guess a number between 1 and 100(type 'quit', 'exit' or 'ENTER' to quit):";
	while (<>) {
		chomp;
		# quit or not
		if ($_ eq "quit" || $_ eq "exit" || $_ =~ /^\s*$/) {
			last;
		}

		# check whether input is a valid number or not
		if (! (/^([ \f\t\]*)\d+([ \f\t]*)$/)) {
			say "Not a valid number!";
			next;
		}

		# convert input to an int, and check whether it is in range 1..100
		my $input_number = int($_);
		if ($input_number < 1 || $input_number > 100) {
			say "Not in range 1...100!";
			next;
		}

		# compare the input with the magic number
		given($input_number) {
			when($_ == $magic_number) {
				say "you guess right!";
				last;
			}
			when ($_ < $magic_number) {
				say "Too low";
			}
			when ($_ > $magic_number) {
				say "Too high";
			}
		}
	}
}
=cut

# exercise 2
=pod
{
	say "please input a number:";
	chomp(my $number = <STDIN>);
	given (int($number)) {
		when ($_ % 3 == 0) {
			say "Fizz";
			continue;
		}
		when ($_ % 5 == 0) {
			say "Bin";
			continue;
		}
		when ($_ % 7 == 0 ) {
			say "Sausage";
		}
	}
}
=cut

# exercise 3
=pod
{
	foreach (@ARGV) {
		say "Processing $_";
		when (-r) {
			say "$_ is readable.";
			continue;
		}
		when (-w) {
			say "$_ is writable.";
			continue;
		}
		when (-x) {
			say "$_ is executable.";
		}
	}
}
=cut

# exercise 4
=pod
{
	sub calc_divisors {
		my $number = shift;
		my @divisors = ();
		foreach my $divisor ( 2 .. $number/2 ) {
			push @divisors, $divisor unless $number % $divisor; 
		}
		return @divisors; 
	}

	given ($ARGV[0]) {
		# check whether input is a valid number or not
		when (! ($_ ~~ /^([ \f\t\]*)\d+([ \f\t]*)$/)) {
			die "Not a valid number!\n";
		}
		my @divisors = calc_divisors(int($_));
		when (@divisors < 1 && int($_) > 1) {
			print "$_ is a prime.\n"
		}
		when (@divisors >= 1) {
			print "divisors of $_ are:\n@divisors\n";
		}
	}
}
=cut

# exercise 5
#=pod
{
	sub calc_divisors {
		my $number = shift;
		my @divisors = ();
		foreach my $divisor ( 2 .. $number/2 ) {
			push @divisors, $divisor unless $number % $divisor; 
		}
		return @divisors; 
	}

	given ($ARGV[0]) {
		# check whether input is a valid number or not
		when (! ($_ ~~ /^([ \f\t\]*)\d+([ \f\t]*)$/)) {
			die "Not a valid number!\n";
		}
		when ($_ % 2) {
			print "$_ is odd.\n";
			continue;
		}
		when ($_ % 2 == 0) {
			print "$_ is even.\n";
			continue;
		}
		my @divisors = calc_divisors(int($_));

		when (@divisors < 1 and $_ > 1) {
			print "$_ is a prime.\n"
		}
		when (@divisors >= 1 ) {
			print "divisors of $_ are:\n@divisors\n";
		}
	}
}
#=cut
