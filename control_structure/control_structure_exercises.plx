#!/usr/local/bin/perl
# Copyright (C) 2018 by Yours Truly
# Author: kotomi

use utf8;
use strict;
use warnings;
use 5.010;
use List::Util qw[max min];

# exercise 1
#=pod
my $magic_number = int(1 + rand 100);
#print "Don't tell anyone, but the secrect number is $secret.\n";

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
	if ($input_number == $magic_number) {
		say "you guess right!";
		last;
	}
	elsif ($input_number < $magic_number) {
		say "Too low";
	}
	else {
		say "Too high";
	}
}
#=cut

# exercise 2
=pod
my $Debug = $ENV{DEBUG} // 1;

my $secret = int(1 + rand 100);

print "Don't tell anyone, but the secrect number is $secret.\n" if $Debug;

# ... continue with exercise 1 code
=cut

# exercise 3
=pod
$ENV{ZERO} = 0;
$ENV{EMPTY} = '';
$ENV{UNDEFINED} = undef;

my $first_column_length = 0;
my $second_column_length = 0;

foreach my $key (keys %ENV) {
	$first_column_length = max($first_column_length, length($key));
	$second_column_length = max($second_column_length, length($ENV{$key}));
}

$first_column_length = min($first_column_length, 80);
$second_column_length = min($second_column_length, 80);

#say "\$first_column_length = $first_column_length, \$second_column_length = $second_column_length";

my $format = "%-${first_column_length}s %-${second_column_length}s\n";
printf($format, "key", "value");

foreach my $key (sort keys %ENV) {
	my $value = $ENV{$key} // 'undefined value';
	printf($format, $key, $value);
}
=cut
