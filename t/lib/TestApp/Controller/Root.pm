package TestApp::Controller::Root;

use base qw ( Catalyst::Controller );
use strict;
use warnings;

__PACKAGE__->config->{namespace} = "";

sub literal :Local {
  ( my $self, my $c ) = @_;

  my $data = [
    [ "1", "foo" ],
    [ "2", "bar" ],
    [ "3", "baz" ],
  ];
  $c->stash ( data => $data, columns => [ qw ( index entry ) ] );
}

sub db :Local {
  ( my $self, my $c ) = @_;

  my $resultset = $c->model ( "TestDB::Person" )->search_rs ( {}, {
    select => [ qw ( name ) ],
  } );
  $c->stash ( cursor => $resultset->cursor,
	      columns => [ qw ( index entry ) ] );
}

sub end :ActionClass("RenderView") {
}

1;
