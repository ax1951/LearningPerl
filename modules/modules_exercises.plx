#!/usr/local/bin/perl

use warnings;
use utf8;
use strict;
use 5.010;
use Module::CoreList ();

sub output_hash {
	my %hash= %{$_[0]};
	print "(\n";
	foreach my $key (keys %hash) {
		print "$key => ", $hash{$key} // "undef", "\n";
	}
	print ")\n";
}

my %modules = %{ $Module::CoreList::version{5.008} };

output_hash(\%modules);

