#!/usr/local/bin/perl

use strict;
use warnings;
use utf8;
use 5.010;

my $filename = "test1.txt";
# die "Oops! A file named '$filename' already exists.\n" if -e $filename;

$filename = "/Users/kotomi/.login"; 

# warn "Config file is looking pretty old!\n"  if -M $filename > 28;

=pod
if (-r $filename and -w _) {
	print "$filename is readable and writable\n";
}

if (-r -w $filename) {
	print "$filename is readable and writable\n";
}
=cut

# stat function
=pod
my($dev, $ino, $mode, $nlink, $uid, $gid, $rdev, $size, $atime, $mtime, $ctime, $blksize, $blocks) = stat($filename);
print "dev = $dev, ino = $ino, nlink = $nlink, uid = $uid, gid = $gid,
rdev = $rdev, size = $size, atime = $atime, mtime = $mtime,
ctime = $ctime, blksize = $blksize, blocks = $blocks\n";
=cut


# localtime function
my $timestamp = time;
my $date = localtime $timestamp;
print "date = $date\n";

my $now = gmtime;
print "now = $now\n";
