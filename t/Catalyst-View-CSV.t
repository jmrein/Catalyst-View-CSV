#!perl -T

use FindBin;
BEGIN { ( our $bindir ) = ( $FindBin::Bin =~ /^(.*)$/ ) } # Untaint
use lib $bindir."/lib";
use Test::More;
use strict;
use warnings;

BEGIN {
  use_ok ( "Catalyst::Test", "TestApp" );
}

done_testing();
