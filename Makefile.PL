use 5.22.1;
use strict;
use warnings;
use inc::Module::Install;
use Module::Install::External;

name     'Ericscript';
all_from 'lib/Ericscript.pm';
author   q{mmterpstra <mmterpstra@github.com>};
license  'artistic2';

perl_version 5.022001;

tests_recursive('t');

resources (
   #homepage   => 'http://yourwebsitehere.com',
   #IRC        => 'irc://irc.perl.org/#Ericscript',
   license    => 'http://www.perlfoundation.org/artistic_license_2_0',
   #repository => 'git://github.com/mmterpstra/Ericscript.git',
   #repository => 'https://bitbucket.org/mmterpstra/Ericscript',
   bugtracker => 'http://rt.cpan.org/NoAuth/Bugs.html?Dist=Ericscript',
);

configure_requires (
   'Module::Install' => 0,
);

build_requires (
   'Test::More' => 0,
);

requires_external_bin 'blat';
requires_external_bin 'bwa';
requires_external_bin 'samtools';
requires_external_bin 'bedtools';
requires_external_bin 'seqtk';
requires_external_bin 'Rscript';

my @args = ("R","-q","--no-save" , "-e","library(rpart)");
system(@args) == 0
        or die "Please install the R package 'rpart' or load it into environment, system @args failed: $?";


my @args = ("R","-q","--no-save" , "-e","library(ada)");
system(@args) == 0
	or die "Please install the R package 'ada' or load it into environment, system @args failed: $?";

requires (
   #'ABC'              => 1.6,
   #'Foo::Bar::Module' => 5.0401,
);

install_as_cpan;
auto_install;
WriteAll;
