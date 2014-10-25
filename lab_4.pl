#! /usr/bin/perl

# autor Taras Pochkun

use warnings;
use strict;

while(<>) {
  while(/<([\w|\n]*)(\s*\w*=".*")*?>/g) {
     print "$1\n";
  }
}

#===================================================
#my %hash;

#while(<>) {
#  $hash{$1}++ while(/<([\w|\n]*)(\s*\w*=".*")*?>/g);
#}

#print "$_ = $hash{$_}\n" for (keys %hash);
