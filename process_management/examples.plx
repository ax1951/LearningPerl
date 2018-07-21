#!/usr/local/bin/perl

use warnings;
use strict;
use utf8;
use IPC::System::Simple qw(system);
use v5.24;

# the system function
=pod
{
	system "date";
	system 'ls -l $HOME';
	system 'for i in *; do echo == $i ==; cat $i; done'
}
=cut

# avoid the shell
{
	system 'ls', '-l';
}

# the exec function
=pod
{
	exec "date";
	die "date couldn't run: $!";
}
=cut

# using backquotes to capture output
sub output_hash {
	my %hash= %{$_[0]};
	print "( ";
	foreach my $key (keys %hash) {
		print "$key => ", $hash{$key} // "undef", ", ";
	}
	print ")\n";
}

=pod
{
	my $now = `date`;
	print "The time is now $now\n";

	my @functions = qw{ int rand sleep length hex eof not exit sqrt umask }; 
	my %about;
	foreach (@functions) {
		$about{$_} = qx(perldoc -t -f $_); 
	}
	output_hash(\%about);
}
=cut

# using backquotes in a list context
=pod
{
	my %ttys;
	foreach (`who`) {
		my($user, $tty, $date) = /(\S+)\s+(\S+)\s+(.*)/; 
		$ttys{$user} .= "$tty at $date\n";
	}
	output_hash(\%ttys);
}
=cut

# external processes wit IPC::System::Simple
=pod
{
	system 'tar', 'cvf', "example.tar", "examples.plx";
}
=cut

# processes as file handles
=pod
{
	open my $date_fh, '-|', 'date' or die "cannot pipe from date: $!"; 
	my $now = <$date_fh>;
	print "now is $now";

	open my $mail_fh, '|-', 'mail merlyn' or die "cannot pipe to mail: $!";
	print $mail_fh "The time is now $now"; # presume $now ends in newline

	close $mail_fh;
	die "mail: non-zero exit of $?" if $?;

	open my $find_fh, '-|',
    'find', qw( /Users/kotomi -atime +90 -size +1000000 -print )
        or die "fork: $!";
        
	while (<$find_fh>) { 
		chomp;
		printf "%s size %dK last accessed %.2f days ago\n", $_, (1023 + -s $_)/1024, -A $_;
	}
}
=cut

# low level functions
=pod
{
	defined(my $pid = fork) or die "Cannot fork: $!"; 
	unless ($pid) {
		# Child process is here 
		exec 'date';
		die "cannot exec date: $!";
	}
	# Parent process is here 
	waitpid($pid, 0);
}
=cut

# sending and receiving signals
{
	say "\n";
	my $int_count = 0;
	sub my_int_handler { 
		$int_count++ 
	} 

	$SIG{'INT'} = 'my_int_handler'; 
	#...;
	open SOMEFILE, "<", "examples.plx";
	my $line_num = 0;
	while (<SOMEFILE>) {
		#...; # some processing that takes a few seconds ... 
		my $sum = 0;
		for (my $i = 0; $i < 10_000_000; ++$i)
		{
			$sum += $i;
		}

		++$line_num;
		if ($int_count) {
			# interrupt was seen!
			print "line number: $line_num. [processing interrupted...]\n"; 
			last;
		} 
	}
}

