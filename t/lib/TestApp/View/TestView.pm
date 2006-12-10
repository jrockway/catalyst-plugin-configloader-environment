#!/usr/bin/perl
# TestView.pm 
# Copyright (c) 2006 Jonathan Rockway <jrockway@cpan.org>

package TestApp::View::TestView;
use base 'Catalyst::View';

sub foo {
    return $_[0]->{foo};
}

1;
