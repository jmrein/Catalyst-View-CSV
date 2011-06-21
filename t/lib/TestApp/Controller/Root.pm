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
  $c->stash ( data => $data,
	      columns => [ qw ( index entry ) ],
	      current_view => "CSV" );
}

sub db :Local {
  ( my $self, my $c ) = @_;

  my $resultset = $c->model ( "TestDB::Person" )->search ( {}, {
    select => [ qw ( name age ) ],
    order_by => [ qw ( age name ) ],
  } );
  $c->stash ( cursor => $resultset->cursor,
	      columns => [ qw ( name age ) ],
	      current_view => "CSV" );
}

sub end :ActionClass("RenderView") {
}

1;
