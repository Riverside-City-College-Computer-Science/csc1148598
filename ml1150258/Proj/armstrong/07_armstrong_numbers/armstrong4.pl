#!/usr/bin/perl
use strict;
use warnings;

foreach my $number (10 .. 9999) {
  my $size = length $number;
  my @digits = split(//, $number);
  my $total = 0;
  for (my $index = 0; $index < $size; $index++) {
    $total += $digits[$index] ** $size;
  }
  print "ARMSTRONG NUMBER is $number\n" if ($total == $number);
}
