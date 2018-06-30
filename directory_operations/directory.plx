#!/usr/local/bin/perl

use utf8;
use warnings;
use strict;
use 5.010;

# chdir
=pod
{
	my $dir = "/etc";
	chdir $dir or die "cannot chdir to $dir: $!";
}
=cut

# glob
=pod
{
	my @all_files = glob "* .*";
	#my @all_files = <* .*>;
	print "@all_files\n";
}
=cut

# directory handle
=pod
{
	my $dir_to_process = "/etc";
	opendir DH, $dir_to_process or die "Cannot open $dir_to_process: $!"; 
	foreach my $file (readdir DH) {
		print "one file in $dir_to_process is $file\n"; 
	}
	closedir DH;
}
=cut

# remove files
=pod
{
	my $num_of_sucessful_deleted_files = unlink glob "*.txt";
	print "number of successful deleted files is $num_of_sucessful_deleted_files\n";
}
=cut

# rename files
=pod
{
	rename "old.txt", "new.txt";
}
=cut

# links and files
=pod
{
	#link "new.txt", "hello.txt";
	#symlink "new.txt", "symnew.txt";
	#unlink "symnew.txt";
	my $perl = readlink "/usr/local/bin/perl";
	say "perl is really: $perl";
}
=cut

# make and remove directories
=pod
{
	my $name = "fred";
	my $permissions = "0755";
	printf "permissions is %o\n", $permissions;
	printf "permissions is %o\n", oct($permissions);
}
=cut

# change ownership
=pod
{
	my $userId = getpwnam "kotomi";
	my $groupId = getgrnam "staff";
	say "user id = $userId, group id = $groupId";
	my $result = chown $userId, $groupId, "hello.txt";
	say "result = $result, error: $!";
}
=cut

# change time stamps
my $now = time;
say "now, time = $now";
my $localtime = localtime $now;
say "now, localtime = $localtime";

