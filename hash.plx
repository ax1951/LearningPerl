#!/usr/local/bin/perl
use utf8;
use strict;
use warnings;
use 5.010;

sub output_hash {
	my %hash= %{$_[0]};
	print "( ";
	foreach my $key (keys %hash) {
		print "$key => ", $hash{$key} // "undef", ", ";
	}
	print ")\n";
}

sub output_array {
	my @array = @_;
	print "@array\n";
}

# first example

my %some_hash = ("foo", 35, "bar", 12.4, 2.5, "hello", "wilma", 1.72e30, "betty", "bye\n");
&output_hash(\%some_hash);

# reverse hash
my %reverse_hash = %some_hash;
&output_hash(\%reverse_hash);

# big arrow
my %last_name = ( # a hash may be a lexical variable 
	"fred" => "flintstone", 
	"dino" => undef, 
	"barney" => "rubble", 
	"betty" => "rubble", 
);
&output_hash(\%last_name);
say "\n";


my %hash = ("a" => 1, "b" => 2, "c" => 3); 
say "hash is:";
output_hash(\%hash);

my @k = keys %hash; 
say "keys are:";
output_array(@k);

say "values are:";
my @v = values %hash;
output_array(@v);


if (%hash) { 
    print "That was a true value!\n"; 
}

# each function
say "\n\neach function example:";
while ( my ($key, $value) = each %hash ) { 
    print "$key => $value\n"; 
}

# exists function
say "\n\nexists function example:";
if (exists $hash{"c"}) { 
    print "Hey, there's a key named 'c'!\n"; 
}

# delete function
say "\n\ndelete function example:";
my %books = ("betty" => 2, "barney" => 4, "rock" => 1);
output_hash(\%books);
my $person = "betty"; 
delete $books{$person}; # Revoke the library card for $person}
output_hash(\%books);

# iterate through the hash
say "\n\niterate through the hash:";
foreach $person (sort keys %books) { # each patron, in order
	if ($books{$person}) { 
		print "$person has $books{$person} items\n";  # fred has 3 items 
	} 
}

# ENV hash
print "\nPATH is $ENV{PATH}\n";

