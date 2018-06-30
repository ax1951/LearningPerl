#!/usr/local/bin/perl

use utf8;
use strict;
use warnings;
use 5.010;
use File::Spec::Functions 'catfile';
use File::Basename;

# exercise 1
=pod
{
	say "please input a directory name:";
	chomp(my $name = <STDIN>);
	if ($name =~ /^\s*$/) {
		chdir or die "chdir failed.\n";
	}
	else {
		chdir $name or die "chdir to $name failed.\n";
	}
	foreach my $file (glob "*") {
		print "$file ";
	}
	say "";
}
=cut

# exercise 2
=pod
{
	say "please input a directory name:";
	chomp(my $name = <STDIN>);
	if ($name =~ /^\s*$/) {
		chdir or die "chdir failed.\n";
	}
	else {
		chdir $name or die "chdir to $name failed.\n";
	}
	foreach my $file (glob ".* *") {
		print "$file ";
	}
	say "";
}
=cut

# exercise 3
=pod
{
	say "please input a directory name:";
	chomp(my $name = <STDIN>);
	my $dir_name = $ENV{"HOME"};
	unless ($name =~ /^\s*$/) {
		$dir_name = $name;
	}
	chdir $dir_name or die "chdir to $dir_name failed.\n";

	opendir my $dir_handle, $dir_name or die "cannot open $dir_name.\n";
	my @files;
	foreach my $file (readdir $dir_handle) {
		push @files, $file;
	}
	foreach my $file (sort @files) {
		print "$file ";
	}
	say "";
}
=cut

# exercise 4
=pod
{
	unlink @ARGV;
}
=cut

# exercise 5
=pod
{
	my($first, $second) = @ARGV;
	if (-d $second) {
		$second = catfile($second, basename $first);
	}
	rename $first, $second or die "cannot rename $first to $second: $!\n";
}
=cut

# exercise 6
=pod
{
	my($first, $second) = @ARGV;
	if (-d $second) {
		$second = catfile($second, basename $first);
	}
	link $first, $second or die "cannot link $first to $second: $!\n";
}
=cut

# exercise 7
=pod
{
	use File::Basename;
	use File::Spec;

	my $symlink = $ARGV[0] eq '-s';
	shift @ARGV if $symlink;

	my($source, $dest) = @ARGV;
	if (-d $dest) {
		my $basename = basename $source;
		$dest = File::Spec->catfile($dest, $basename);
	}

	if ($symlink) {
		symlink $source, $dest
			or die "Can't make soft link from '$source' to '$dest': $!\n"; 
	} else {
		link $source, $dest
			or die "Can't make hard link from '$source' to '$dest': $!\n";
	}
}
=cut

# exercise 8
=pod
{
	foreach my $file (glob "*") {
		if (-l $file) {
			my $where = readlink $file;
			print "$file -> $where\n";
		}
	}
}
=cut
