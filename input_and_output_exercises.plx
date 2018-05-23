#!/usr/local/bin/perl
use utf8;
use strict;
use warnings;
use 5.010;

# uncomment the specific exercise to get it run

# exercise 1
# traditional method
=for comment

sub reverse_output {
	my $filename = shift;
	my $fh;
	if (!open($fh, "$filename")) {
		die "Cannot open $filename: $!";
	}
	print reverse <$fh>;
}

while (@ARGV > 0) {
	my $last_file = pop @ARGV;
	&reverse_output($last_file);
}

=cut

# A simple and better way
#print reverse <>;

# exercise 2
=for comment

say "Please input some strings on saparate lines, then press Ctrl+D:";
my @lines = <STDIN>;
say "1234567890" x 5;
printf("%21s" x @lines, @lines);

=cut

#exercise 3
#=for comment
say "Please input column width first, then some strings on saparate lines, then press Ctrl+D:";
my $column_width = <STDIN> + 1;
my $ruler = "1234567890";
my $times = $column_width / length($ruler) + 1;

my @lines = <STDIN>;
say $ruler x $times;
printf("%${column_width}s" x @lines, @lines);

#=cut

