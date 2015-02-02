#!/usr/bin/env perl

use strict;
use warnings;

use Time::Local;

my %months = (
    'Jan' => 0,
    'Feb' => 1,
    'Mar' => 2,
    'Apr' => 3,
    'May' => 4,
    'Jun' => 5,
    'Jul' => 6,
    'Aug' => 7,
    'Sep' => 8,
    'Oct' => 9,
    'Nov' => 10,
    'Dec' => 11,
    );

my $num_lines = 0;

while (<>) {
    chomp;
    if (m|\[(\d+)/(\w*)/(\d+):(\d+):(\d+):(\d+) ([+-]\d+)\]|) {
        ## NOTE locale is currently ignored
        my $before = "$`";
        my $after = "$'";
        my ($day, $month, $year, $hour, $min, $sec, $locale) = ($1, $months{$2}, $3, $4, $5, $6, $7);
        warn "$year should greater than 999" if $year <= 999;
        my $unixtime = timelocal($sec, $min, $hour, $day, $month, $year);
        print join('', $before, $unixtime, $after), "\n";
    } else {
        warn "Unknown line format: $_", "\n";
    }
}
