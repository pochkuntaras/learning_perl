#! /usr/bin/perl

use warnings;
use strict;

while (<>) {
   if(/<body>/.../<\/body>/g) {
      if(/(?<wo>\b\w*(?<word>\w)\g{word}\w*\b)/) {
      print "$+{wo}\n";
      }
   }
}
