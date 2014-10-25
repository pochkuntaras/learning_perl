#! /usr/bin/perl

# autor Taras Pochkun

# TASK-1

# Write a script which counts words with length
# equal or more than 15 characters in /etc/dictionaries-
# common/words  dictionary and prints the count.

use strict;
use warnings;

open(my $file, "<", "./words") or die "Cannot open read file!";

my %count;
my $all = 0;

while(<$file>) {
   $count{length $_}++ if(length $_ >= 15);
}

for(sort keys %count) {
   $all += $count{$_};
   print "simbol : $_ count_words : $count{$_}\n";
}

print "\t[ ALL : $all ]\n";
