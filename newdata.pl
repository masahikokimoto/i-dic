#!/usr/bin/perl

# これは、I-dicの新規データの作成を支援するものです。
# 左のtagに対応するデータがある場合は、-->以降に入力。
# なければReturnで次の行へ。終了する場合はq。
# 作成したデータはファイルへ追加保存。
#
# 注意
# ・下の$file_nameと$nicknameを適宜修正して下さい。
# ・i-dic-01〜04,06〜31は1行しか入力出来ないようにしてます
# ・i-dic-01〜03は必ず入力しなければいけません

$IDIC_DIR = ".";	# i-dic data directory
$TEMPLATE = "$IDIC_DIR/tag.def";

$file_name= "$IDIC_DIR/idicnew.txt";	# 作成データを出力するfile
$nickname = "hogehoge";	# 自分のNickName

open(TEMPLATE, $TEMPLATE) || die "Can't open file $TEMPLATE: $!";
$max = 0;
while (<TEMPLATE>) {
	chop;
	next if /^(#|$)/;
	$field_name[$max++] = (split)[0];
}
close(TEMPLATE);

# tabの調整
for($i=1;$i<$max-1;$i++){
	if (length($field_name[$i])<16){$field_name[$i]="$field_name[$i]\t";}
}

$num=1;
$data[0]="$field_name[0]";
print "I-dic新規データ作成開始(終了はq)\n\n";
for($i=1;$i<$max-2;$i++){
	if($i==4){next;}
	print "$field_name[$i]\t$_-->";
	chop($in=<STDIN>);
	if($in =~ /^[q|Q]$/){last;}
	elsif($in =~ /.+/){
		$data[$num++]="$field_name[$i]\t$_$in";
		if($i>=32 || $i==5){$i--;}
	}
	elsif($i<=3){print"\a";$i--;}
}
if($num<=3){print"終了します。[ret]";<STDIN>;exit;}
($sec,$min,$hour,$mday,$mon,$year)=localtime;
$data[$num++] = sprintf ("$field_name[$max-2]\t19%d%02d%02d $nickname",$year,$mon+1,$mday);
$data[$num] ="$field_name[$max-1]\n";

print"\n";
open(OUT,">> $file_name");
for($i=0;$i<=$num;$i++){
	print "$data[$i]\n";
	print OUT "$data[$i]\n";
}
close(OUT);
print"以上のデータを保存しました。[ret]";<STDIN>;
