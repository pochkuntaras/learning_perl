#! /usr/bin/perl

# autor Taras Pochkun

# Practice 8

# Create a table of cells and a couple of entities,
# which change their position from one cell to another.
# The positions are changed every second. During each
# pass the entity randomly chooses one of eight neighbour
# cells to move toward. The entity should not change a cell
# if choosed cell is occupied by another instance or if it
# is placed out of table. You should use OOP paradigm
# to realize the task. The table and instances should
# be printed to STDOUT.

package Pixel;

use warnings;
use strict;

my ($global_x, $global_y) = (8, 8);

sub new {
   my $class = shift;
   my $self = {};
   bless $self, $class;
   $self->init();
   return $self;
}

sub init {
   my $self = shift;
   $self->{x} = int rand $global_x;
   $self->{y} = int rand $global_y;
}

sub print_coord {
   my $self = shift;
   print "$self->{y} - $self->{x}\n";
}

sub check {
   my $self = shift;
   my ($x, $y) = ($_[0], $_[1]);
   
   if(($x <= $global_x) and ($x >= 0) and ($y <= $global_y) and ($y >= 0)) {
      for(@{$_[2]}) {
         return 0 if(($x == $_->{x}) and ($y == $_->{y}));
      }
      return 1;
   }
   return 0;
}

sub push_pixel {
   my $self = shift;
   my $pos = int rand 8;
   my ($new_x, $new_y);

   if($pos == 0) {$new_x = $self->{x} + 1; $new_y = $self->{y}    ;}
   if($pos == 1) {$new_x = $self->{x} + 1; $new_y = $self->{y} + 1;}
   if($pos == 2) {$new_x = $self->{x}    ; $new_y = $self->{y} + 1;}
   if($pos == 3) {$new_x = $self->{x} - 1; $new_y = $self->{y} + 1;}
   if($pos == 4) {$new_x = $self->{x} - 1; $new_y = $self->{y}    ;}
   if($pos == 5) {$new_x = $self->{x} - 1; $new_y = $self->{y} - 1;}
   if($pos == 6) {$new_x = $self->{x}    ; $new_y = $self->{y} - 1;}
   if($pos == 7) {$new_x = $self->{x} + 1; $new_y = $self->{y} - 1;}

   if($self->check($new_x, $new_y, \@_)) {
      $self->{x} = $new_x;
      $self->{y} = $new_y;
   }
}

sub print_points_all {
   my $matrix;
   my $self = shift;

   for my $row (0..$global_x) {
      for my $elem (0..$global_y) {
         $matrix->[$elem][$row] = " . ";
      }
   }
   
   for(@_) {
      $matrix->[$_->{x}][$_->{y}] = " x ";
   }
  
   print "\033\143";
   
   for my $row (0..$global_x) {
      for my $elem (0..$global_y) {
         print $matrix->[$elem][$row];
      }
      print "\n";
   }

}

1;
