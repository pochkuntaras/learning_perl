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

use warnings;
use strict;

my @obj;
my ($global_x, $global_y) = (20, 20);

sub new {
   my $class = shift;
   my $self = {};
   bless $self, $class;
   $self->init();
   push @obj, $self;
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

main->new() for(1..20);

while() {
   for(@obj) {
      $_->move();
      $_->print_points_all();
   }

   sleep 1;
}

sub print_coord_all {
  for(@obj) {$_->print_coord();}
}

sub move {
   my $self = shift;
   my $pos = int rand 8;
   my $new_x;
   my $new_y;
   
   if($pos == 0) {
      $new_x = $self->{x} + 1;
      $self->{x}++ if($new_x != $global_x && $new_x != 0);
   } elsif ($pos == 1) {
      $new_x = $self->{x} - 1;
      $self->{x}-- if($new_x != $global_x && $new_x != 0);
   } elsif ($pos == 2) {
      $new_y = $self->{y} + 1;
      $self->{y}++ if($new_y != $global_y && $new_y != 0);
   } elsif ($pos == 3) {
      $new_y = $self->{y} - 1;
      $self->{y}-- if($new_y != $global_y && $new_y != 0);
   } elsif ($pos == 4) {
      $new_x = $self->{x} + 1;
      $new_y = $self->{y} + 1;
      
      if($new_x != $global_x + 1 && $new_y != $global_y + 1) {
         $self->{x}++;
         $self->{y}++;
      }
   } elsif ($pos == 5) {
      $new_x = $self->{x} - 1;
      $new_y = $self->{y} - 1;
      
      if($new_x != -1 && $new_y != -1) {
         $self->{x}--;
         $self->{y}--;
      }
   } elsif ($pos == 6) {
      $new_x = $self->{x} - 1;
      $new_y = $self->{y} + 1;

      if($new_x != -1 && $new_y != $global_y + 1) {
         $self->{x}--;
         $self->{y}++;
      }     
   } elsif ($pos == 7) {
     $new_x = $self->{x} + 1;
     $new_y = $self->{y} - 1;

     if($new_x != $global_x + 1 && $new_y != -1) {
        $self->{x}++;
        $self->{y}--;
     }    
   }
}

sub print_points_all {
   my $matrix;

   for my $row (0..$global_x) {
      for my $elem (0..$global_y) {
         $matrix->[$elem][$row] = "   ";
      }
   }
   
   for(@obj) {
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

