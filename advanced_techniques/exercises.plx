#!/usr/local/bin/perl

use strict;
use warnings;
use utf8;
use List::Util;
use v5.24;

# exercise 1
=pod
{
	my $filename = 'examples.plx';
	open my $fh, '<', $filename;
	my @lines = <$fh>;
	while (1) {
		print "please input a pattern for match:\n";
		chomp(my $pattern = <STDIN>);
		if ($pattern =~ /^$/) {
			last;
		}
		my $pattern_regex = qr/$pattern/;
		eval {
			my @matched_lines = grep { $_ =~ /$pattern_regex/ } @lines;
			my $matched_count = @matched_lines;
			print "there are $matched_count lines matched your pattern: $pattern\n";
			if ($matched_count) {
				print "The matched lines are:\n";
				print @matched_lines;
			}
		};
		print "There are some error in your pattern: $@\n" if $@;
		say "";
	}
}
=cut

# exercise 2
=pod
{
	foreach (glob "*") {
		my ($access_time, $modification_time) = (stat($_))[8, 9];
		printf "%-30s\t%20d\t%20d\n", $_, $access_time, $modification_time;
	}
}
=cut

# exercise 3
#=pod
{
	sub epoch2ymd {
		my ($year, $month, $day) = (localtime($_[0]))[5, 4, 3];
		return ($year + 1900, $month + 1, $day);
	}

	foreach (glob "*") {
		my ($access_time, $modification_time) = (stat($_))[8, 9];
		printf "%-30s\t%04d-%02d-%02d\t%04d-%02d-%02d\n", $_,  epoch2ymd($access_time), epoch2ymd($modification_time);
	}
}
#=cut

# exercise 3, another method
=pod
{
	foreach my $file (glob '*') {
		my ($atime, $mtime) = map {
			my ($year, $month, $day) = (localtime($_))[5, 4, 3];
			$year += 1900;
			++$month;
			sprintf "%04d-%02d-%02d", $year, $month, $day;
		} (stat $file)[8, 9];

		printf "%-30s\t%20s\t%20s\n", $file, $atime, $mtime;
	}
}
=cut

# exercise 3, more simple method
=pod
{
	use POSIX qw(strftime);

	foreach my $file (glob '*') {
		my ($atime, $mtime) = map {
			strftime('%Y-%m-%d', localtime($_));
		} (stat $file)[8, 9];

		printf "%-30s\t%20s\t%20s\n", $file, $atime, $mtime;
	}
}
=cut

