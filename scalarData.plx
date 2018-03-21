#!/usr/local/bin/perl 
#use diagnostics;
#use warnings;
use Math::Trig;
use utf8;

$a = 10;
$b = 8;

print '"12" * "3" is ' . "12" * "3" . "\n";
print '"12fred34" * "3" is ' . "12fred34" * "3" . "\n";

if ($a > $b) {
	print "\n" . '$a is greater than $b' . "\n";
}
else{
   print "\n" . '$a is less than $b' . "\n";
}

print "please input radius of a circle:";
chomp($r = <STDIN>);
if ($r < 0){
	print "circle is 0" . "\n";
}
else{
	print "circle is ", $r * 2 * pi . "\n";
}

$man = undef;

print "\nplease input something:";
$line = <STDIN>;
if ($line eq "\n"){
   print "input was just a blank line\n";
}
else{
   print "input was: $line\n";

}


print "\nplease input something:";
$madonna = <STDIN>;
if (defined($madonna)){
   print "input was: $madonna\n";
}
else{
   print "input was nothing\n";
}


