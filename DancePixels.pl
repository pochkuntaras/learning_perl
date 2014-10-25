#! /usr/bin/perl

# autor Taras Pochkun

package DancePixels;

use warnings;
use strict;
use Pixel;
use PixelMod;

sub run() {
   my @obj;
   print "0.DancePixels [default]\n".
   "1.DancePixels [modern]\nEnter check[0/1] : ";
   
   my $my_check = <STDIN>;
   chop ($my_check);
   print "$my_check";
   
   if($my_check eq 0) {
      push @obj, Pixel->new() for (1..6);
   } elsif($my_check == 1) {
      push @obj, PixelMod->new() for (1..6);
   } else {
      die "Enter current check!\n"
   }
   
   while() {
      for(@obj) {
         $_->push_pixel(@obj);
         $_->print_points_all(@obj);
      }
      sleep 1;
   }
}

run();
