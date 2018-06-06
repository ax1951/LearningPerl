#!/usr/local/bin/perl
# Copyright (C) 2018 by Yours Truly
# Author: kotomi

use utf8;
use strict;
use warnings;
use 5.010;
use List::Util qw[min max];

# uncomment the =for comment and =cut line to run the exercises

# exercise 1
=for comment
my %family_name = ("fred" => "flintstone", "barney" => "rubble", "wilma" => "flintstone");
say "Well, there is a name=>family_name table, you can enter the name, and i'll give the family_name, press Ctrl+D to exit:";
while (<>) {
	chomp;
	if (exists $family_name{$_}) {
		say "the corresponding family_name for $_ is $family_name{$_}";
	} else {
		say "the name $_ doesn't exist";
	}
}
=cut

# exercise 2
=for comment
say "please input some words, each in one line, press Ctrl+D to exit:";
my %dictionary;

while (<>) {
	chomp;
	$dictionary{$_} += 1;
}

foreach my $key (sort keys %dictionary) {
	say "$key was seen $dictionary{$key} time(s)";
}
=cut

# exercise 3
=for comment
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
	printf($format, $key, $ENV{$key});
}
=cut

