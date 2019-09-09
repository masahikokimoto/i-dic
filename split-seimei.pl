#!/usr/bin/perl

while (<>) {
    chop;
    ($yomi, $hyouki, $bangou) = split("\t");
    $bangou =~ /^[123]$/ || next;
    @yomi = split(' ', $yomi);
    @hyouki = split(' ', $hyouki);

    $#yomi != $#hyouki && next;
    $#yomi == 0 && next;

    if ($yomi[0] ne $hyouki[0] && &is_kanji($hyouki[0])) {
	printf "%s\t%s\t201\n", $yomi[0], $hyouki[0];
    }
    if ($yomi[$#yomi] ne $hyouki[$#hyouki] && &is_kanji($hyouki[$#hyouki])) {
	printf "%s\t%s\t202\n", $yomi[$#yomi], $hyouki[$#hyouki];
    }
}

sub is_kanji {
    local($kanji);
    foreach (unpack("S*", $_[0])) {
	$_ == 0xa1b9 && ($kanji = 1) && next;
	$_ < 0xa4a1 && return 0;
	$_ > 0xa4f3 && ($kanji = 1);
    }
    $kanji;
}
