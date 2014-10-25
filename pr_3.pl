#! /usr/bin/perl

# autor Pochkun Taras

# Practice 3

# Create a program which returns a service name after giving it a port number.
# A file /etc/services should be used.
# Usage: program_name first_port [last_port]
# If two ports are mentioned, the program should print all services within
# this range. An output should look like this: port_number - service.
# The program has to process exceptions like blank lines or comments in the file
# and handle an incorrect input from a user.

open ($file, "<:utf8", "/etc/services") or die "Cannot open file";

my %serv;

while(<$file>) {
   my @buf = split(' ', $_);
   my $key = (split('/', @buf[1]))[0];
   
   if(defined $ARGV[0]) {
      if(defined $ARGV[1]) {
         ($ARGV[0], $ARGV[1]) = ($ARGV[1], $ARGV[0]) if($ARGV[0] > $ARGV[1]);
         
         if(defined $buf[0] && $ARGV[0] <= $key && $key <= $ARGV[1]) {
            $serv{$key} = $buf[0];
         }
      } elsif(defined $buf[0] and $ARGV[0] == $key) {
         $serv{$key} = $buf[0];
      }
   } else {
      die "Enter the port number!\n";
   }
}

print "$_ - $serv{$_}\n" for sort {$a <=> $b} keys %serv;
