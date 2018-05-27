#!/usr/local/bin/perl
use utf8;
use strict;
use warnings;
use 5.010;

# exercise 1
=pod
say "exercise 1:";
chomp(my @lines = <>);
foreach my $line (@lines) {
	if ($line =~ /fred/) {
		say $line;
	}
}

# a more simple way
while (<>) {
	if (/fred/) {
		print;
	}
}
=cut

# exercise 2
=pod
say "exercise 2:";
chomp(my @lines = <>);
foreach my $line (@lines) {
	if ($line =~ /[fF]red/) {
		say $line;
	}
}
=cut

# exercise 3
=pod
say "exercise 3:";
chomp(my @lines = <>);
foreach my $line (@lines) {
	if ($line =~ /[.]/) {
		say $line;
	}
}
=cut

# exercise 4
=pod
say "exercise 4:";
chomp(my @lines = <>);
foreach my $line (@lines) {
	if ($line =~ /[A-Z][a-z]+/) {
		say $line;
	}
}
=cut

# exercise 5
=pod
say "exercise 5:";
chomp(my @lines = <>);
foreach my $line (@lines) {
	if ($line =~ /(\S)\1/) {
		say $line;
	}
}
=cut

# exercise 6
=pod
say "exercise 6:";
chomp(my @lines = <>);
foreach my $line (@lines) {
	if ($line =~ /(wilma.*fred|fred.*wilma)/) {
		say $line;
	}
}
=cut

