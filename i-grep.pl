#!/usr/bin/perl

$IDIC_DIR = ".";	# i-dic data directory

$TV{$1} = $2 while $ARGV[0] =~ /^(.*)=(.*)/ && shift;

open(FILE, "$IDIC_DIR/tag.def") || die "Can't open tag.def: $!";
foreach (reverse(<FILE>)) {
	next unless /^i-dic-\w\w:(.*)\t\t/ || /^i-dic-\w\w:(.*)\t/;
	next unless ($1 ne "begin");
	$rexp = ($TV{$1} ? "$TV{$1}\t" : $rexp ? "[^\t]*\t" : '').$rexp;
}
close(FILE);

chop($rexp);
while (<>) { /^$rexp/o && print; }
