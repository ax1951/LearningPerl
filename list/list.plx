#!/usr/local/bin/perl 
# Copyright (C) 2018 by Yours Truly
# Author: kotomi

#use diagnostics;
#use warnings;
use Math::Trig;
use utf8;

$fred[0] = "yabba";
$fred[1] = "dabba";
$fred[2] = "doo";

print "\$fred[0] is $fred[0]\n";
print "\$fred[1] is $fred[1]\n";
print "\$fred[2] is $fred[2]\n";

$number = 2.71828;
print "\$fred[$number - 1] is $fred[$number - 1]" . "\n"; # same as printing $fred[1]]

$blank = $fred[142_857]; # unused array element gives undef
$blanc = $mel; # unused scalar $mel also gives undef

print "\$blank = " . $blank . "\n";
print "\$blanc = " . $blanc . "\n";

$rocks[0] = 'bedrock';
$rocks[1] = 'slate';
$rocks[2] = 'lava';
$rocks[3] = 'crushed rock';
$rocks[99] = 'schist'; # now there are 95 undef elements


$end = $#rocks;
$number_of_rocks = $end + 1;
$rocks[ $#rocks ] = 'hard rock';

print "\$end is: $end\n";
print "\$number_of_rocks is $number_of_rocks\n";
print "\$rocks[$#rocks] is $rocks[$#rocks]\n";

@rocks2 = qw{ flintstone slate rubble };
print "quartz @rocks2 limestone\n";

print "Three rocks are: @rocks2.\n"; 
print "There's nothing in the parens (@empty) here.\n";

print "\n\n";
@fred2 = qw(eating rocks is wrong); 
$fred2 = "right"; # we are trying to say "this is right[3]"
print "this is $fred2[3]\n"; # prints "wrong" using $fred2[3]
print "this is ${fred2}[3]\n"; # prints "right" (protected by braces)
print "this is $fred2"."[3]\n"; # right again (different string)
print "this is $fred2\[3]\n"; # right again (backslash hides it)

foreach $rock (qw/ bedrock slate lava /) { 
    print "One rock is $rock.\n"; # Prints names of three rocks 
}

@rocks = qw/ bedrock slate lava /; foreach $rock (@rocks) {
	$rock = "\t$rock"; # put a tab in front of each element of @rocks
	$rock .= "\n"; # put a newline on the end of each 
}
print "The rocks are:\n", @rocks; # Each one is indented, on its own line

foreach (1..10) { # Uses $_ by default 
    print "I can count to $_!\n"; 
}

$_ = "Yabba dabba doo\n"; 
print; # prints $_ by default


# reverse operator
print "\n\n";
@fred = 6..10;
@barney = reverse (@fred);
@wilma = reverse 6..10;
@fred = reverse @fred;

print "\@fred is @fred\n";

# sort operator
print "\n\n";
@rocks = qw/bedrock slate rubble granite/;
print "\@rocks is @rocks\n";

@sorted = sort @rocks; # gets bedrock granite rubble slate
print "\@sorted is @sorted\n";

@back = reverse sort @rocks; # get from slate to bedrock
print "\@back is @back\n";

@rocks = sort @rocks; # puts sorted result back into @rocks
print "\@rocks is @rocks\n";

@numbers = sort 97..102; # gets 100, 101, 102, 97, 98, 99
print "\@numbers is @numbers\n";

#scalar and list context
print "\n\n";
@people = qw( fred barney betty);
print "\@people = @people\n"; 

@sorted = sort @people;
print "\@sorted = @sorted\n";

$number = @people + 42;
print "\$number = $number\n";



print "\n\n";
@backwards = reverse qw/ yabba dabba doo /; # gives doo, dabba, yabba
print "\@backwards = @backwards\n";
$backwards = reverse qw/ yabba dabba doo /; # gives oodabbadabbay
print "\$backwards = $backwards";


# using scalar-producing expressions in list context
print "\n\n";
@fred = 6 * 7;
print "\@fred is @fred\n";

@barney = "hello" . ' ' . "world";
print "\@barney is @barney\n";

@wilma = undef;
print "\@wilma is @wilma\n";

@betty = ();
print "\@betty is @betty\n";


# <STDIN> in list context
print "\n\n";
print "please input some lines:\n";
@lines = <STDIN>; # read standard input in list context

print "\@lines = @lines\n";
