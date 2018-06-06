#!/usr/local/bin/perl
use utf8;
use strict;
use warnings;
use 5.010;

# case-insensitive matching with /i
=pod
print "Would you like to play a game?";
chomp($_ = <STDIN>);
if (/yes/i) { # case insensitive match
    print "In that case, I recommend that you go bowling.\n";
}
=cut

# Matching Any Character with /s
$_ = "I saw Barney\ndown at the bowling alley\nwith Fred\nlast night.\n"; 
if (/Barney.*Fred/s) { 
    print "That string mentions Fred after Barney!\n"; 
}

# adding whitespace with /x
=pod
/-?\d+\.?\d*/ # what is this doing
/ -? \d+ \.? \d* /x # a little better

/
-?   # an optional minus sign
\d+  # one or more digits before the decimal point
\.?  # an optional decimal point
\d*  # some optional digits after the decimal point
/x   # end of string
=cut

# combine all the option modifiers
=pod
if (m{
    barney # the little guy
    .* # anything in between
    fred # the loud guy
    }six) { # all three of /s and /i and /x
    print "That String mentions Fred after Barney!\n";
}
=cut

# the binding operator =~
my $some_other = "I dream of betty rubble."; 
if ($some_other =~ /\brub/) { 
    print "Aye, there's the rub.\n"; 
}

=pod
print "Do you like Perl? ";
my $likes_perl = (<STDIN> =~ /\byes\b/i); 
if ($likes_perl) {
	print "You said earlier that you like Perl, so...\n";
}
=cut

# interpolating into patterns
=pod
my $what = "larry"; 
while (<>) { 
    if (/^($what)/) { # pattern is anchored at beginning of string 
        print "We saw $what in beginning of $_"; 
    } 
}
=cut
say "\n";

# match variables
$_ = "Hello there, neighbor"; 
if (/\s(\w+),/) { # memorize the word between space and comma 
    print "the word was $1\n"; # the word was there 
}

$_ = "Hello there, neighbor"; 
if (/(\S+) (\S+), (\S+)/) { 
    print "words were $1 $2 $3\n"; 
}
say "\n";


# non-capturing parentheses
my $food = "saurus steak";
if ($food =~ /(?:bronto)?saurus (steak|burger)/) { 
    print "Fred wants a $1\n"; 
}
say "\n";

# named captures
my $names = 'Fred or Barney'; 
if( $names =~ m/(?<name1>\w+) (and|or) (?<name2>\w+)/ ) { 
    say "I saw $+{name1} and $+{name2}"; 
}
say "\n";

# back reference
my $names = 'Fred Flinstone and Wilma Flinstone';
if( $names =~ m/(?<last_name>\w+) and \w+ \g{last_name}/ ) {
	say "I saw $+{last_name}";
}
say "\n";

# The Automatic Match Variables
my $text = "Hello there, neighbor";
say "text is:$text";
if ($text =~ /\s(\w+),/) { 
    print "That actually matched '$&'.\n"; 
}

if ($text =~ /\s(\w+),/) { 
    print "That was ($`)($&)($').\n"; 
}
say "\n";


