#! /usr/bin/perl

# autor Taras Pochkun

# Practice 2

# Create a console utility which can get a text
# input via pipe or by pointing a filename(s) as
# input argument(s). This program finds out which
# symbols appear the most and the less number of
# times. An output should contain the symbol and
# the number of times it appears. A special newline
# symbol should (if printed to output) be labeled
# as '\n' instead of a real newline.

use warnings;
use strict;

`touch rez_ping_site.log`;

open (my $open_file, '>', './rez_ping_site.log')
or die "Cannot open output file! $!";
our $rez_ping;

while(<>) {
   for($_) {
      $rez_ping = func($_) for ($_);
      print $rez_ping;
      print $open_file $rez_ping;
   }
}

sub func {
   my ($site) = @_;
   my @res = `ping -c 10 -qn -i 0.5 $site`;
   my $loss = (split ",", $res[3])[2];
   my $max = (split "/", $res[4])[-2];
   return "max time = $max\t$loss\t$site";
}
