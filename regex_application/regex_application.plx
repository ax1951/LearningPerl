#!/usr/local/bin/perl
# Copyright (C) 2018 by Yours Truly
# Author: kotomi

# Copyright (C) 2018 by Yours Truly
# Author: kotomi


use utf8;
use strict;
use warnings;
use 5.010;

$_ = "He's out bowling with Barney tonight."; 
print "$_\n";

s/Barney/Fred/; # Replace Barney with Fred 
print "$_\n";

s/with (\w+)/against $1's team/;
print "$_\n"; # says "He's out bowling against Fred's team tonight."

$_ = "green scaly dinosaur";
say "$_";

s/(\w+) (\w+)/$2, $1/; # Now it's "scaly, green dinosaur"
say "$_";

s/^/huge, /; # Now it's "huge, scaly, green dinosaur"
say "$_";

s/,.*een//; # Empty replacement: Now it's "huge dinosaur"
say "$_";

s/green/red/; # Failed match: still "huge dinosaur"
say "$_";

s/\w+$/($`!)$&/; # Now it's "huge (huge !)dinosaur"
say "$_";

s/\s+(!\W+)/$1 /; # Now it's "huge (huge!) dinosaur"
say "$_";

s/huge/gigantic/; # Now it's "gigantic (huge!) dinosaur"
say "$_";

$_ = "fred flintstone"; 
if (s/fred/wilma/) { 
    print "Successfully replaced fred with wilma!\n"; 
}
say "";

# global replacements with /g
$_ = "home, sweet home!";
print "\$_ = $_\n";

s/home/cave/g;
print "$_\n"; # "cave, sweet cave!"

$_ = "  Input data\t may have extra whitespace.   "; 
print "\$_ =$_#\n";

s/\s+/ /g; # Now it says "Input data may have extra whitespace."
print "\$_ =$_#\n";

s/^\s+|\s+$//g; # Strip leading, trailing whitespace
print "\$_ =$_#\n";
say "";

# binding operator 
my $file_name = "/var/rpc/tmp.txt";
say "\$file_name =$file_name";

if ($file_name =~ s#^.*/##s){ # In $file_name, remove any Unix-style path
	print "now, \$file_name holds $file_name\n";
} 
say "";

# Case Shifting
my $example = "I saw Barney with Fred."; 
say "\$example =$example";

if ($example =~ s/(fred|barney)/\U$1/gi) { # $_ is now "I saw BARNEY with FRED."
	print "\$example =$example\n";
}
say "";

say "\$example =$example";
if ($example =~ s/(fred|barney)/\L$1/gi) { # $_ is now "I saw barney with fred."
	print "\$example =$example\n";
}
say "";

say "\$example =$example";
if ($example =~ s/(fred|barney)/\L$1/gi) { # $_ is now "I saw barney with fred."
	print "\$example =$example\n";
}
say "";

say "\$example =$example";
if ($example =~ s/(fred|barney)/\u$1/ig) { # $_ is now "I saw FRED with Barney."
	print "\$example =$example\n";
}
say "";

say "\$example =$example";
if ($example =~ s/(fred|barney)/\u\L$1/ig) { # $_ is now "I saw FRED with Barney."
	print "\$example =$example\n";
}
say "";

my $name = "kotomi";
print "Hello, \L\u$name\E, would you like to play a game?\n";
say "";

# the split operator
my $text = "abc:def:g:h";
say "\$text =$text";
my @fields = split /:/, $text; # gives ("abc", "def", "g", "h")
say "After split, \@fields =@fields\n";

# split with empty fields
$text = "abc:def::g:h";
say "\$text =$text";
@fields = split /:/, $text; # gives ("abc", "def", "", "g", "h")
say "After split, \@fields =@fields\n";

$text = ":::a:b:c:::";
say "\$text =$text";
@fields = split /:/, $text; # gives ("abc", "def", "", "g", "h")
say "After split, \@fields =@fields\n";

my $some_input = "This is a \t test."; 
say "\$some_input =$some_input";
my @args = split /\s+/, $some_input; # ("This", "is", "a", "test.")
say "After split, \@args =@args";
say "\n";

# the join function
my $x = join ":", 4, 6, 8, 10, 12; # $x is "4:6:8:10:12"
say "\$x =$x\n";

# m// in list context
$_ = "Hello there, neighbor!"; 
my($first, $second, $third) = /(\S+) (\S+), (\S+)/; 
print "$second is my $third\n";

my $text = "Fred dropped a 5 ton granite block on Mr. Slate"; 
my @words = ($text =~ /([a-z]+)/ig); 
print "Result: @words\n"; # Result: Fred dropped a ton granite block on Mr Slate

sub output_hash {
	my %hash= %{$_[0]};
	print "(";
	foreach my $key (keys %hash) {
		print "$key => ", $hash{$key} // "undef", ", ";
	}
	print ")\n";
}
my $data = "Barney Rubble Fred Flintstone Wilma Flintstone";
my %last_name = ($data =~ /(\w+)\s+(\w+)/g);
output_hash(\%last_name);
say "";

my $html_text = "I thought you said Fred and <BOLD>Velma</BOLD>, not <BOLD>Wilma</BOLD>";
print "text =$html_text\n";
print "now text =$html_text\n" if ($html_text =~ s#<BOLD>(.*?)</BOLD>#$1#g);


say "\n";
my $date = `date`;
print "date = $date\n";

say "";
my $time = localtime;
print "time = $time\n";

