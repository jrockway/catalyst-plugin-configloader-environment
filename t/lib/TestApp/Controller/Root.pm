#!/usr/bin/perl
# Root.pm 
# Copyright (c) 2006 Jonathan Rockway <jrockway@cpan.org>

package TestApp::Controller::Root;
use base 'Catalyst::Controller';
use Data::Dumper;

__PACKAGE__->config->{namespace} = '';

sub default : Private {
    my ($self, $c) = @_;
    $c->res->body(Dumper($c->config));
}

sub foo : Local { 
    my ($self, $c) = @_;
    my $result = $c->view('TestView')->foo;
    $c->res->body($result);
}
  
1;
