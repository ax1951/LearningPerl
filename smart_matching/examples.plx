#!/usr/local/bin/perl

use v5.24;
use strict;
use warnings;
use utf8;
use List::Util qw[min max];
no warnings 'experimental::smartmatch';

# the smart match operator
{
	# these 2 are the same
	my $name = 'Fredx';
	print "I found Fred in the name!\n" if $name =~ /Fred/;
	say "I found Fred in the name!" if $name ~~ /Fred/;

	my %names = ('Fredx' => 1, 'Barney' => 2,);
	my $flag = 0;
	foreach my $key ( keys %names ) {
		next unless $key =~ /Fred/; 
		$flag = $key;
		last;
	}
	print "I found a key matching 'Fred'. It was $flag\n" if $flag;
	say "";

	say "I found a key matching 'Fred'" if %names ~~ /Fred/;
	say "";

	my @names1 = qw (a b c);
	my @names2 = qw (a b c);
	say "The arrays have the same elements!" if @names1 ~~ @names2;
	say "";

	my @nums = qw(1 2 3 27 42); 
	my $result = max(@nums);
	print "result = $result, @nums\n";
	say "42 is one of the input values (@nums)" if 1 ~~ @nums;

	say "The result [$result] is one of the input values (@nums)" if $result ~~ @nums;
	say "";
}

# given-when
{
	$ARGV[0] = 'Fredx';
	given( $ARGV[0] ) {
		when( $_ ~~ /fred/i ) { say 'Name has fred in it'; continue; }
		when( $_ ~~ /^Fred/ ) { say 'Name starts with Fred'; continue; }
		when( $_ ~~ 'Fred' ) { say 'Name is Fred'; }
		default { say "I don't see a Fred"; }
	}
	say "\n";
	
	given( $ARGV[0] ) {
		when( /fred/i ) { #smart 
			say 'Name has fred in it'; continue } 
		when( $_ =~ /^Fred/ ) { #dumb
			say 'Name starts with Fred'; continue } 
		when( 'Fred' ) { #smart
			say 'Name is Fred' }
		default { say "I don't see a Fred" } 
	}
}

# foreach when
{
	my @names = qw(fred fredx AlFred Fred);
	foreach ( @names ) { # don't use a named variable!
		say "\nProcessing $_";
		
		when( /fred/i ) { say 'Name has fred in it'; continue } 
		when( /^Fred/ ) { say 'Name starts with Fred'; continue }   
		when( 'Fred' ) { say 'Name is Fred'; }
		say "Moving on to default...";
		default { say "I don't see a Fred" }
	}
}

