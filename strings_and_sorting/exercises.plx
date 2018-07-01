#!/usr/local/bin/perl

use strict;
use warnings;
use utf8;
use 5.010;

# exercise 1
=pod
{
	sub max_width_in_list {
		my $result = 0;
		foreach my $num (@_) {
			my $length = length($num);
			if ($length > $result) {
				$result = $length;
			}
		}
		$result;
	}
	print "please input a list of numbers:\n";
	chomp(my @lines = <>);
	my @numbers = split ' ', (join " ", @lines);

	my $max_width = max_width_in_list(@numbers);
	@numbers = sort { $a <=> $b } @numbers;

	print "\nafter sorted:\n";
	foreach my $num (@numbers) {
		printf "%${max_width}s\n", $num;
	}

}
=cut

=pod
{
	# the simple answer
	my @numbers;
	push @numbers, split while <>;
	foreach (sort { $a <=> $b } @numbers) {
		printf "%20g\n", $_; 
	}
}
=cut

# exercise 2
=pod
{
	my %last_name = qw{ 
		fred flintstone Wilma Flintstone Barney Rubble
		betty rubble Bamm-Bamm Rubble PEBBLES FLINTSTONE
	};
	# first name, last name
	sub by_last_name_and_first_name {
		"\L$last_name{$a}" cmp "\L$last_name{$b}"
			or
		"\L$a" cmp "\L$b"
	}
	my @first_names = sort by_last_name_and_first_name keys %last_name;

	#output
	print "after sorting, hash is:\n(\n";
	foreach my $first_name (@first_names) {
		print "$first_name => $last_name{$first_name},\n";
	}
	print ")\n";
}
=cut

# exercise 3
=pod
{
	print "please input a string:\n";
	chomp(my $line = <STDIN>);
	print "please input a substring to find:\n";
	chomp(my $substring = <STDIN>);
	my $pos = -1;
	while (($pos = index($line, $substring, $pos + 1)) != -1) {
		printf "found '$substring' at postion: %d\n", $pos;
	}
}
=cut
