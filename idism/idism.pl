#!/usr/local/bin/perl

require "idism.ph";
require "syntax.ph";
require "config.ph";
require "yylex.pl";
require "syntax.pl";

#################################
# Main
$nocase = $FALSE;		# ���޻��򤹤٤ƾ�ʸ����ɾ��
$formatedShow = $FALSE;		# �ʰץե����ޥå�ɽ��
$debug = $FALSE;		# �ǥХå��ե饰
sub main_routine
{
    local($line) = 0;
    
    # ���߻���
    ($NowSec, $NowMin, $NowHour, $NowMday, $NowMonth, $NowYear,
     $NowWday, $NowYday, $NowIsdst) = localtime(time);
    
    while ($_ = shift(@ARGV)) {
	/^--/o && do {
	    last;
	};
	/^-d/o && do {
	    &usage if $#ARGV < 0;
	    $IDIC_PATH = shift(@ARGV);
	    next;
	};
	/^-l/o && do {
	    $nocase = $TRUE;
	    next;
	};
	/^-D/o && do {
	    $debug = $TRUE;
	};
	/^-p/o && do {
	    $formatedShow = $TRUE;
	};
	/^-v/o && do {
	    &version;
	    next;
	};
	/^-h/o && do {
	    &usage;
	    next;
	};
	last;
    }
    # ɾ����
    $expression = "";
    while ($_ = shift(@ARGV)) {
	/^--/o && do {
	    next;
	};
	if ($expression eq "") {
	    $expression = $_;
	} else {
	    $expression = $expression . " " . $_;
	}
    }
    
    # ɾ������ȡ�������Ѵ�
    &convToken;
    &dumpToken if $debug;
    # ������ɤ߹��ߤ�ɾ��
    open(IDIC, "$IDIC_PATH") || die("Can't open $IDIC_PATH");
    while(<IDIC>) {
	chop;
	undef %data;
	($data{$VAR_NAME},
	 $data{$VAR_DESCRIPTION},
	 $data{$VAR_CLASSIFICATION},
	 $data{$VAR_ID},
	 $data{$VAR_NOTE},
	 $data{$VAR_BIRTH_YEAR},
	 $data{$VAR_BIRTH_MONTH},
	 $data{$VAR_BIRTH_DAY},
	 $data{$VAR_BLOOD_TYPE},
	 $data{$VAR_HEIGHT},
	 $data{$VAR_BUST},
	 $data{$VAR_WAIST},
	 $data{$VAR_HIP},
	 $data{$VAR_WEIGHT},
	 $data{$VAR_OFFICE},
	 $data{$VAR_RECORD_COMPANY},
	 $data{$VAR_REAL_NAME},
	 $data{$VAR_HOME_CITY},
	 $data{$VAR_DEBUT_YEAR},
	 $data{$VAR_DEBUT_MONTH},
	 $data{$VAR_DEBUT_DAY},
	 $data{$VAR_DEBUT_WORK},
	 $data{$VAR_GROUP},
	 $data{$VAR_CONTEST},
	 $data{$VAR_MUSIC_SCHOOL},
	 $data{$VAR_MOMOGUMI},
	 $data{$VAR_ONYANKO},
	 $data{$VAR_OTOMEJUKU},
	 $data{$VAR_HIGH_LEG},
	 $data{$VAR_HARAJUKU_TANKENTAI},
	 $data{$VAR_BIKAN_SHOUJO},
	 $data{$VAR_MOVIE},
	 $data{$VAR_TV},
	 $data{$VAR_RADIO},
	 $data{$VAR_VIDEO},
	 $data{$VAR_PLAY},
	 $data{$VAR_VOICE},
	 $data{$VAR_BOOK},
	 $data{$VAR_CF},
	 $data{$VAR_SINGLE},
	 $data{$VAR_ALBUM},
	 $data{$VAR_RELATION},
	 $data{$VAR_EDUCATION},
	 $data{$VAR_ADULT},
	 $data{$VAR_RENAME},
	 $data{$VAR_OTHER_MEDIA}
	 ) = split("\t");
	# ɾ��
	$tokenIndex = 0;
	eval '$status = &yyparse;';
	&showData if $status;
    }
    &DB'profile if defined &DB'profile;
}

#################################
# �������ꤵ��Ƥ����������
sub showData
{
    if ($formatedShow) {
	print "-" x 78 . "\n";
	printf("%s��%s��[%s]\n",
	       $data{$VAR_DESCRIPTION}, $data{$VAR_NAME}, 
	       defined($classificationName{$data{$VAR_CLASSIFICATION}}) ?
	       $classificationName{$data{$VAR_CLASSIFICATION}}:"����");
	print "$data{$VAR_BIRTH_YEAR}ǯ" if $data{$VAR_BIRTH_YEAR};
	print "$data{$VAR_BIRTH_MONTH}��" if $data{$VAR_BIRTH_MONTH};
	print "$data{$VAR_BIRTH_DAY}��" if $data{$VAR_BIRTH_DAY};
	print "���ޤ�"
	    if $data{$VAR_BIRTH_YEAR} ||
	       $data{$VAR_BIRTH_MONTH} ||
	       $data{$VAR_BIRTH_DAY};
	if (!defined($data{$CVAR_AGE})) {
	    $data{$CVAR_AGE} = &calcAge($data{$VAR_BIRTH_YEAR},
					$data{$VAR_BIRTH_MONTH},
					$data{$VAR_BIRTH_DAY});
	}
	print "($data{$CVAR_AGE}��)" if $data{$CVAR_AGE};
	print ",$data{$VAR_BLOOD_TYPE}��" if $data{$VAR_BLOOD_TYPE};
	print ",��Ĺ$data{$VAR_HEIGHT}cm" if $data{$VAR_HEIGHT};
	print ",B$data{$VAR_BUST}cm" if $data{$VAR_BUST};
	print ",W$data{$VAR_WAIST}cm" if $data{$VAR_WAIST};
	print ",H$data{$VAR_HIP}cm" if $data{$VAR_HIP};
	print ",�ν�$data{$VAR_WEIGHT}kg" if $data{$VAR_WEIGHT};
	print ",��̳��:$data{$VAR_OFFICE}" if $data{$VAR_OFFICE};
	print ",$data{$VAR_RECORD_COMPANY}" if $data{$VAR_RECORD_COMPANY};
	print ",��̾:$data{$VAR_REAL_NAME}" if $data{$VAR_REAL_NAME};
	print ",$data{$VAR_HOME_CITY}�п�" if $data{$VAR_HOME_CITY};
	print ",�ǥӥ塼:"
	    if $data{$VAR_DEBUT_YEAR} ||
	       $data{$VAR_DEBUT_MONTH} ||
	       $data{$VAR_DEBUT_DAY};
	print "$data{$VAR_DEBUT_YEAR}ǯ" if $data{$VAR_DEBUT_YEAR};
	print "$data{$VAR_DEBUT_MONTH}��" if $data{$VAR_DEBUT_MONTH};
	print "$data{$VAR_DEBUT_DAY}��" if $data{$VAR_DEBUT_DAY};
	printf(",%s:%s",
	       (($data{$VAR_CLASSIFICATION} == 15) ? '���С�' : '���롼��'),
	       $data{$VAR_GROUP}) if $data{$VAR_GROUP};
	print ",����ƥ���:$data{$VAR_CONTEST}" if $data{$VAR_CONTEST};
	print ",���ڳع�:$data{$VAR_MUSIC_SCHOOL}"
	    if $data{$VAR_MUSIC_SCHOOL};
	print ",����:$data{$VAR_MOMOGUMI}" if $data{$VAR_MOMOGUMI};
	print ",���˥���:$data{$VAR_ONYANKO}" if $data{$VAR_ONYANKO};
	print ",������:$data{$VAR_OTOMEJUKU}" if $data{$VAR_OTOMEJUKU};
	print ",�ϥ��쥰�����:$data{$VAR_HIGH_LEG}" if $data{$VAR_HIGH_LEG};
	print ",����õ����:$data{$VAR_HARAJUKU_TANKENTAI}"
	    if $data{$VAR_HARAJUKU_TANKENTAI};
	print ",��������:$data{$VAR_BIKAN_SHOUJO}"
	    if $data{$VAR_BIKAN_SHOUJO};
	print ",�ǲ�:$data{$VAR_MOVIE}" if $data{$VAR_MOVIE};
	print ",�ƥ��:$data{$VAR_TV}" if $data{$VAR_TV};
	print ",�饸��:$data{$VAR_RADIO}" if $data{$VAR_RADIO};
	print ",�ӥǥ�:$data{$VAR_VIDEO}" if $data{$VAR_VIDEO};
	print ",���:$data{$VAR_PLAY}" if $data{$VAR_PLAY};
	print ",���νб�:$data{$VAR_VOICE}" if $data{$VAR_VOICE};
	print ",����:$data{$VAR_BOOK}" if $data{$VAR_BOOK};
	print ",CF:$data{$VAR_CF}" if $data{$VAR_CF};
	print ",���󥰥�:$data{$VAR_SINGLE}" if $data{$VAR_SINGLE};
	print ",����Х�:$data{$VAR_ALBUM}" if $data{$VAR_ALBUM};
	print ",����:$data{$VAR_RELATION}" if $data{$VAR_RELATION};
	print ",����:$data{$VAR_EDUCATION}" if $data{$VAR_EDUCATION};
	print ",AV:$data{$VAR_ADULT}" if $data{$VAR_ADULT};
	print ",��̾��:$data{$VAR_RENAME}" if $data{$VAR_RENAME};
	print ",����:$data{$VAR_NOTE}" if $data{$VAR_NOTE};
	print ",����¾�Υ�ǥ���:$data{$VAR_OTHER_MEDIA}"
	    if $data{$VAR_OTHER_MEDIA};
	print "\n";
    } else {
	print join("\t",
		   $data{$VAR_NAME},
		   $data{$VAR_DESCRIPTION},
		   $data{$VAR_CLASSIFICATION},
		   $data{$VAR_ID},
		   $data{$VAR_NOTE},
		   $data{$VAR_BIRTH_YEAR},
		   $data{$VAR_BIRTH_MONTH},
		   $data{$VAR_BIRTH_DAY},
		   $data{$VAR_BLOOD_TYPE},
		   $data{$VAR_HEIGHT},
		   $data{$VAR_BUST},
		   $data{$VAR_WAIST},
		   $data{$VAR_HIP},
		   $data{$VAR_WEIGHT},
		   $data{$VAR_OFFICE},
		   $data{$VAR_RECORD_COMPANY},
		   $data{$VAR_REAL_NAME},
		   $data{$VAR_HOME_CITY},
		   $data{$VAR_DEBUT_YEAR},
		   $data{$VAR_DEBUT_MONTH},
		   $data{$VAR_DEBUT_DAY},
		   $data{$VAR_DEBUT_WORK},
		   $data{$VAR_GROUP},
		   $data{$VAR_CONTEST},
		   $data{$VAR_MUSIC_SCHOOL},
		   $data{$VAR_MOMOGUMI},
		   $data{$VAR_ONYANKO},
		   $data{$VAR_OTOMEJUKU},
		   $data{$VAR_HIGH_LEG},
		   $data{$VAR_HARAJUKU_TANKENTAI},
		   $data{$VAR_BIKAN_SHOUJO},
		   $data{$VAR_MOVIE},
		   $data{$VAR_TV},
		   $data{$VAR_RADIO},
		   $data{$VAR_VIDEO},
		   $data{$VAR_PLAY},
		   $data{$VAR_VOICE},
		   $data{$VAR_BOOK},
		   $data{$VAR_CF},
		   $data{$VAR_SINGLE},
		   $data{$VAR_ALBUM},
		   $data{$VAR_RELATION},
		   $data{$VAR_EDUCATION},
		   $data{$VAR_ADULT},
		   $data{$VAR_RENAME},
		   $data{$VAR_OTHER_MEDIA});
	print "\n";
    }
}

#################################
# Usage
sub usage #() exit
{
    local($command) = $0;
    
    print STDERR "Usage: $command [-h] [-l] [-d i-dic] expression\n";
    exit;
}
    
#################################
# Version
sub version #() exit
{
    local($command) = $0;
    
    print STDERR "$command: version 0.9 for i-dic-9511a\n";
    exit;
}

#################################
# Error
sub error
{
    print STDERR "$_[0]\n";
    exit;
}

#################################
# ǯ��׻�
sub calcAge # ($_[0]:year,$_[1]:month,$_[2]:day) return age
{
    local($Y) = int($_[0]);
    local($M) = int($_[1]);
    local($D) = int($_[2]);
    local($month);
    local($day);
    local($age);
    
    if ($Y == 0 || $M == 0) {
        return (0);
    }
    if ($D == 0) {
        if ($M == $NowMonth + 1) {
            return(0);
        }
        $day = 1;
    } else {
        $day = $D;
    }

    $age = ($NowYear + 1900) - $Y;
    if ($NowMonth + 1 < $M) {
        $age--;
    }
    if ($NowMonth + 1 == $M && $NowMday < $D) {
        $age--;
    }
    return ($age);
}

#################################
# ���·׻�
sub calcZodiac # ($_[0]:month,$_[1]:day) return zodiac
{
    local($month) = int($_[0]) - 1;
    local($day) = int($_[0]);

    if ($month == 0 || $day == 0) {
	return ("");
    }
    if (@zodiacStart[$month] >= $day) {
	return (@zodiacName[$month]);
    }
    $month++;
    if ($month > 11) {
	$month = 0;
    }
    return (@zodiacName[$month]);
}
    
#################################
# ���ʥ��޻��Ѵ�
sub roman # ($_[0]:����) return roman
{
    local($r) = $_[0];
    
    # "��" �� "X" ���Ѵ�
    $r =~ s/\244\303/X/g;
    # "��" �� "-" ���Ѵ�
    $r =~ s/\241\274/-/g;
    # ���ʥ��޻��Ѵ�(��ʸ��)
    $r =~ s/(\244[\221-\363])(\244[\241\243|\247|\251|\343|\345|\347])/defined($kana4byte{$&})?$kana4byte{$&}:$&/eg;
    # ���ʥ��޻��Ѵ�(��ʸ��)
    $r =~ s/\244[\221-\363]/defined($kana2byte{$&})?$kana2byte{$&}:$&/eg;
    # "X" �򼡤Σ�ʸ�����Ѵ�
    $r =~ s/X/substr($', 0, 1)/eg;
    # $nocase �ʤ���ʸ����ʸ���Ѵ�
    $r =~ tr/A-Z/a-z/ if $nocase;
    $r;
}

#################################
# Eval Main
eval '&main_routine';
