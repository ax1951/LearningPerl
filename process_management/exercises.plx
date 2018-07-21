#!/usr/local/bin/perl

use v5.24;
use utf8;
use warnings;
use strict;
use Cwd qw(cwd);
use File::Spec::Functions 'catfile';

# exercise 1
=pod
{
	my $dest = "/Users/kotomi";
	chdir $dest or die "chdir to $dest failed: $!";
	system 'ls -l';
}
=cut

# exercise 2
=pod
{
	my $current_dir = cwd;
	my $stdout = catfile($current_dir, "ls.out");
	my $stderr = catfile($current_dir, "ls.err");
	
	my $dest = "/Users/kotomi";
	chdir $dest or die "chdir to $dest failed: $!";
	system "ls -l > $stdout 2> $stderr";

}
=cut

#another way to do this: redirect stdout and stderr
=pod
{
	open STDOUT, '>', 'ls.out' or die "Can't write to ls.out: $!";
	open STDERR, '>', 'ls.err' or die "Can't write to ls.err: $!";
	chdir '/' or die "Can't chdir to root directory: $!";
	exec 'ls', '-l' or die "Can't exec ls: $!";
}
=cut

# exercise 3
=pod
{
	sub is_weekday {
		my $day = shift;
		return (($day eq "Mon") || ($day eq "Tues") || ($day eq "Wed") || ($day eq "Thurs") || ($day eq "Fri"));
	}

	my $date = `date`;
	my @arr = (split ' ', $date);
	my $day = shift  @arr;
	if (is_weekday($day)) {
		print "get to work.\n";
	} else {
		print "go play.\n";
	}
}
=cut
# another way to do it
=pod
{
	if (`date` =~ /\AS/) { 
		print "go play!\n";
	} else {
		print "get to work!\n"; 
	}
}
=cut

# exercise 4
{
	use 5.010;
	sub my_hup_handler { state $n; say 'Caught HUP: ', ++$n }
	sub my_usr1_handler { state $n; say 'Caught USR1: ', ++$n }
	sub my_usr2_handler { state $n; say 'Caught USR2: ', ++$n }
	sub my_usr2_handler { say 'Caught INT. Exiting.'; exit }
	say "I am $$";
	foreach my $signal ( qw(int hup usr1 usr2) ) {
		$SIG{ uc $signal } = "my_${signal}_handler"; 
	}
	while(1) { 
		sleep 1 
	};
}


