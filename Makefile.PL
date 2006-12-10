use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Catalyst::Plugin::ConfigLoader::Environment',
    AUTHOR              => 'Jonathan Rockway <jrockway@cpan.org>',
    VERSION_FROM        => 'lib/Catalyst/Plugin/ConfigLoader/Environment.pm',
    ABSTRACT_FROM       => 'lib/Catalyst/Plugin/ConfigLoader/Environment.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Catalyst-Plugin-ConfigLoader-Environment-*' },
);
