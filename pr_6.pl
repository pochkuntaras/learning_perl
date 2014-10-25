#!/usr/bin/perl

use warnings;
use strict;

# autor Taras Pochkun

# Practice 6

# There are several arrays, each element of which is a word.
# Create a function which finds the longest word from each
# given array and returns the result as a list. References#
# to arrays should be passed as arguments to the function.

my @arr0 = ('strong', 'free', 'kaktus');
my @arr1 = ('Masha', 'Petya', 'elka', 'Senya', 'Taras');
my @arr2 = ('New York', 'Kiev', 'Moskow', 'Chicago');

sub getLongWords {
   my @arr;
   for(@_) {
      push(my @temp, '');
      for(@{$_}) {
         if(length $temp[0] < length $_) {
            undef @temp;
            push(@temp, $_);
         } elsif (length $temp[0] == length $_) {
            push(@temp, $_);
         }
      }
      push(@arr, \@temp);
  }
  return @arr;
}

for(getLongWords(\@arr0, \@arr1, \@arr2)) {
   print "$_ " for(@{$_});
   print "\n";
}
