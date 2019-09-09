#!/usr/bin/perl

# ����ϡ�I-dic�ο����ǡ����κ�����ٱ礹���ΤǤ���
# ����tag���б�����ǡ�����������ϡ�-->�ʹߤ����ϡ�
# �ʤ����Return�Ǽ��ιԤء���λ�������q��
# ���������ǡ����ϥե�������ɲ���¸��
#
# ���
# ������$file_name��$nickname��Ŭ���������Ʋ�������
# ��i-dic-01��04,06��31��1�Ԥ������Ͻ���ʤ��褦�ˤ��Ƥޤ�
# ��i-dic-01��03��ɬ�����Ϥ��ʤ���Ф����ޤ���

$IDIC_DIR = ".";	# i-dic data directory
$TEMPLATE = "$IDIC_DIR/tag.def";

$file_name= "$IDIC_DIR/idicnew.txt";	# �����ǡ�������Ϥ���file
$nickname = "hogehoge";	# ��ʬ��NickName

open(TEMPLATE, $TEMPLATE) || die "Can't open file $TEMPLATE: $!";
$max = 0;
while (<TEMPLATE>) {
	chop;
	next if /^(#|$)/;
	$field_name[$max++] = (split)[0];
}
close(TEMPLATE);

# tab��Ĵ��
for($i=1;$i<$max-1;$i++){
	if (length($field_name[$i])<16){$field_name[$i]="$field_name[$i]\t";}
}

$num=1;
$data[0]="$field_name[0]";
print "I-dic�����ǡ�����������(��λ��q)\n\n";
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
if($num<=3){print"��λ���ޤ���[ret]";<STDIN>;exit;}
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
print"�ʾ�Υǡ�������¸���ޤ�����[ret]";<STDIN>;
