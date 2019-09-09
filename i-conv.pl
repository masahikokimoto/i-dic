#!/usr/bin/perl

## [どんなものか] I-dic の 整形フィルタ
## [いるもの] perl 4.035 以降 (DOS版は jperl1.4 以降)
## [やりかた] % perl i-conv.pl i-dic

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
    $bangou = $f[$fn{'番号'}];
    next if $bangou > 100;
    $yomi = $f[$fn{'読み'}];
    $hyouki = $f[$fn{'表記'}];
    if ($yomi =~ / /) {
	$yomi =~ s/ //g;
	$hyouki =~ s/ //g;
    }
    printf '%s【%s】[%s]', $yomi, $hyouki, $GENRE{$bangou};
    printf ',備考:%s', $f[$fn{'備考'}] if $f[$fn{'備考'}];
    printf ',%d/%d/%d生',
           $f[$fn{'生年'}], $f[$fn{'生月'}], $f[$fn{'生日'}]
	if $f[$fn{'生年'}];
    printf ',%s型', $f[$fn{'血液型'}] if $f[$fn{'血液型'}];
    printf ',%scm', $f[$fn{'身長'}] if $f[$fn{'身長'}];
    printf ',%skg', $f[$fn{'体重'}] if $f[$fn{'体重'}];
    printf ',%s-%s-%s', $f[$fn{'B'}], $f[$fn{'W'}], $f[$fn{'H'}]
	if $f[$fn{'B'}];
    printf ',%s', $f[$fn{'事務所'}] if $f[$fn{'事務所'}];
    printf ',<%s>', $f[$fn{'レコード会社'}] if $f[$fn{'レコード会社'}];
    printf ',本名:%s', $f[$fn{'本名'}] if $f[$fn{'本名'}];
    printf ',%s出身', $f[$fn{'出身地'}] if $f[$fn{'出身地'}];
    printf ',%s/%s/%sデビュー%s',
           $f[$fn{'デビュー年'}], $f[$fn{'デビュー月'}],
           $f[$fn{'デビュー日'}], $f[$fn{'デビュー作品'}]
	if $f[$fn{'デビュー年'}];
    printf ',%s:%s', (($bangou == 15) ? 'メンバー' : 'グループ'),
           $f[$fn{'グループ'}] if $f[$fn{'グループ'}];
    printf ',コンテスト:%s', $f[$fn{'コンテスト'}] if $f[$fn{'コンテスト'}];
    printf ',音楽学校:%s', $f[$fn{'音楽学校'}] if $f[$fn{'音楽学校'}];
    printf ',桃組:%s', $f[$fn{'桃組'}] if $f[$fn{'桃組'}];
    printf ',おニャン子:%s', $f[$fn{'おニャン子'}] if $f[$fn{'おニャン子'}];
    printf ',乙女塾:%s', $f[$fn{'乙女塾'}] if $f[$fn{'乙女塾'}];
    printf ',ハイレグクラブ:%s', $f[$fn{'ハイレグ'}] if $f[$fn{'ハイレグ'}];
    printf ',原探:%s', $f[$fn{'原宿探険隊'}] if $f[$fn{'原宿探険隊'}];
    printf ',美感少女:%s', $f[$fn{'美感少女'}] if $f[$fn{'美感少女'}];
    printf ',映画:%s', $f[$fn{'映画'}] if $f[$fn{'映画'}];
    printf ',テレビ:%s', $f[$fn{'テレビ'}] if $f[$fn{'テレビ'}];
    printf ',ラジオ:%s', $f[$fn{'ラジオ'}] if $f[$fn{'ラジオ'}];
    printf ',ビデオ:%s', $f[$fn{'ビデオ'}] if $f[$fn{'ビデオ'}];
    printf ',舞台:%s', $f[$fn{'演劇'}] if $f[$fn{'演劇'}];
    printf ',声の出演:%s', $f[$fn{'声'}] if $f[$fn{'声'}];
    printf ',書籍:%s', $f[$fn{'雑誌書籍'}] if $f[$fn{'雑誌書籍'}];
    printf ',CF:%s', $f[$fn{'CF'}] if $f[$fn{'CF'}];
    printf ',シングル:%s', $f[$fn{'シングル'}] if $f[$fn{'シングル'}];
    printf ',アルバム:%s', $f[$fn{'アルバム'}] if $f[$fn{'アルバム'}];
    printf ',縁戚:%s', $f[$fn{'親族親戚'}] if $f[$fn{'親族親戚'}];
    printf ',学歴:%s', $f[$fn{'教育'}] if $f[$fn{'教育'}];
    printf ',アダルト作品:%s', $f[$fn{'アダルト'}] if $f[$fn{'アダルト'}];
    printf ',改名歴:%s', $f[$fn{'改名'}] if $f[$fn{'改名'}];
    printf ',その他のメディア:%s', $f[$fn{'その他メディア'}]
                                               if $f[$fn{'その他メディア'}];
    printf "\n";
}
