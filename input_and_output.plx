#!/usr/local/bin/perl
use utf8;
use strict;
use warnings;
use 5.010;

=for comment
print "please input something and press Ctrl+D:\n";
while (defined(my $line = <STDIN>)) {
	print "I saw $line";
}
=cut

=for comment
print "please input something and press Ctrl+D:\n";
while (<STDIN>) {     
	print "I saw $_"; 
}
=cut

=for comment
print "please input something and press Ctrl+D:\n";
foreach (<STDIN>) {
	print "I saw $_";
}
=cut

=for comment
while (defined(my $line = <>)) { 
    chomp($line); 
    print "It was $line that I saw!\n"; 
}
=cut

=for comment
while (<>) { 
    chomp; 
    print "It was $_ that I saw!\n"; 
}
=cut

# output to standard output
my $name = "Larry Wall"; 
print "Hello there, $name, did you know that 3+4 is ", 3+4, "?\n";

=for comment
# calculate (2 + 3) * 4
print "(2 + 3) * 4 = ";
print ((2 + 3) * 4);
# print "", (2 + 3) * 4 # another way to do this
=cut

# file handles
=for comment
if (@ARGV < 2) {
	die "Not enough arguments\n";
}
=cut

=for comment
my $file = "abc.txt";
if (!open(my $passwd, $file)) {
	die "cannot open $file: ($!)";
}
=cut


# output with say
print "hello!\n";
say "hello!";

my @array = qw(a b c d);
say "print \@array result:";
print @array;
say "";

say "say  \@array result:";
say @array;
say "";

say 'print "@array" result:';
print "@array";
say "";

say 'say "@array" result:';
say "@array";
say "";



