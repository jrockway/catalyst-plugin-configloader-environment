use strict;
use warnings;
use inc::Module::Install;

name('Catalyst-Plugin-ConfigLoader-Environment');
author('Jonathan Rockway <jrockway@cpan.org>');
all_from('lib/Catalyst/Plugin/ConfigLoader/Environment.pm');
license('Perl');
include('ExtUtils::AutoInstall');

requires('Catalyst' => '5.7000');
requires('JSON::Any');
build_requires('Test::More' => 0);

auto_install();
WriteAll();
