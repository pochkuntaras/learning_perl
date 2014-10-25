#! /usr/bin/perl

# autor Taras Pochkun

# Practice 2

# Create a console utility which can get a text input via pipe or by 
# pointing a filename(s) as input argument(s). This program finds out 
# which symbols appear the most and the less number of times. An output
# should contain the symbol and the number of times it appears. A special
# newline symbol should (if printed to output) be labeled as '\n' instead
# of a real newline.

use warnings;
use strict;

our %hash;
our @arr;

while(<>) {
   $hash{$_}++ for(split("",$_));
}

push @arr, $hash{$_} for(sort {$hash{$b} <=> $hash{$a}} keys %hash);

for(keys %hash) {
   delete $hash{$_} if($hash{$_} != $arr[0] && $hash{$_} != $arr[-1]);
}

print "$_ - $hash{$_}\n" for(sort {$hash{$b} <=> $hash{$a}} keys %hash);
