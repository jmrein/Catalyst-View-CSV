package TestApp::Controller::Root;

use base qw ( Catalyst::Controller );
use strict;
use warnings;

__PACKAGE__->config->{namespace} = "";

sub literal_csv :Path {
  ( my $self, my $c ) = @_;

  my $data = [
    [ "1", "foo" ],
    [ "2", "bar" ],
    [ "3", "baz" ],
  ];
  $c->stash ( data => $data, columns => [ qw ( index entry ) ] );
}

sub end :ActionClass("RenderView") {
}

1;
