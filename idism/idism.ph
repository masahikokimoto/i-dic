#################################
# Definitions

# Boolean
$TRUE = 1;
$FALSE = 0;

# Token Code
$TOKEN_NULL = 0;
$TOKEN_EOF = 1; 		# EOF code
$TOKEN_NEW_LINE = 2;		# new line
$TOKEN_VARIABLE = 3;		# variable
$TOKEN_FUNCTION = 4;		# function
$TOKEN_CONSTANT = 5;		# constant
$TOKEN_OPERATOR = 6;		# operator
$TOKEN_CHAR = 7;		# character
$TOKEN_CVARIABLE = 8;		# calc variable
    
# Variables(i-dic field)
$VAR_NULL = "";	# Null variable (Illegal)

# Variables(other)
$CVAR_AGE = 			"Age";
$CVAR_ZODIAC = 			"Zodiac";
$CVAR_FAMILY_NAME =		"FamilyName";
$CVAR_GIVEN_NAME =		"GivenName";
$CVAR_FAMILY_NAME_DESCRIPTION =	"FamilyNameDescription";
$CVAR_GIVEN_NAME_DESCRIPTION =	"GivenNameDescription";
$CVAR_ROMAN_NAME = 		"RomanName";
$CVAR_ROMAN_FAMILY_NAME =	"RomanFamilyName";
$CVAR_ROMAN_GIVEN_NAME =	"RomanGivenName";
$CVAR_INITIAL =			"Initial";
$CVAR_FAMILY_NAME_INITIAL =	"FamilyNameInitial";
$CVAR_GIVEN_NAME_INITIAL =	"GivenNameInitial";
$CVAR_BIRTH_DATE =		"BirthDate";
$CVAR_DEBUT_DATE =		"DebutDate";
$CVAR_SEX =			"Sex";
#
$CVAR_NOW_YEAR =		"NowYear";
$CVAR_NOW_MONTH =		"NowMonth";
$CVAR_NOW_DAY =			"NowDay";
$CVAR_NOW_DATE =		"NowDate";

# Constant
$CONST_ALL = $TRUE;
$CONST_NULL = 0;
$CONST_MALE = 1;
$CONST_FEMALE = 2;

# Compare Operators
$COMP_LT = 1;
$COMP_EL = 2;
$COMP_GT = 3;
$COMP_EG = 4;
$COMP_EQ = 5;
$COMP_NE = 6;
$COMP_STR_EQ = 7;
$COMP_STR_NE = 8;

#################################
# 星座
@zodiacStart = (22, 21, 19, 21, 20, 21, 22, 23, 23, 23, 24, 23);
@zodiacEnd   = (20, 18, 20, 19, 20, 21, 22, 22, 22, 23, 22, 21);
@zodiacName  =
    ("Capricon",
     "Aquarius",
     "Pisces",
     "Aries",
     "Taurus",
     "Gemini",
     "Cancer",
     "Leo",
     "Virgo",
     "Libra",
     "Scorpio",
     "Sagittarius");

#################################
# かなテーブル
# １文字
$kana2byte{"あ"} = "A";
$kana2byte{"い"} = "I";
$kana2byte{"う"} = "U";
$kana2byte{"え"} = "E";
$kana2byte{"お"} = "O";
$kana2byte{"ぁ"} = "A";
$kana2byte{"ぃ"} = "I";
$kana2byte{"ぅ"} = "U";
$kana2byte{"ぇ"} = "E";
$kana2byte{"ぉ"} = "O";
$kana2byte{"か"} = "Ka";
$kana2byte{"き"} = "Ki";
$kana2byte{"く"} = "Ku";
$kana2byte{"け"} = "Ke";
$kana2byte{"こ"} = "Ko";
$kana2byte{"が"} = "Ga";
$kana2byte{"ぎ"} = "Gi";
$kana2byte{"ぐ"} = "Gu";
$kana2byte{"げ"} = "Ge";
$kana2byte{"ご"} = "Go";
$kana2byte{"さ"} = "Sa";
$kana2byte{"し"} = "Shi";
$kana2byte{"す"} = "Su";
$kana2byte{"せ"} = "Se";
$kana2byte{"そ"} = "So";
$kana2byte{"ざ"} = "Za";
$kana2byte{"じ"} = "Ji";
$kana2byte{"ず"} = "Zu";
$kana2byte{"ぜ"} = "Ze";
$kana2byte{"ぞ"} = "Zo";
$kana2byte{"た"} = "Ta";
$kana2byte{"ち"} = "Chi";
$kana2byte{"つ"} = "Tsu";
$kana2byte{"て"} = "Te";
$kana2byte{"と"} = "To";
$kana2byte{"だ"} = "Da";
$kana2byte{"ぢ"} = "Di";
$kana2byte{"づ"} = "Du";
$kana2byte{"で"} = "De";
$kana2byte{"ど"} = "Do";
$kana2byte{"な"} = "Na";
$kana2byte{"に"} = "Ni";
$kana2byte{"ぬ"} = "Nu";
$kana2byte{"ね"} = "Ne";
$kana2byte{"の"} = "No";
$kana2byte{"は"} = "Ha";
$kana2byte{"ひ"} = "Hi";
$kana2byte{"ふ"} = "Hu";
$kana2byte{"へ"} = "He";
$kana2byte{"ほ"} = "Ho";
$kana2byte{"ば"} = "Ba";
$kana2byte{"び"} = "Bi";
$kana2byte{"ぶ"} = "Bu";
$kana2byte{"べ"} = "Be";
$kana2byte{"ぼ"} = "Bo";
$kana2byte{"ぱ"} = "Pa";
$kana2byte{"ぴ"} = "Pi";
$kana2byte{"ぷ"} = "Pu";
$kana2byte{"ぺ"} = "Pe";
$kana2byte{"ぽ"} = "Po";
$kana2byte{"ま"} = "Ma";
$kana2byte{"み"} = "Mi";
$kana2byte{"む"} = "Mu";
$kana2byte{"め"} = "Me";
$kana2byte{"も"} = "Mo";
$kana2byte{"や"} = "Ya";
$kana2byte{"ゆ"} = "Yu";
$kana2byte{"よ"} = "Yo";
$kana2byte{"ら"} = "Ra";
$kana2byte{"り"} = "Ri";
$kana2byte{"る"} = "Ru";
$kana2byte{"れ"} = "Re";
$kana2byte{"ろ"} = "Ro";
$kana2byte{"わ"} = "Wa";
$kana2byte{"ん"} = "N";
$kana2byte{"を"} = "Wo";
# ２文字
$kana4byte{"きゃ"} = "Kya";
$kana4byte{"きゅ"} = "Kyu";
$kana4byte{"きょ"} = "Kyo";
$kana4byte{"ぎゃ"} = "Gya";
$kana4byte{"ぎゅ"} = "Gyu";
$kana4byte{"ぎょ"} = "Gyo";
$kana4byte{"しゃ"} = "Sha";
$kana4byte{"しゅ"} = "Shu";
$kana4byte{"しょ"} = "Sho";
$kana4byte{"じゃ"} = "Ja";
$kana4byte{"じゅ"} = "Ju";
$kana4byte{"じょ"} = "Jo";
$kana4byte{"ちゃ"} = "Cha";
$kana4byte{"ちゅ"} = "Chu";
$kana4byte{"ちょ"} = "Cho";
$kana4byte{"てぃ"} = "Ti";
$kana4byte{"ぢぁ"} = "Dya";
$kana4byte{"ぢゅ"} = "Dyu";
$kana4byte{"ぢょ"} = "Dyo";
$kana4byte{"にゃ"} = "Nya";
$kana4byte{"にゅ"} = "Nyu";
$kana4byte{"にょ"} = "Nyo";
$kana4byte{"ひゃ"} = "Hya";
$kana4byte{"ひゅ"} = "Hyu";
$kana4byte{"ひょ"} = "Hyo";
$kana4byte{"びゃ"} = "Bya";
$kana4byte{"びゅ"} = "Byu";
$kana4byte{"びょ"} = "Byo";
$kana4byte{"ぴゃ"} = "Pya";
$kana4byte{"ぴゅ"} = "Pyu";
$kana4byte{"ぴょ"} = "Pyo";
$kana4byte{"りゃ"} = "Rya";
$kana4byte{"りゅ"} = "Ryu";
$kana4byte{"りょ"} = "Ryo";
$kana4byte{"みゃ"} = "Mya";
$kana4byte{"みゅ"} = "Myu";
$kana4byte{"みょ"} = "Myo";
$kana4byte{"うぃ"} = "Wi";

1;
