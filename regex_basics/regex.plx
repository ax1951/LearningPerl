#!/usr/local/bin/perl
# Copyright (C) 2018 by Yours Truly
# Author: kotomi

use utf8;
use strict;
use warnings;
use 5.010;

=for comment
$_ = "yabba dabba doo"; 
if (/abba/) {
	print "It matched!\n"; 
}
=cut

=for comment
$_ = "yabba dabba doo"; 
if (/y((.)(.)\3\2) d\1/) { 
    print "It matched!\n"; 
}
=cut

=pod
$_ = "aa11bb"; 
if (/(.)\g{1}11/) { 
    print "It matched!\n"; 
}
=cut

$_ = "aa11bb";
if (/(.)(.)\g{-1}11/) {
	print "It matched!\n"; 
}

