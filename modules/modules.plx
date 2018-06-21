#!/usr/local/bin/perl
# Copyright (C) 2018 by Yours Truly
# Author: kotomi

use utf8;
use strict;
use warnings;
use 5.010;
use File::Basename;

# The File::Basename Module
my $name = "/usr/local/bin/perl";
my $basename = basename $name;
say "basename = $basename";

