#!/usr/local/bin/perl

#use diagnostics;
use strict;
use warnings;
use utf8;
use 5.010;

# index function
{
	my $stuff = "Howdy world!";
	my $where = index($stuff, "wor");
	say "index of 'wor' is $where.";

	my $where1 = index($stuff, "w"); # $where1 gets 2
	say "index of w is $where1";

	my $where2 = index($stuff, "w", $where1 + 1);  # $where2 gets 6
	printf "index of w starting at %d is %d\n", $where1 + 1, $where2;

	my $where3 = index($stuff, "w", $where2 + 1); # $where3 gets −1 (not found)
	printf "index of w starting at %d is %d\n", $where2 + 1, $where3;
	
	say "";
}

# rindex function
{
	my $last_slash = rindex("/etc/passwd", "/"); # value is 4
	say "the position of last slash is $last_slash";

	my $fred = "Yabba dabba doo!";
	my $where1 = rindex($fred, "abba"); # $where1 gets 7
	printf "rindex of abba is %d\n", $where1;

	my $where2 = rindex($fred, "abba", $where1 - 1); # $where2 gets 1
	printf "rindex of abba is %d\n", $where2;

	my $where3 = rindex($fred, "abba", $where2 - 1); # $where3 gets −1
	printf "rindex of abba is %d\n", $where3;

	say "";
}

# substr function
{
	my $mineral = substr("Fred J. Flintstone", 8, 5); # gets "Flint" 
	say "mineral = $mineral";

	my $rock = substr "Fred J. Flintstone", 13, 1000; # gets "stone"
	say "rock = $rock";

	my $pebble = substr "Fred J. Flintstone", 13; # gets "stone"
	say "pebble = $pebble";

	my $out = substr("some very long string", -3, 2); # $out gets "in"
	say "out = $out";

	my $string = "Hello, world!";
	#substr($string, 0, 5) = "Goodbye"; # $string is now "Goodbye, world!"
	#say "now string = $string";

	my $previous_value = substr($string, 0, 5, "Goodbye");
	say "now string = $string, previous_value = $previous_value";

	say "";
}

# sprintf function
{
	sub big_money {
		my $number = sprintf "%.2f", shift @_;

		# Add one comma each time through the do-nothing loop 1 
		1 while ($number =~ s/^(-?\d+)(\d\d\d)/$1,$2/);

		# Put the dollar sign in the right place
		$number =~ s/^(-?)/$1\$/;
		$number;
	}

	my $money = 123456789.233;
	printf "money = %s\n", big_money($money);

	$money = -123456789.233;
	printf "money = %s\n", big_money($money);
	say "";
}

# advanced sorting
{
	my @array = (1, 9, 3, 7, 5);
	print "@array\n";

	sub by_number {
		# a sort subroutine, expect $a and $b
		if ($a < $b) { -1 } elsif ($a > $b) { 1 } else { 0 }
	}

	# more simple form
	#sub by_number { $a <=> $b }
	#@array = sort { $a <=> $b } @array;

	@array = sort by_number @array;
	print "@array\n";
}

# sort hash by value
sub output_hash {
	my %hash= %{$_[0]};
	print "( ";
	foreach my $key (keys %hash) {
		print "$key => ", $hash{$key} // "undef", ", ";
	}
	print ")\n";
}

{
	my %score = ("barney" => 195, "fred" => 205, "dino" => 30);
	output_hash(\%score);

	sub by_score { $score{$b} <=> $score{$a} }

	my @sorted_score = sort by_score keys %score;
	print "@sorted_score\n";
	say "";
}

# sorting by multiple keys
{
	my %score = (
		"barney" => 195, "fred" => 205,
		"dino" => 30, "bamm-bamm" => 195,
	);
	output_hash(\%score);

	my @winners = sort by_score_and_name keys %score;
	print "@winners\n";

	sub by_score_and_name {
		$score{$b} <=> $score{$a} # by descending numeric score
		or
		$a cmp $b # ASCIIbetically by name
	}
}

