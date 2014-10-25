#! /usr/bin/perl

# autor Taras Pochkun
#
# Practice 9
#
# Modify a program from the previous task by
# changing a way it prints a table of cells:
# it should be printed with a border and each
# empty cell should be marked with "."
# You may also modify a rule of entity movement.
# To realize the task you should create separate
# modules with parent (old) class and inherited
# (new) class descriptions.

package PixelMod;

use base Pixel;
use warnings;
use strict;

my ($global_x, $global_y) = (8, 8);

sub new {
   my $class = shift;
   my $self = Pixel::new($class);
   return $self; 
}

sub print_points_all {
   my $matrix;
   
   for my $row (0..$global_x) {
      for my $elem (0..$global_y ) {
            $matrix->[$elem][$row] = "| . ";
      }
   }

   for(@_) {
      $matrix->[$_->{x}][$_->{y}] = "| 0 ";
   }

   print "\033\143";
   
   for my $elem (0..$global_y) {
      print "+---";
   }

   print "+\n";
   
   for my $row (0..$global_x) {
      for my $elem (0..$global_y) {
         print $matrix->[$elem][$row];
      }

      print "|\n";

      for my $elem (0..$global_y) {
         print "+---";
      }

      print "+\n";
   }
}

1; #ok! :)
