#!/usr/bin/perl -s
# last modified 20030823  kubota@miri.ne.jp
# thanks to katsu2@tky.3web.ne.jp

$IDIC_DIR = ".";	# i-dic data directory

open(FILE, "$IDIC_DIR/genre") || die "Can't open genre: $!";
while (<FILE>) {
    chop;
    next if /^(#|$)/;
    ($num, $genre) = split;
    if ($num !~ /^!/) {
	if ($num =~ /^@([0-9]*)/) {
	    $num = $1;
	    $INCLUDE_SPACE{$num} = 1;
	}
	$GENRE_NUM{$genre} = $num;
    }
}
close(FILE);

open(FILE, "$IDIC_DIR/config/$fep.tbl") || die "Can't open config/$fep.tbl: $!";
while (<FILE>) {
    chop;
    next if /^(#|$)/;
    ($from, $to) = split;
    $GENRE_NUM{$from} && ($HINSHI{$GENRE_NUM{$from}} = $to);
}
close(FILE);

open(FILE, "$IDIC_DIR/tag.def") || die "Can't open tag.def: $!";
while (<FILE>) {
    chop;
    next if /^(#|$)/;
    local($n,$bunrui) = (split(q/[-:\s]/))[2,3];
    $fn{$bunrui} = $n-1;
}
close(FILE);

require "$IDIC_DIR/config/$fep.pl";

while (<>) {
    chop;
    @F = split("\t");
    $no_av && $F[$fn{'�������'}] && next;
    &print_line($F[$fn{'�ɤ�'}], $F[$fn{'ɽ��'}], $HINSHI{$F[$fn{'�ֹ�'}]}, $INCLUDE_SPACE{$F[$fn{'�ֹ�'}]}, $F[$fn{'����'}], $F[$fn{'�ƥ��'}], $F[$fn{'CF'}], $F[$fn{'�������'}], $F[$fn{'��̾'}])
#    &print_line($F[$fn{'�ɤ�'}], $F[$fn{'ɽ��'}], $HINSHI{$F[$fn{'�ֹ�'}]}, $INCLUDE_SPACE{$F[$fn{'�ֹ�'}]})
	if $HINSHI{$F[$fn{'�ֹ�'}]};

}
