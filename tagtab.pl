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
    $field_num{(split)[0]} = $max++;
}
close(TEMPLATE);

#$deny=0;
#open(DENYLIST, ">denylist.tab");

while (<>) {
    /^ *$/ && next;
    unless (/^i-dic-/) {
	print STDERR "$.: ignore: $_";
	next;
    }
    chop;
    ($tag, $val) = split(/[ \t]/, $_, 2);
    $n = $field_num{$tag};
#    printf STDERR "%d:tag=%s\n", $., $tag;
#    printf STDERR "%d:val=%s\n", $., $val;
#    printf STDERR "%d:n=%d\n", $., $n;
    if ($tag eq 'i-dic-99:end') {
#     printf STDERR "%d:in=%d\n", $., $in;
#     printf STDERR "%d:end\n", $., $in;
	$in || print STDERR "$.: bad i-dic-end\n";
	$in = 0;
#	if ($deny == 0) {
	    print join("\t", @data[1..$#data])."\n";
#	} else {
#	    print DENYLIST join("\t", @data[1..$#data])."\n";
#	}
    } elsif ($tag eq 'i-dic-00:begin') {
#    printf STDERR "%d:in=%d\n", $., $in;
	$in && print STDERR "$.: bad i-dic-begin\n";
	$in = 1;
	@data = ();
#	$deny = 0;
    } elsif ($n > 0) {
	if ($val eq '') {
#	    print STDERR "$.: empty field: $_\n";
	    next;
	}
#	if ($tag eq 'i-dic-96:∑«∫‹µÒ»›') {
#	    $deny = 1;
#	}
	$val =~ /^(.*[^ \t]+)[ \t]+$/ && ($val = $1);
	$val =~ /^[ \t]+(.*)$/ && ($val = $1);
	$data[$n] .= $data[$n] ? "|$val" : $val;
    } else {
	print STDERR "$.: unknown tag: $_\n";
    }
}
