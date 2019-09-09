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
# ����
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
# ���ʥơ��֥�
# ��ʸ��
$kana2byte{"��"} = "A";
$kana2byte{"��"} = "I";
$kana2byte{"��"} = "U";
$kana2byte{"��"} = "E";
$kana2byte{"��"} = "O";
$kana2byte{"��"} = "A";
$kana2byte{"��"} = "I";
$kana2byte{"��"} = "U";
$kana2byte{"��"} = "E";
$kana2byte{"��"} = "O";
$kana2byte{"��"} = "Ka";
$kana2byte{"��"} = "Ki";
$kana2byte{"��"} = "Ku";
$kana2byte{"��"} = "Ke";
$kana2byte{"��"} = "Ko";
$kana2byte{"��"} = "Ga";
$kana2byte{"��"} = "Gi";
$kana2byte{"��"} = "Gu";
$kana2byte{"��"} = "Ge";
$kana2byte{"��"} = "Go";
$kana2byte{"��"} = "Sa";
$kana2byte{"��"} = "Shi";
$kana2byte{"��"} = "Su";
$kana2byte{"��"} = "Se";
$kana2byte{"��"} = "So";
$kana2byte{"��"} = "Za";
$kana2byte{"��"} = "Ji";
$kana2byte{"��"} = "Zu";
$kana2byte{"��"} = "Ze";
$kana2byte{"��"} = "Zo";
$kana2byte{"��"} = "Ta";
$kana2byte{"��"} = "Chi";
$kana2byte{"��"} = "Tsu";
$kana2byte{"��"} = "Te";
$kana2byte{"��"} = "To";
$kana2byte{"��"} = "Da";
$kana2byte{"��"} = "Di";
$kana2byte{"��"} = "Du";
$kana2byte{"��"} = "De";
$kana2byte{"��"} = "Do";
$kana2byte{"��"} = "Na";
$kana2byte{"��"} = "Ni";
$kana2byte{"��"} = "Nu";
$kana2byte{"��"} = "Ne";
$kana2byte{"��"} = "No";
$kana2byte{"��"} = "Ha";
$kana2byte{"��"} = "Hi";
$kana2byte{"��"} = "Hu";
$kana2byte{"��"} = "He";
$kana2byte{"��"} = "Ho";
$kana2byte{"��"} = "Ba";
$kana2byte{"��"} = "Bi";
$kana2byte{"��"} = "Bu";
$kana2byte{"��"} = "Be";
$kana2byte{"��"} = "Bo";
$kana2byte{"��"} = "Pa";
$kana2byte{"��"} = "Pi";
$kana2byte{"��"} = "Pu";
$kana2byte{"��"} = "Pe";
$kana2byte{"��"} = "Po";
$kana2byte{"��"} = "Ma";
$kana2byte{"��"} = "Mi";
$kana2byte{"��"} = "Mu";
$kana2byte{"��"} = "Me";
$kana2byte{"��"} = "Mo";
$kana2byte{"��"} = "Ya";
$kana2byte{"��"} = "Yu";
$kana2byte{"��"} = "Yo";
$kana2byte{"��"} = "Ra";
$kana2byte{"��"} = "Ri";
$kana2byte{"��"} = "Ru";
$kana2byte{"��"} = "Re";
$kana2byte{"��"} = "Ro";
$kana2byte{"��"} = "Wa";
$kana2byte{"��"} = "N";
$kana2byte{"��"} = "Wo";
# ��ʸ��
$kana4byte{"����"} = "Kya";
$kana4byte{"����"} = "Kyu";
$kana4byte{"����"} = "Kyo";
$kana4byte{"����"} = "Gya";
$kana4byte{"����"} = "Gyu";
$kana4byte{"����"} = "Gyo";
$kana4byte{"����"} = "Sha";
$kana4byte{"����"} = "Shu";
$kana4byte{"����"} = "Sho";
$kana4byte{"����"} = "Ja";
$kana4byte{"����"} = "Ju";
$kana4byte{"����"} = "Jo";
$kana4byte{"����"} = "Cha";
$kana4byte{"����"} = "Chu";
$kana4byte{"����"} = "Cho";
$kana4byte{"�Ƥ�"} = "Ti";
$kana4byte{"�¤�"} = "Dya";
$kana4byte{"�¤�"} = "Dyu";
$kana4byte{"�¤�"} = "Dyo";
$kana4byte{"�ˤ�"} = "Nya";
$kana4byte{"�ˤ�"} = "Nyu";
$kana4byte{"�ˤ�"} = "Nyo";
$kana4byte{"�Ҥ�"} = "Hya";
$kana4byte{"�Ҥ�"} = "Hyu";
$kana4byte{"�Ҥ�"} = "Hyo";
$kana4byte{"�Ӥ�"} = "Bya";
$kana4byte{"�Ӥ�"} = "Byu";
$kana4byte{"�Ӥ�"} = "Byo";
$kana4byte{"�Ԥ�"} = "Pya";
$kana4byte{"�Ԥ�"} = "Pyu";
$kana4byte{"�Ԥ�"} = "Pyo";
$kana4byte{"���"} = "Rya";
$kana4byte{"���"} = "Ryu";
$kana4byte{"���"} = "Ryo";
$kana4byte{"�ߤ�"} = "Mya";
$kana4byte{"�ߤ�"} = "Myu";
$kana4byte{"�ߤ�"} = "Myo";
$kana4byte{"����"} = "Wi";

1;
