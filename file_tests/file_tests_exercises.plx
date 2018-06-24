#!/usr/local/bin/perl

use warnings;
use strict;
use 5.010;
use utf8;

# exercise 1
=pod
sub check_file_attributes {
	my $filename = shift;
	if (!(-e $filename)) {
		say "$filename doesn't exist!";
		return;
	}
	say "$filename exists.";

	printf "$filename %s readable.\n", (-r $filename) ? "is" : "isn't";
	printf "$filename %s writable.\n", (-w _) ? "is" : "isn't";
	printf "$filename %s executable.\n", (-x _) ? "is" : "isn't";

	print "\n";
}

chomp(my @filenames = @ARGV);
foreach my $filename (@filenames) {
	check_file_attributes($filename);
}
=cut

# exercise 2
=pod
sub report_access_age {
	my $filename = shift;
	die "$filename doesn't exist!\n" if (!(-e $filename));

	return (-M $filename);
}

chomp(my @filenames = @ARGV);
die "No filename provided" if (@filenames < 1);

my ($oldest_age, $oldest_filename) = (-10000000, undef);
foreach my $filename (@filenames) {
	my $age = report_access_age($filename);
	if ($age > $oldest_age) {
		$oldest_age = $age;
		$oldest_filename = $filename;
	}
}
print "oldest file is $oldest_filename, the age is $oldest_age days.\n";
=cut

# exercise 3
=pod
chomp(my @filenames = @ARGV);
die "No filename provided.\n" if (@filenames < 1);

foreach my $filename (@filenames) {
	if (-o -r -w $filename) {
		print "The file $filename is owned by me, and readable, writable.\n";
	}
}
=cut
