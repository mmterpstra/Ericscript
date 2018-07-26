###!perl -T
use 5.22.1;
use strict;
use warnings;
use Test::More;
use Data::Dumper;
plan tests => 1;

#BEGIN {
#    use_ok( 'Ericscript' ) || print "Bail out!\n";
#}


#tests following commands from README.md


my @cmds =(["ericscript.pl", "--help"],
 ["ericscript.pl","--printdb"],
 ["mkdir","\$HOME/test1/","-p","&&","ericscript.pl", "--downdb", "--refid", "saccharomyces_cerevisiae", "-db", "\$HOME/test1/", "&&", "ls", "-alhR", "\$HOME/test1/"], 
 ["mkdir", "\$HOME/test2/", "-p", "&&", "ericscript.pl", "--downdb", "--refid", "saccharomyces_cerevisiae", "-db", "\$HOME/test2/", "--ensversion 74", "&&", "ls", "-alhR", "\$HOME/test2/"],
 ["mkdir", "\$HOME/test3/", "-p", "&&", "ericscript.pl", "-db", "\$HOME/test2", "--refid", "saccharomyces_cerevisiae", "-name", "SAMPLENAME", "-o", "\$HOME/test3/", "fq1", "YOUR_FASTQ_2"],
 ["ericscript.pl", "--checkdb"]);

warn Dumper($ENV{PATH},\@cmds);

for my $cmd (@cmds){
	warn join(" ","bash", "-c", "'set -ex && " , @{$cmd},"'");
	 ok(system( "bash", "-c", "'set -ex && " .join(" ", @{$cmd})."'"
	 ) == 0, "Functional test of '@{$cmd}'");
}
diag( "Testing Ericscript cli $Ericscript::VERSION, Perl $], $^X" );
