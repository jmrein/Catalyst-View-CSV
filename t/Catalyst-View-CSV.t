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

{
  my $url = "/literal";
  action_ok ( $url );
  contenttype_is ( $url, "text/csv" );
  my $content = get ( $url );
  is ( $content, <<"EOF" );
index,entry\r
1,foo\r
2,bar\r
3,baz\r
EOF
}

{
  my $url = "/db";
  action_ok ( $url );
  contenttype_is ( $url, "text/csv" );
  my $content = get ( $url );
  is ( $content, <<"EOF" );
name,age\r
Dave,12\r
Bob,27\r
Alan,42\r
Charlie,64\r
EOF
}

done_testing();
