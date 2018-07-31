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


my @cmds =(["pwd &>/dev/stderr"],
["perl ./blib/script/ericscript.pl --help"],
# ["perl","./blib/script/ericscript.pl","--printdb -db ~/test_printdb2/ --ensversion 82"],
# ["mkdir", "\$HOME/test2/", "-p", "&&", "perl","./blib/script/ericscript.pl", "--downdb", "--refid", "saccharomyces_cerevisiae", "-db", "\$HOME/test2/", "--ensversion 82", "&&", "ls", "-alhR", "\$HOME/test2/"],
# ["mkdir", "\$HOME/test3/", "-p", "&&", "perl","./blib/script/ericscript.pl", "-db", "\$HOME/test2", "--refid", "saccharomyces_cerevisiae", "-name", "SAMPLENAME", "-o", "\$HOME/test3/", "fq1", "YOUR_FASTQ_2"],
# ["perl","./blib/script/ericscript.pl", "--checkdb","-db ~/test_printdb2/"]);

warn Dumper($ENV{PATH},\@cmds);

for my $cmd (@cmds){
	warn join(" ",("pwd && echo", "'set -ex && " , @{$cmd},"'| bash "));
	 ok(system(  "echo 'set -ex && " .join(" ", @{$cmd})."'|bash"
	 ) == 0, "Functional test of '@{$cmd}'");
}
diag( "Testing Ericscript cli $Ericscript::VERSION, Perl $], $^X" );
