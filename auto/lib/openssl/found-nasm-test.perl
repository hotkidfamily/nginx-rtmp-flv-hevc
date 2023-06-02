#!/usr/bin/perl
use warnings;
use strict;

my $output = <<END_OF_STRING;
NASM version 2.14.02 compiled on Dec 26 2018
test
some other junk
END_OF_STRING

if ($output =~ /NASM version ([0-9]+\.[0-9]+)/ && $1 >= 2.0) {
    print "TEST: NASM $1 found\n";
} else {
    die "TEST: NASM not found\n";
}

print "TEST with redirection to NUL: ", `nasm -v 2>NUL`;
print "TEST without redirection to NUL: ", `nasm -v`;

if (`nasm -v 2>NUL` =~ /NASM version ([0-9]+\.[0-9]+)/ && $1 >= 2.0) {
    print "REAL: NASM $1 found\n";
} else {
    die "REAL: NASM not found\n";
}

exit 0;