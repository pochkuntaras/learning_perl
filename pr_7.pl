#! /usr/bin/perl

use warnings;
use strict;

# autor Taras Pochkun

# Practice 7

# Create a matrix (a reference to an array of references)
# and fill each element of this matrix with a random
# fractional number. A program should print this matrix
# and also its greatest, smallest and average values.
# The program should contain such functions:
# a) gen, which generates a matrix  X by Y and fills
# it with random fractional numbers from 0 to P.
# b) min_max_avg, which calculates the greatest,
# the least and the average values. The function returns
# these values as a list.
# c) print_matrix, which prints the matrix and results of
# min_max_avg to STDOUT.
# The program accepts X, Y and P as optional parameters.

use strict;

sub getRandMatrix($;$;$) {
my $matrix = [[]];
   for(my $i = 0; $i < $_[0]; $i++) {
      for(my $j = 0; $j < $_[1]; $j++) {
         $matrix->[$i][$j] = sprintf("%.2f",rand($_[2]));
      }
   }
   return $matrix;
}

sub getCalMatrix($) {
   my $calc = {
               'max' => $_[0]->[0][0],
               'min' => $_[0]->[0][0],
               'avg' => $_[0]->[0][0]
              };

   my $row = $#{$_[0]} + 1;
   my $col = $#{$_[0]->[0]} + 1;

   for(@{$_[0]}) {
      for(@{$_}) {
        $calc->{'max'} = $_ if($calc->{'max'} < $_);
        $calc->{'min'} = $_ if($calc->{'min'} > $_);
        $calc->{'avg'} += $_;
      }
   } 
   $calc->{'avg'} /= $row * $col;
   return $calc;
}

sub printMatrix($;$) {
   for(@{$_[0]}) {
      print "$_\t" for(@{$_});  
      print "\n";
   }
   print "$_ - $_[1]->{$_}\n" for(sort keys %{$_[1]});
}

die "ENTER X3 INT PARAMETER!" if(@ARGV < 3);
my $matrix = getRandMatrix($ARGV[0],$ARGV[1],$ARGV[2]);
printMatrix($matrix, getCalMatrix($matrix));
