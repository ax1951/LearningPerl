#!/usr/local/bin/perl

use warnings;
use strict;
use utf8;
use v5.24;

# slices
=pod
{
	my $filename = 'examples.plx';
	my $mtime = (stat $filename)[9];
	my $readable_time = localtime $mtime;
	print "i can get modified time of '$filename' by slice feature, the modified time is: $readable_time\n";
	say "";

	#my $data = "name:age:sex:company:address:phone";
	my $data = "Bob:27:male:Google:New York:0123456789";
	#my $age = (split /:/, $data)[1];
	#my $phone = (split /:/, $data)[5];
	my ($age, $phone) = (split /:/, $data)[1, 5];
	print "age: $age, phone: $phone\n";
	say "";

	my @persons = qw (Alice Bob John Ray);
	my ($first, $last) = (sort @persons)[0, -1];
	print "first person: $first, last person: $last\n";
	say "";

	my @names = qw{ zero one two three four five six seven eight nine }; 
	my @numbers = ( @names )[ 9, 0, 2, 1, 0 ];
	print "Bedrock @numbers\n"; # says Bedrock nine zero two one zero
	say "";
}
=cut

# Array Slice
=pod
{
	my @names = qw{ zero one two three four five six seven eight nine }; 
	# a simpler slice form(omit the parentheses around @names)
	my @numbers = @names[ 9, 0, 2, 1, 0 ];

	# interpolating slices
	print "Bedrock @names[ 9, 0, 2, 1, 0 ]\n";
	say "";

	# update array
	my $data = "Bob:27:Male:Google:New York:0123456789";
	my @items = split /:/, $data;
	my $new_name = 'Alice';
	my $new_sex = 'Female';
	@items[0, 2] = ($new_name, $new_sex);
	print "@items\n";
	say "";
}
=cut

# Hash Slice
=pod
{
	my %score = ( "barney" => 98, "fred" => 87, "dino" => 92 );
	my @three_scores = ($score{"barney"}, $score{"fred"}, $score{"dino"});
	my @three_scores2 = @score{ qw / barney fred dino/ };
	print "three scores are: @three_scores\n";
	print "three scores are: @three_scores2\n";
	say "";

	my @players = qw / barney fred dino/;
	my @bowling_scores = (195, 205, 30);
	@score{ @players } = @bowling_scores; 

	print "Tonight's players were: @players\n";
	print "Their scores were: @score{@players}\n";
	say "";
}
=cut

# trapping errors
=pod
{
	my $divisor = 10;
	my $dividend = 0;
	my $result = eval { $divisor / $dividend } // 'NaN';
	print "I couldn't divide by $dividend: $@" if $@;

	unless ( eval { $divisor / $dividend }) {
		print "I couldn't divide by $dividend: $@" if $@;
	}

	{
		say "";
		local $@; # don't stomp on higher level errors
		my $unexpected = 0;
		my ($barney, $fred, $dino) = (undef, 10, 0);
		eval { 
			#...;
			die "An unexpected exception message" if $unexpected; 
			die "Bad denominator" if $dino == 0;
			$barney = $fred / $dino;
		};

		if ( $@ =~ /unexpected/ ) { 
			#...;
		}
		elsif( $@ =~ /denominator/ ) {
			print "encounter Bad denominator\n";
		} 
	}
	say "";
}
=cut

# autodie
=pod
{
	use autodie;
	my $filename = 'tmp.txt';

	open my $fh, '>', $filename;
	given ($@) {
		when (undef) {
			say "No error";
		}
		when ('open') {
			say "Error from open";
		}
		when (':io') {
			say "Non-open, IO error.";
		}
		when (':all') {
			say "All other autodie errors.";
		}
		default {
			say "Not an autodie error at all";
		}
	}
	say "";
}
=cut

# Picking items from a List with grep
=pod
{
	my @odd_numbers = grep { $_ % 2} 1..10;
	print "odd numbers are: @odd_numbers\n";
	say "";

	open my $fh, '<', "examples.plx";
	my @matching_lines = grep /\buse\b/i, <$fh>;
	print "matching lines are:\n";
	print @matching_lines;
	close $fh;
	say "";


	open my $fh, '<', "examples.plx";
	my $line_count = grep /\buse\b/i, <$fh>;
	print "line count: $line_count\n";
	close $fh;
	say "";
}
=cut

# Transforming items from a list with map
{
	sub big_money {
		my $number = sprintf "%.2f", shift @_;

		# Add one comma each time through the do-nothing loop 1 
		1 while ($number =~ s/^(-?\d+)(\d\d\d)/$1,$2/);

		# Put the dollar sign in the right place
		$number =~ s/^(-?)/$1\$/;
		$number;
	}

	my @data = (4.75, 1.5, 2, 1234, 6.9456, 12345678.9, 29.95); 
=pod
	my @formatted_data;
	foreach (@data) {
		push @formatted_data, &big_money($_);
	}
=cut
=pod
	my @formatted_data = map { big_money($_) } @data;
	print "@formatted_data\n";
	say "";
=cut
	#=pod
	print "The money numbers are:\n", map { sprintf("%25s\n", big_money($_)) } @data;
	say "";

	print "Some powers of two are:\n", map "\t" . (2 ** $_) . "\n", 0..15;
	say "";
	#=cut
}

# List utilities
{
	use List::Util qw(first sum  max min maxstr shuffle none any all);

	$ARGV[0] = 'examples.plx';
	my @lines = <>;
	my $first_match = first { /\bdata\b/i } @lines;
	print "first match:\n $first_match\n";

	my $total = sum(1..100);
	print "total of 1..100 is: $total\n";

	my $max = max(1, 2, 3, 4, 5);
	print "max value is: $max\n";

	my @strings = qw (number string bool arrray hash reference);
	my $maxstr = maxstr(@strings);
	print "max string is: $maxstr\n";

	my @numbers = shuffle(1..10);
	print "shuffled numbers are: @numbers\n";

	my @numbers2 = shuffle(1..10);
	print "shuffled numbers are: @numbers2\n";

	if (none { $_ > 10 } @numbers) {
		print "No elements over 10\n";
	}
	elsif (any { $_ > 5 } @numbers) {
		print "Some elements over 5\n";
	}
	elsif (all { $_ < 10 } @numbers) {
		print "All elements are less than 10\n";
	}
	say "";

	use List::MoreUtils qw(natatime mesh);
	my @array = @numbers;
	my $iterator = natatime 3, @array; 
	while( my @triad = $iterator->() ) {
		print "Got @triad\n"; 
	}

	my @abc = 'a' .. 'z';
	my @numbers3 = 1 .. 20;
	my @dinosaurs = qw( dino );
	my @large_array = mesh @abc, @numbers3, @dinosaurs;
	@large_array = grep { defined } @large_array;
	my $count = @large_array;
	print "array count = $count\n";
	print "large array is:\n@large_array\n";
	say "";
}

