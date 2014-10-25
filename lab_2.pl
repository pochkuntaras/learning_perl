#! /usr/bin/perl

# autor Taras Pochkun

# TASK-2

# Write a script which prints a number of polyndrom
# words in this dictionary ( polyndrom is a word
# that may be read the same way in either direction,
# e.g: civic, radar, level, rotor, kayak… ) 

use strict;
use warnings;

open(my $file, "<", "./words" )
or die "Cannot open file!";

my $pol;
my $lenstr;

while(<$file>) {
   chomp($_);
   $pol = "";
   $lenstr = length $_;
   
   if($lenstr > 1) {
      for(my $i = $lenstr; $i >= 0; $i--) {
         $pol = $pol.substr $_, $i, 1;
      }
   }
   
   print "Polindrome : $_\n" if($_ eq $pol);
}
