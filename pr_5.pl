#! /usr/bin/perl

# autor Taras Pochkun

# Practice 5

# Use the previous task and write a program that
# checks a connection status to a number of remote hosts.
# But this time create several specialized functions
# with prototypes. You should create such functions and
# use them further in the program:
# a) "read_hosts", that accepts a path to a file with
# addresses and returns a list of addresses;
# b) "check", that accepts address to one host, a number
# of ping tries; it returns a list which includes: IP address,
# domain name of the host (if exists), % loss, max time;
# c) "print_res", that prints the result to STDOUT with a
# timestamp. If an optional parameter "output_file" is passing,
# the output should be printed to both STDOUT and the target file.
# Arguments of this function may differ depending on realization,
# so to find out what they should be is on your own.
# You are free to choose your own names of that functions.

use warnings;
use strict;

sub check {
   my @ping_list;

   for(@_) {
      my @res = `ping -c 10 -qn -i 0.5 $_`;
      my $loss = (split ",", $res[3])[2];
      my $max = (split "/", $res[4])[-2];
      push @ping_list, "max time = $max\t$loss\t$_";
   }

   return @ping_list;
}

sub print_res($;$) {

   if(defined $_[1]) {
      `touch $_[1]`;
       open (my $open_file, '>', $_[1])
       or die "Cannot open output file! $!";
       print $open_file $_ for(@{$_[0]});
   } else {
      print $_ for(@{$_[0]});
   }
}

sub read_hosts {
   my @list_host;
   
   while(<>) {
      push @list_host, $_ for($_);
   }
   
   return @list_host;
}

sub save_to_file($) {
   print "Save to file [y/n] ? ";
   my $mes = <STDIN>;
   chop $mes;
   if($mes eq 'Y' || $mes eq 'y') {
      print "Name file : ";
      my $name_file = <STDIN>;
      chop $name_file;
      print_res($_[0], $name_file);
   } elsif ($mes eq 'N' || $mes eq 'n') {
      exit 0;
   } else {
      &save_to_file($_[0]);
   }

}

sub init_ping() {
   my $res = [check(read_hosts())];
   print_res($res);
   save_to_file($res);
}

init_ping();
