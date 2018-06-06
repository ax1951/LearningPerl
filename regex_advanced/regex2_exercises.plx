#!/usr/local/bin/perl
# Copyright (C) 2018 by Yours Truly
# Author: kotomi

use utf8;
use strict;
use warnings;
use 5.010;

# exercise 1
=pod
while (<>) { # take one input line at a time 
    chomp; 
    if (/match/) { 
        print "Matched: |$`<$&>$'|\n";
    } else { 
        print "No match: |$_|\n"; 
    } 
}
=cut

# exercise 2
=pod
while (<>) { # take one input line at a time 
    chomp; 
    if (/\b\w*a\b/) { # or simply /a\b/
        print "Matched: |$`<$&>$'|\n";
    } else { 
        print "No match: |$_|\n"; 
    } 
}
=cut

# exercise 3
=pod
while (<>) { # take one input line at a time 
    chomp; 
    if (/\b(\w*a)\b/) { 
        print "\$1 contains '$1'\n";
    } else { 
        print "No match: |$_|\n"; 
    } 
}
=cut

# exercise 4
=pod
while (<>) { # take one input line at a time 
    chomp; 
    if (/\b(?<word>\w*a)\b/) { 
        print "word contains '$+{word}'\n";
    } else { 
        print "No match: |$_|\n"; 
    } 
}
=cut

# exercise 5
=pod
while (<>) { # take one input line at a time 
    chomp; 
    if (/(\b\w*a\b)(.{0,5})/s) { 
        print "word contains '$1', next contains '$2'\n"; 
    } else { 
        print "No match: |$_|\n"; 
    } 
}
=cut

# exercise 6
=pod
while (<>) {
	chomp;
	if (/\s+$/) {
		print "$_!\n";
	} else {
		print "No Match!\n";
	}
}
=cut

