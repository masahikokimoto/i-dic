#!/usr/local/bin/perl

require "idism.ph";
require "syntax.ph";
require "config.ph";
require "yylex.pl";
require "syntax.pl";

#################################
# Main
$nocase = $FALSE;		# ローマ字をすべて小文字で評価
$formatedShow = $FALSE;		# 簡易フォーマット表示
$debug = $FALSE;		# デバッグフラグ
sub main_routine
{
    local($line) = 0;
    
    # 現在時間
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
    # 評価式
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
    
    # 評価式をトークンに変換
    &convToken;
    &dumpToken if $debug;
    # 辞書の読み込みと評価
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
	# 評価
	$tokenIndex = 0;
	eval '$status = &yyparse;';
	&showData if $status;
    }
    &DB'profile if defined &DB'profile;
}

#################################
# 現在設定されている情報を出力
sub showData
{
    if ($formatedShow) {
	print "-" x 78 . "\n";
	printf("%s【%s】[%s]\n",
	       $data{$VAR_DESCRIPTION}, $data{$VAR_NAME}, 
	       defined($classificationName{$data{$VAR_CLASSIFICATION}}) ?
	       $classificationName{$data{$VAR_CLASSIFICATION}}:"不明");
	print "$data{$VAR_BIRTH_YEAR}年" if $data{$VAR_BIRTH_YEAR};
	print "$data{$VAR_BIRTH_MONTH}月" if $data{$VAR_BIRTH_MONTH};
	print "$data{$VAR_BIRTH_DAY}日" if $data{$VAR_BIRTH_DAY};
	print "生まれ"
	    if $data{$VAR_BIRTH_YEAR} ||
	       $data{$VAR_BIRTH_MONTH} ||
	       $data{$VAR_BIRTH_DAY};
	if (!defined($data{$CVAR_AGE})) {
	    $data{$CVAR_AGE} = &calcAge($data{$VAR_BIRTH_YEAR},
					$data{$VAR_BIRTH_MONTH},
					$data{$VAR_BIRTH_DAY});
	}
	print "($data{$CVAR_AGE}歳)" if $data{$CVAR_AGE};
	print ",$data{$VAR_BLOOD_TYPE}型" if $data{$VAR_BLOOD_TYPE};
	print ",身長$data{$VAR_HEIGHT}cm" if $data{$VAR_HEIGHT};
	print ",B$data{$VAR_BUST}cm" if $data{$VAR_BUST};
	print ",W$data{$VAR_WAIST}cm" if $data{$VAR_WAIST};
	print ",H$data{$VAR_HIP}cm" if $data{$VAR_HIP};
	print ",体重$data{$VAR_WEIGHT}kg" if $data{$VAR_WEIGHT};
	print ",事務所:$data{$VAR_OFFICE}" if $data{$VAR_OFFICE};
	print ",$data{$VAR_RECORD_COMPANY}" if $data{$VAR_RECORD_COMPANY};
	print ",本名:$data{$VAR_REAL_NAME}" if $data{$VAR_REAL_NAME};
	print ",$data{$VAR_HOME_CITY}出身" if $data{$VAR_HOME_CITY};
	print ",デビュー:"
	    if $data{$VAR_DEBUT_YEAR} ||
	       $data{$VAR_DEBUT_MONTH} ||
	       $data{$VAR_DEBUT_DAY};
	print "$data{$VAR_DEBUT_YEAR}年" if $data{$VAR_DEBUT_YEAR};
	print "$data{$VAR_DEBUT_MONTH}月" if $data{$VAR_DEBUT_MONTH};
	print "$data{$VAR_DEBUT_DAY}日" if $data{$VAR_DEBUT_DAY};
	printf(",%s:%s",
	       (($data{$VAR_CLASSIFICATION} == 15) ? 'メンバー' : 'グループ'),
	       $data{$VAR_GROUP}) if $data{$VAR_GROUP};
	print ",コンテスト:$data{$VAR_CONTEST}" if $data{$VAR_CONTEST};
	print ",音楽学校:$data{$VAR_MUSIC_SCHOOL}"
	    if $data{$VAR_MUSIC_SCHOOL};
	print ",桃組:$data{$VAR_MOMOGUMI}" if $data{$VAR_MOMOGUMI};
	print ",おニャン子:$data{$VAR_ONYANKO}" if $data{$VAR_ONYANKO};
	print ",乙女塾:$data{$VAR_OTOMEJUKU}" if $data{$VAR_OTOMEJUKU};
	print ",ハイレグクラブ:$data{$VAR_HIGH_LEG}" if $data{$VAR_HIGH_LEG};
	print ",原宿探険隊:$data{$VAR_HARAJUKU_TANKENTAI}"
	    if $data{$VAR_HARAJUKU_TANKENTAI};
	print ",美感少女:$data{$VAR_BIKAN_SHOUJO}"
	    if $data{$VAR_BIKAN_SHOUJO};
	print ",映画:$data{$VAR_MOVIE}" if $data{$VAR_MOVIE};
	print ",テレビ:$data{$VAR_TV}" if $data{$VAR_TV};
	print ",ラジオ:$data{$VAR_RADIO}" if $data{$VAR_RADIO};
	print ",ビデオ:$data{$VAR_VIDEO}" if $data{$VAR_VIDEO};
	print ",演劇:$data{$VAR_PLAY}" if $data{$VAR_PLAY};
	print ",声の出演:$data{$VAR_VOICE}" if $data{$VAR_VOICE};
	print ",書籍:$data{$VAR_BOOK}" if $data{$VAR_BOOK};
	print ",CF:$data{$VAR_CF}" if $data{$VAR_CF};
	print ",シングル:$data{$VAR_SINGLE}" if $data{$VAR_SINGLE};
	print ",アルバム:$data{$VAR_ALBUM}" if $data{$VAR_ALBUM};
	print ",縁戚:$data{$VAR_RELATION}" if $data{$VAR_RELATION};
	print ",学歴:$data{$VAR_EDUCATION}" if $data{$VAR_EDUCATION};
	print ",AV:$data{$VAR_ADULT}" if $data{$VAR_ADULT};
	print ",改名歴:$data{$VAR_RENAME}" if $data{$VAR_RENAME};
	print ",備考:$data{$VAR_NOTE}" if $data{$VAR_NOTE};
	print ",その他のメディア:$data{$VAR_OTHER_MEDIA}"
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
# 年齢計算
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
# 星座計算
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
# かなローマ字変換
sub roman # ($_[0]:かな) return roman
{
    local($r) = $_[0];
    
    # "っ" を "X" に変換
    $r =~ s/\244\303/X/g;
    # "ー" を "-" に変換
    $r =~ s/\241\274/-/g;
    # かなローマ字変換(２文字)
    $r =~ s/(\244[\221-\363])(\244[\241\243|\247|\251|\343|\345|\347])/defined($kana4byte{$&})?$kana4byte{$&}:$&/eg;
    # かなローマ字変換(１文字)
    $r =~ s/\244[\221-\363]/defined($kana2byte{$&})?$kana2byte{$&}:$&/eg;
    # "X" を次の１文字に変換
    $r =~ s/X/substr($', 0, 1)/eg;
    # $nocase なら大文字小文字変換
    $r =~ tr/A-Z/a-z/ if $nocase;
    $r;
}

#################################
# Eval Main
eval '&main_routine';
