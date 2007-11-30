#!/usr/bin/perl
# 01-live.t 
# Copyright (c) 2006 Jonathan Rockway <jrockway@cpan.org>

use Test::More tests => 9;
use FindBin qw($Bin);
use lib "$Bin/lib";
BEGIN {
    $ENV{TESTAPP_foo} = 'foo';
    $ENV{TESTAPP_bar} = 'bar';
    $ENV{TESTAPP_foo_bar_baz} = 'quux';
    $ENV{TESTAPP_View::TestView_foo} = "Test View's foo!";
    $ENV{TESTAPP_View::TestView_quux} = q%["Test View's quux!"]%;
    $ENV{TESTAPP_View__TestView_bar} = "Test View's bar!";
    
}

use Catalyst::Test 'TestApp';

ok(my $r = request('/'), 'request /');
ok($r->is_success, 'that worked');

my $config = eval $r->content;
ok(ref $config, 'got config');

is($config->{foo}, 'foo', 'got foo');
is($config->{bar}, 'bar', 'got bar');
is($config->{foo_bar_baz}, 'quux', 'got foo_bar_baz');

my $view = get('/foo/foo');
is($view, "Test View's foo!", 'got View::TestView->foo');

$view = get('/foo/bar');
is($view, "Test View's bar!", 'got View::TestView->bar');

SKIP:{
    eval 'use JSON';
    if ($@) {
        eval 'use YAML';
        if ($@) {
            skip "no JSON/YAML installed", 1;
        }
    }

    $view = get('/foo/quux');
    eval $view;
    no warnings 'once';
    is_deeply($quux, ["Test View's quux!"], 'got View::TestView->quux');
}
