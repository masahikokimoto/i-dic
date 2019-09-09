#!/usr/bin/perl

## [�ɤ�ʤ�Τ�] I-dic �� �����ե��륿
## [������] perl 4.035 �ʹ� (DOS�Ǥ� jperl1.4 �ʹ�)
## [��꤫��] % perl i-conv.pl i-dic

# last modified 19980516  kubota@nttbed.ntt-f.co.jp
# thanks to katsu2@tky.3web.ne.jp
# thanks to oharakun@stmt.elec.keio.ac.jp

$IDIC_DIR = ".";	# i-dic data directory

$TAG_DEF = "$IDIC_DIR/tag.def";
$genre = "$IDIC_DIR/genre";
$I_DIC = "$IDIC_DIR/i-dic";
$I_CONV_PL = "$IDIC_DIR/i-conv.pl";


$n = 0;
open(FILE, "$TAG_DEF") || die "Can't open tag.def: $!";
while (<FILE>) {
    chop;
    next if /^(#|$)/;
    local($n,$bunrui) = (split(q/[-:\s]/))[2,3];
    $fn{$bunrui} = $n-1;
}
close(FILE);

open(FILE, "$genre") || die "Can't open file genre: $!";
while (<FILE>) {
    chop;
    next if /^(#|$)/;
    ($key, $val) = split;
    $key =~ s/^!//;
    $key =~ s/^@([0-9]*)/\1/;
    $GENRE{$key} = $val;
}
close(FILE);

while (<>) {
    chop;
    @f = split("\t");
    $bangou = $f[$fn{'�ֹ�'}];
    next if $bangou > 100;
    $yomi = $f[$fn{'�ɤ�'}];
    $hyouki = $f[$fn{'ɽ��'}];
    if ($yomi =~ / /) {
	$yomi =~ s/ //g;
	$hyouki =~ s/ //g;
    }
    printf '%s��%s��[%s]', $yomi, $hyouki, $GENRE{$bangou};
    printf ',����:%s', $f[$fn{'����'}] if $f[$fn{'����'}];
    printf ',%d/%d/%d��',
           $f[$fn{'��ǯ'}], $f[$fn{'����'}], $f[$fn{'����'}]
	if $f[$fn{'��ǯ'}];
    printf ',%s��', $f[$fn{'��շ�'}] if $f[$fn{'��շ�'}];
    printf ',%scm', $f[$fn{'��Ĺ'}] if $f[$fn{'��Ĺ'}];
    printf ',%skg', $f[$fn{'�ν�'}] if $f[$fn{'�ν�'}];
    printf ',%s-%s-%s', $f[$fn{'B'}], $f[$fn{'W'}], $f[$fn{'H'}]
	if $f[$fn{'B'}];
    printf ',%s', $f[$fn{'��̳��'}] if $f[$fn{'��̳��'}];
    printf ',<%s>', $f[$fn{'�쥳���ɲ��'}] if $f[$fn{'�쥳���ɲ��'}];
    printf ',��̾:%s', $f[$fn{'��̾'}] if $f[$fn{'��̾'}];
    printf ',%s�п�', $f[$fn{'�п���'}] if $f[$fn{'�п���'}];
    printf ',%s/%s/%s�ǥӥ塼%s',
           $f[$fn{'�ǥӥ塼ǯ'}], $f[$fn{'�ǥӥ塼��'}],
           $f[$fn{'�ǥӥ塼��'}], $f[$fn{'�ǥӥ塼����'}]
	if $f[$fn{'�ǥӥ塼ǯ'}];
    printf ',%s:%s', (($bangou == 15) ? '���С�' : '���롼��'),
           $f[$fn{'���롼��'}] if $f[$fn{'���롼��'}];
    printf ',����ƥ���:%s', $f[$fn{'����ƥ���'}] if $f[$fn{'����ƥ���'}];
    printf ',���ڳع�:%s', $f[$fn{'���ڳع�'}] if $f[$fn{'���ڳع�'}];
    printf ',����:%s', $f[$fn{'����'}] if $f[$fn{'����'}];
    printf ',���˥���:%s', $f[$fn{'���˥���'}] if $f[$fn{'���˥���'}];
    printf ',������:%s', $f[$fn{'������'}] if $f[$fn{'������'}];
    printf ',�ϥ��쥰�����:%s', $f[$fn{'�ϥ��쥰'}] if $f[$fn{'�ϥ��쥰'}];
    printf ',��õ:%s', $f[$fn{'����õ����'}] if $f[$fn{'����õ����'}];
    printf ',��������:%s', $f[$fn{'��������'}] if $f[$fn{'��������'}];
    printf ',�ǲ�:%s', $f[$fn{'�ǲ�'}] if $f[$fn{'�ǲ�'}];
    printf ',�ƥ��:%s', $f[$fn{'�ƥ��'}] if $f[$fn{'�ƥ��'}];
    printf ',�饸��:%s', $f[$fn{'�饸��'}] if $f[$fn{'�饸��'}];
    printf ',�ӥǥ�:%s', $f[$fn{'�ӥǥ�'}] if $f[$fn{'�ӥǥ�'}];
    printf ',����:%s', $f[$fn{'���'}] if $f[$fn{'���'}];
    printf ',���νб�:%s', $f[$fn{'��'}] if $f[$fn{'��'}];
    printf ',����:%s', $f[$fn{'�������'}] if $f[$fn{'�������'}];
    printf ',CF:%s', $f[$fn{'CF'}] if $f[$fn{'CF'}];
    printf ',���󥰥�:%s', $f[$fn{'���󥰥�'}] if $f[$fn{'���󥰥�'}];
    printf ',����Х�:%s', $f[$fn{'����Х�'}] if $f[$fn{'����Х�'}];
    printf ',����:%s', $f[$fn{'��²����'}] if $f[$fn{'��²����'}];
    printf ',����:%s', $f[$fn{'����'}] if $f[$fn{'����'}];
    printf ',������Ⱥ���:%s', $f[$fn{'�������'}] if $f[$fn{'�������'}];
    printf ',��̾��:%s', $f[$fn{'��̾'}] if $f[$fn{'��̾'}];
    printf ',����¾�Υ�ǥ���:%s', $f[$fn{'����¾��ǥ���'}]
                                               if $f[$fn{'����¾��ǥ���'}];
    printf "\n";
}
