#! /usr/bin/perl

# autor Taras Pochkun

# Practice 12
#
# Create a program which finds all words
# with doubled letters (e.g. "progress",
# "address", "tool" and so on) inside a
# body part of an html-document.
# The program should search for them outside
# html-tags, e.g. among words that are
# "visible" on a screen.
# You should point a path to the html-file
# as an argument to the program.
# Print all found words to STDOUT.

use warnings;
use strict;

while(<>) {
   if(/<body>/.../<\/body>/g) {
      print "$+{wo}\n" while(/(?<wo>\b\w*(?<word>\w)\g{word}\w*\b)/g);
   }
}
