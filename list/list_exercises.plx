#!/usr/local/bin/perl 
# Copyright (C) 2018 by Yours Truly
# Author: kotomi

#use diagnostics;
#use warnings;
use Math::Trig;
use utf8;

#exercise 1
=for comment
print "please input some lines:\n";
chomp(@lines = <STDIN>);
@lines = reverse @lines;
print "\@lines = @lines\n";
=cut

# A simple and better way
print "please input some lines:\n";
print reverse <STDIN>;


#exercise 2
print "\n\n";
@names = qw/ undef fred betty barney dino wilma pebbles bamn-bamn/;
print "please input a series of numbers that fall within 1-7(one for each line):\n";
chomp(@numbers = <STDIN>);
foreach (@numbers)
{
	if (!($_ >= 1 && $_ <= 7))
	{
		print "your input number $_ doesn't fall within 1-7\n";
		next;
	}
	print "$names[$_]\n";
}

#exercise 3
print sort <STDIN>;
