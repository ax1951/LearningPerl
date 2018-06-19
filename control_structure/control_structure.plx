#!/usr/local/bin/perl
# Copyright (C) 2018 by Yours Truly
# Author: kotomi

use utf8;
use strict;
use warnings;
use 5.010;

# unless control structure
{
	my $fred = "3fred";
	unless ($fred =~ /^[A-Z_]\w*$/i) { 
		print "The value of \$fred doesn't look like a Perl identifier name.\n"; 
	}
	say "";
}

# unless else
{
	my $mon = "February";
	unless ($mon =~ /^Feb/) { 
		print "This month has at least thirty days.\n"; 
	} else { 
		print "Do you see what's going on here?\n"; 
	}
	say "";
}

# the until control structure
{
	my $j = 1;
	my $i = 1024;
	until ($j > $i) { 
		$j *= 2; 
	}
	say "j = $j\n";
}

# expression modifiers
{
	my $n = -13;
	print "$n is a negative number.\n" if $n < 0;
	say "";
}

# the elsif clause
{
	my $dino = "123";
	if ( ! defined $dino) { 
		print "The value is undef.\n"; 
	} elsif ($dino =~ /^-?\d+\.?$/) { 
		print "The value is an integer.\n"; 
	} elsif ($dino =~ /^-?\d*\.\d+$/) { 
		print "The value is a _simple_ floating-point number.\n"; 
	} elsif ($dino eq '') { 
		print "The value is the empty string.\n"; 
	} else { 
		print "The value is the string '$dino'.\n"; 
	}
	say "";
}

# auto increment and auto decrement
{
	my $num = 10;
	$num--;
	say "num = $num";
	$num++;
	say "num = $num";
	say "";
}

# the value of autoincrement
{
	my $m = 5; 
	say "m = $m";

	my $n = ++$m; # increment $m to 6, and put that value into $n
	say "n = $n";

	my $c = --$m; # decrement $m to 5, and put that value into $c
	say "c = $c";

	my $d = $m++; # $d gets the old value (5), then increment $m to 6 
	say "d = $d";

	my $e = $m--; # $e gets the old value (6), then decrement $m to 5
	say "e = $e";
	
	my @people = qw{ fred barney bamm-bamm wilma dino barney betty pebbles }; 
	my %seen; 
	foreach (@people) { 
		print "I've seen you somewhere before, $_!\n" 
		if $seen{$_}++; 
	}
	say "";
}

# last operator
=pod
{
	# Print all input lines mentioning fred, until the __END__ marker 
	while (<STDIN>) { 
		if (/__END__/) { 
			# No more input on or after this marker line 
			last; 
		} elsif (/fred/) { 
			print; 
		} 
	} 
	say "";
}
=cut

# next operator
=pod
{
	# Analyze words in the input file or files 
	my %count;
	my $total = 0;
	my $valid = 0;
	while (<>) { 
		foreach (split) { # break $_ into words, assign each to $_ in turn 
			$total++;
			next if /\W/; # strange words skip the remainder of the loop 
			$valid++; 
			$count{$_}++; # count each separate word ## next comes here ## 
		} 
	}

	print "total things = $total, valid words = $valid\n"; 
	foreach my $word (sort keys %count) { 
		print "$word was seen $count{$word} times.\n"; 
	}
	say "";
}
=cut

# the redo operator
=pod
{
	foreach (1..10) { 
		print "Iteration number $_.\n\n"; 
		print "Please choose: last, next, redo, or none of the above? "; 

		chomp(my $choice = <STDIN>); 
		print "\n"; 

		last if $choice =~ /last/i; 
		next if $choice =~ /next/i; 
		redo if $choice =~ /redo/i; 

		print "That wasn't any of the choices... onward!\n\n"; 
	} 
	print "That's all, folks!\n";
	say "";
}
=cut

# the logical or operator
my %last_name = ("john" => "Smith", "taylor" => 0);
my $someone = "john";
my $kotomi = $last_name{$someone} || '(No last name)';

say "kotomi's last name is: $kotomi";

$someone = "taylor";
$kotomi = $last_name{$someone} || '(No last name)';
say "kotomi's last name is: $kotomi";

# the defined-or operator
my $name;
printf "%s\n", $name // '';

