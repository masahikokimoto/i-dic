############################################################
# idism カスタマイズヘッダ

############################################################
# i-dic 辞書のデフォルトパス
$IDIC_PATH="/usr/local/lib/i-dic";

############################################################
# 辞書に含まれるフィールド名の予約語
#
# i-dic のフィールドが増えた場合は以下の予約語をペアで増やす
#
# $VAR_内部変数名 = "評価式上の予約語";
# $variableName{$VAR_内部変数名} = $VAR_内部変数名;
#
$VAR_NAME = 		"Name";
$VAR_DESCRIPTION =	"Description";
$VAR_NOTE = 		"Note";
$VAR_ID = 		"ID";
$VAR_BIRTH_YEAR = 	"BirthYear";
$VAR_BIRTH_MONTH = 	"BirthMonth";
$VAR_BIRTH_DAY = 	"BirthDay";
$VAR_CLASSIFICATION = 	"Classification";
$VAR_BLOOD_TYPE = 	"BloodType";
$VAR_HEIGHT = 		"Height";
$VAR_BUST = 		"Bust";
$VAR_WAIST = 		"Waist";
$VAR_HIP = 		"Hip";
$VAR_WEIGHT = 		"Weight";
$VAR_OFFICE = 		"Office";
$VAR_RECORD_COMPANY = 	"RecordCompany";
$VAR_REAL_NAME = 	"RealName";
$VAR_HOME_CITY = 	"HomeCity";
$VAR_DEBUT_YEAR = 	"DebutYear";
$VAR_DEBUT_MONTH =	"DebutMonth";
$VAR_DEBUT_DAY = 	"DebutDay";
$VAR_DEBUT_WORK = 	"DebutWork";
$VAR_GROUP = 		"Group";
$VAR_CONTEST = 		"Contest";
$VAR_MUSIC_SCHOOL = 	"MusicSchool";
$VAR_MOMOGUMI = 	"Momogumi";
$VAR_ONYANKO = 		"Onyanko";
$VAR_OTOMEJUKU = 	"Otomejuku";
$VAR_HIGH_LEG = 	"HighLegClub";
$VAR_HARAJUKU_TANKENTAI = "HarajukuTankentai";
$VAR_BIKAN_SHOUJO =	"BikanShoujo";
$VAR_MOVIE = 		"Movie";
$VAR_TV = 		"TV";
$VAR_RADIO = 		"Radio";
$VAR_VIDEO = 		"Video";
$VAR_PLAY = 		"Play";
$VAR_VOICE = 		"Voice";
$VAR_BOOK = 		"Book";
$VAR_CF = 		"CF";
$VAR_SINGLE = 		"Single";
$VAR_ALBUM = 		"Album";
$VAR_RELATION = 	"Relation";
$VAR_EDUCATION = 	"Education";
$VAR_ADULT = 		"Adult";
$VAR_RENAME = 		"Rename";
$VAR_OTHER_MEDIA = 	"OtherMedia";
# 予約語テーブル
$variableName{$VAR_NAME} = $VAR_NAME;
$variableName{$VAR_DESCRIPTION} = $VAR_DESCRIPTION;
$variableName{$VAR_NOTE} = $VAR_NOTE;
$variableName{$VAR_BIRTH_YEAR} = $VAR_BIRTH_YEAR;
$variableName{$VAR_BIRTH_MONTH} = $VAR_BIRTH_MONTH;
$variableName{$VAR_BIRTH_DAY} = $VAR_BIRTH_DAY;
$variableName{$VAR_CLASSIFICATION} = $VAR_CLASSIFICATION;
$variableName{$VAR_BLOOD_TYPE} = $VAR_BLOOD_TYPE;
$variableName{$VAR_HEIGHT} = $VAR_HEIGHT;
$variableName{$VAR_BUST} = $VAR_BUST;
$variableName{$VAR_WAIST} = $VAR_WAIST;
$variableName{$VAR_HIP} = $VAR_HIP;
$variableName{$VAR_WEIGHT} = $VAR_WEIGHT;
$variableName{$VAR_OFFICE} = $VAR_OFFICE;
$variableName{$VAR_RECORD_COMPANY} = $VAR_RECORD_COMPANY;
$variableName{$VAR_REAL_NAME} = $VAR_REAL_NAME;
$variableName{$VAR_HOME_CITY} = $VAR_HOME_CITY;
$variableName{$VAR_DEBUT_YEAR} = $VAR_DEBUT_YEAR;
$variableName{$VAR_DEBUT_MONTH} = $VAR_DEBUT_MONTH;
$variableName{$VAR_DEBUT_DAY} = $VAR_DEBUT_DAY;
$variableName{$VAR_DEBUT_WORK} = $VAR_DEBUT_WORK;
$variableName{$VAR_GROUP} = $VAR_GROUP;
$variableName{$VAR_CONTEST} = $VAR_CONTEST;
$variableName{$VAR_MUSIC_SCHOOL} = $VAR_MUSIC_SCHOOL;
$variableName{$VAR_MOMOGUMI} = $VAR_MOMOGUMI;
$variableName{$VAR_ONYANKO} = $VAR_ONYANKO;
$variableName{$VAR_OTOMEJUKU} = $VAR_OTOMEJUKU;
$variableName{$VAR_HIGH_LEG} = $VAR_HIGH_LEG;
$variableName{$VAR_HARAJUKU_TANKENTAI} = $VAR_HARAJUKU_TANKENTAI;
$variableName{$VAR_BIKAN_SHOUJO} = $VAR_BIKAN_SHOUJO;
$variableName{$VAR_MOVIE} = $VAR_MOVIE;
$variableName{$VAR_TV} = $VAR_TV;
$variableName{$VAR_RADIO} = $VAR_RADIO;
$variableName{$VAR_VIDEO} = $VAR_VIDEO;
$variableName{$VAR_PLAY} = $VAR_PLAY;
$variableName{$VAR_VOICE} = $VAR_VOICE;
$variableName{$VAR_BOOK} = $VAR_BOOK;
$variableName{$VAR_CF} = $VAR_CF;
$variableName{$VAR_SINGLE} = $VAR_SINGLE;
$variableName{$VAR_ALBUM} = $VAR_ALBUM;
$variableName{$VAR_RELATION} = $VAR_RELATION;
$variableName{$VAR_EDUCATION} = $VAR_EDUCATION;
$variableName{$VAR_ADULT} = $VAR_ADULT;
$variableName{$VAR_RENAME} = $VAR_RENAME;
$variableName{$VAR_OTHER_MEDIA} = $VAR_OtherMedia;
#
# エイリアスの予約語
#
# $variableName{エイリアス名} = $VAR_内部変数名;
#
$variableName{'byear'} = $VAR_BIRTH_YEAR;
$variableName{'bmonth'} = $VAR_BIRTH_MONTH;
$variableName{'bday'} = $VAR_BIRTH_DAY;
$variableName{'T'} = $VAR_HEIGHT;
$variableName{'B'} = $VAR_BUST;
$variableName{'W'} = $VAR_WAIST;
$variableName{'H'} = $VAR_HIP;
$variableName{'dyear'} = $VAR_DEBUT_YEAR;
$variableName{'dmonth'} = $VAR_DEBUT_MONTH;
$variableName{'dday'} = $VAR_DEBUT_DAY;
$variableName{'class'} = $VAR_CLASSIFICATION;
$variableName{'blood'} = $VAR_BLOOD_TYPE;

############################################################
# 定数名(分類番号)
#
# 分類番号が増えた場合は以下の３つの予約語をペアで増やす
#
# $CONST_CLASS_分類番号名 = 分類番号;
# $constantName{評価式上での予約語} = $CONST_CLASS_分類番号名;
# $classificationName{$CONST_CLASS_分類番号名} = 表示文字列;
#
$CONST_CLASS_MALE_NAME = 1;
$CONST_CLASS_FEMALE_NAME = 2;
$CONST_CLASS_UNKNOWN_NAME = 3;
$CONST_CLASS_TRANCATED_NAME = 4;
$CONST_CLASS_NAME_FROM_NICKNAME = 6;
$CONST_CLASS_NICKNAME = 8;
$CONST_CLASS_PHRASE = 9;
$CONST_CLASS_PLACE_NAME = 10;
$CONST_CLASS_COMPANY_NAME = 11;
$CONST_CLASS_BUILDING_NAME = 12;
$CONST_CLASS_DESIGNER_NAME = 13;
$CONST_CLASS_PRODUCT_NAME = 14;
$CONST_CLASS_PARTY_NAME = 15;
$CONST_CLASS_PROGRAM_NAME = 16;
$CONST_CLASS_SCHOOL_NAME = 19;
$CONST_CLASS_PROPER_NOUN = 5;
$CONST_CLASS_ADJECTIVE = 101;
$CONST_CLASS_ADJECTIVE_VARB = 102;
$CONST_CLASS_ADVERB = 103;
$CONST_CLASS_RENTAI_SHI = 104;
$CONST_CLASS_CONJUNCTION = 105;
$CONST_CLASS_NUMERAL = 106;
$CONST_CLASS_EMOTOIN = 107;
$CONST_CLASS_NOUN = 108;
$CONST_CLASS_NOUN_SA = 109;
$CONST_CLASS_VERB = 110;
$CONST_CLASS_FAMILY_NAME = 201;
$CONST_CLASS_GIVEN_NAME = 202;
# 予約語テーブル
$constantName{'ClassMaleName'} = $CONST_CLASS_MALE_NAME;
$constantName{'ClassFemaleName'} = $CONST_CLASS_FEMALE_NAME;
$constantName{'ClassUnknownName'} = $CONST_CLASS_UNKNOWN_NAME;
$constantName{'ClassTrancatedName'} = $CONST_CLASS_TRANCATED_NAME;
$constantName{'ClassNameFromNickname'} = $CONST_CLASS_NAME_FROM_NICKNAME;
$constantName{'ClassNickname'} = $CONST_CLASS_NICKNAME;
$constantName{'ClassPhrase'} = $CONST_CLASS_PHRASE;
$constantName{'ClassPlaceName'} = $CONST_CLASS_PLACE_NAME;
$constantName{'ClassCompanyName'} = $CONST_CLASS_COMPANY_NAME;
$constantName{'ClassBuildingName'} = $CONST_CLASS_BUILDING_NAME;
$constantName{'ClassDesignerName'} = $CONST_CLASS_DESIGNER_NAME;
$constantName{'ClassProductName'} = $CONST_CLASS_PRODUCT_NAME;
$constantName{'ClassPartyName'} = $CONST_CLASS_PARTY_NAME;
$constantName{'ClassProgramName'} = $CONST_CLASS_PROGRAM_NAME;
$constantName{'ClassSchoolName'} = $CONST_CLASS_SCHOOL_NAME;
$constantName{'Class_ProperNoun'} = $CONST_CLASS_PROPER_NOUN;
$constantName{'Class_Adjective'} = $CONST_CLASS_ADJECTIVE;
$constantName{'Class_Adjective_Verb'} = $CONST_CLASS_ADJECTIVE_VARB;
$constantName{'Class_Adverb'} = $CONST_CLASS_ADVERB;
$constantName{'Class_Rentai_shi'} = $CONST_CLASS_RENTAI_SHI;
$constantName{'Class_Conjunction'} = $CONST_CLASS_CONJUNCTION;
$constantName{'Class_Numeral'} = $CONST_CLASS_NUMERAL;
$constantName{'Class_Emotion'} = $CONST_CLASS_EMOTOIN;
$constantName{'Class_Noun'} = $CONST_CLASS_NOUN;
$constantName{'Class_NounSa'} = $CONST_CLASS_NOUN_SA;
$constantName{'Class_Verb'} = $CONST_CLASS_VERB;
$constantName{'ClassFamilyName'} = $CONST_CLASS_FAMILY_NAME;
$constantName{'ClassGivenName'} = $CONST_CLASS_GIVEN_NAME;
# 表示用テーブル
$classificationName{$CONST_CLASS_MALE_NAME} = "姓名(男性)";
$classificationName{$CONST_CLASS_FEMALE_NAME} = "姓名(女性)";
$classificationName{$CONST_CLASS_UNKNOWN_NAME} = "姓名(不明)";
$classificationName{$CONST_CLASS_TRANCATED_NAME} = "姓名の略した読み";
$classificationName{$CONST_CLASS_PROPER_NOUN} = "固有名詞";
$classificationName{$CONST_CLASS_NAME_FROM_NICKNAME} = "あだ名から姓名へ";
$classificationName{$CONST_CLASS_NICKNAME} = "あだ名";
$classificationName{$CONST_CLASS_PHRASE} = "口癖など";
$classificationName{$CONST_CLASS_PLACE_NAME} = "地名";
$classificationName{$CONST_CLASS_COMPANY_NAME} = "企業名";
$classificationName{$CONST_CLASS_BUILDING_NAME} = "建物名";
$classificationName{$CONST_CLASS_DESIGNER_NAME} = "デザイナー姓名";
$classificationName{$CONST_CLASS_PRODUCT_NAME} = "商品名";
$classificationName{$CONST_CLASS_PARTY_NAME} = "団体名";
$classificationName{$CONST_CLASS_PROGRAM_NAME} = "番組名";
$classificationName{$CONST_CLASS_SCHOOL_NAME} = "学校名";
$classificationName{$CONST_CLASS_ADJECTIVE} = "形容詞";
$classificationName{$CONST_CLASS_ADJECTIVE_VARB} = "形容動詞";
$classificationName{$CONST_CLASS_ADVERB} = "副詞";
$classificationName{$CONST_CLASS_RENTAI_SHI} = "連体詞";
$classificationName{$CONST_CLASS_CONJUNCTION} = "接続詞";
$classificationName{$CONST_CLASS_NUMERAL} = "助数詞";
$classificationName{$CONST_CLASS_EMOTOIN} = "感動詞";
$classificationName{$CONST_CLASS_NOUN} = "名詞";
$classificationName{$CONST_CLASS_NOUN_SA} = "サ変名詞";
$classificationName{$CONST_CLASS_VERB} = "動詞";
$classificationName{$CONST_CLASS_FAMILY_NAME} = "姓";
$classificationName{$CONST_CLASS_GIVEN_NAME} = "名前";

1;
