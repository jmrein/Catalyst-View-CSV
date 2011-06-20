package TestApp;

use base qw ( Catalyst );
use strict;
use warnings;

__PACKAGE__->config (
  name => "TestApp",
  default_view => "CSV",
);
__PACKAGE__->setup();

1;
