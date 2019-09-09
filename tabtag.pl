#!/usr/bin/perl

# last modified 2006/08/18  kubota@miri.ne.jp
# thanks to katsu2@tky.3web.ne.jp

$IDIC_DIR = ".";	# i-dic data directory

$TEMPLATE = "$IDIC_DIR/tag.def";

open(TEMPLATE, $TEMPLATE) || die "Can't open file $TEMPLATE: $!";
$max = 0;
while (<TEMPLATE>) {
    chop;
    next if /^(#|$)/;
    $field_name[$max++] = (split)[0];
}
close(TEMPLATE);

while (<>) {
    chop;
    @data = split("\t");
    print "i-dic-00:begin\n";
    foreach $i (0..$max-1) {
	if ($data[$i] ne '') {
	    foreach (split(/\|/, $data[$i])) {
		print "$field_name[$i+1]\t$_\n";
	    }
	}
    }
    print "i-dic-99:end\n\n";
}

