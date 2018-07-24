#!perl -T
use 5.22.1;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Ericscript' ) || print "Bail out!\n";
}

diag( "Testing Ericscript $Ericscript::VERSION, Perl $], $^X" );
