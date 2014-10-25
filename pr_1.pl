#! /usr/bin/perl -w -s

# autor Taras Pochkun

# Practice 1

# Write a program which asks an operator to point a full
# path to a text file and after that finds the longest
# word from it. White space is considered as a word
# separator. An output should be written to a terminal#
# and looks like:
# longest_word - number_of_symbols

binmode(STDOUT,':utf8');

print "\nPath file : ";
my $file_path = <STDIN>;
chop($file_path);

open (my $file_read, "<:utf8", $file_path)
or die "\nCannot open file!";

our @words;

push @words, $_ =~ /\w+/g while(<$file_read>);

our @arr_long = $longword = "";
our $leng_longword = length $longword;

foreach (@words) {
   my $leng_worg = length $_;

   if($leng_worg gt $leng_longword) {
      @arr_long = $longword = $_;
      $leng_longword = length $longword;
   } else {
       push @arr_long, $_ if($leng_worg eq $leng_longword);
   }
}

print "\n\"@arr_long\"\n[$leng_longword] symbol\n";
