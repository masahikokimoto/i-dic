#################################
# yylex

#################################
# 変数
@token = ();			# トークンの種別
@tokenValue = ();		# トークンの内容
$line = 1;			# 行番号
$expr = "";			# 処理中の式
$tokenIndex = 0;		# 評価時のトークン位置

#################################
# 変数名(演算しなければならないもの)
$calcVariableName{$CVAR_AGE} = $CVAR_AGE;
$calcVariableName{$CVAR_ZODIAC} = $CVAR_ZODIAC;
$calcVariableName{$CVAR_FAMILY_NAME} = $CVAR_FAMILY_NAME;
$calcVariableName{$CVAR_GIVEN_NAME} = $CVAR_GIVEN_NAME;
$calcVariableName{$CVAR_FAMILY_NAME_DESCRIPTION} =
    $CVAR_FAMILY_NAME_DESCRIPTION;
$calcVariableName{$CVAR_GIVEN_NAME_DESCRIPTION} = $CVAR_GIVEN_NAME_DESCRIPTION;
$calcVariableName{$CVAR_ROMAN_NAME} = $CVAR_ROMAN_NAME;
$calcVariableName{$CVAR_ROMAN_FAMILY_NAME} = $CVAR_ROMAN_FAMILY_NAME;
$calcVariableName{$CVAR_ROMAN_GIVEN_NAME} = $CVAR_ROMAN_GIVEN_NAME;
$calcVariableName{$CVAR_INITIAL} = $CVAR_INITIAL;
$calcVariableName{$CVAR_FAMILY_NAME_INITIAL} = $CVAR_FAMILY_NAME_INITIAL;
$calcVariableName{$CVAR_GIVEN_NAME_INITIAL} = $CVAR_GIVEN_NAME_INITIAL;
$calcVariableName{$CVAR_BIRTH_DATE} = $CVAR_BIRTH_DATE;
$calcVariableName{$CVAR_DEBUT_DATE} = $CVAR_DEBUT_DATE;
$calcVariableName{$CVAR_SEX} = $CVAR_SEX;
#
$calcVariableName{$CVAR_NOW_YEAR} = $CVAR_NOW_YEAR;
$calcVariableName{$CVAR_NOW_MONTH} = $CVAR_NOW_MONTH;
$calcVariableName{$CVAR_NOW_DAY} = $CVAR_NOW_DAY;
$calcVariableName{$CVAR_NOW_DATE} = $CVAR_NOW_DATE;

#################################
# 定数値
$constantName{'All'} = $CONST_ALL;
$constantName{'True'} = $TRUE;
$constantName{'False'} = $FALSE;
$constantName{'Male'} = $CONST_MALE;
$constantName{'Femail'} = $CONST_FEMALE;
$constantName{'Null'} = "";

#################################
# 演算子
$operator{'..'} = $RANGE;
$operator{'&&'} = $LOG_AND;
$operator{'||'} = $LOG_OR;
$operator{'<='} = $COMP_EL;
$operator{'<>'} = $COMP_NE;
$operator{'<'} = $COMP_LT;
$operator{'>='} = $COMP_EG;
$operator{'=='} = $COMP_EQ;
$operator{'=>'} = $COMP_EG;
$operator{'=<'} = $COMP_EL;
$operator{'!='} = $COMP_NE;
$operator{'eq'} = $COMP_STR_EQ;
$operator{'ne'} = $COMP_STR_NE;
$operator{'=~'} = $REGULAR;

#################################
# その他の文字
$character{'!'} = $CR_EXC;
$character{'\"'} = $CR_DQ;
$character{'#'} = $CR_SHRP;
$character{'$'} = $CR_DOL;
$character{'%'} = $CR_PCNT;
$character{'&'} = $CR_AND;
$character{'\''} = $CR_SQ;
$character{'('} = $CR_LP;
$character{')'} = $CR_RP;
$character{'*'} = $CR_ASTR;
$character{'+'} = $CR_PLUS;
$character{','} = $CR_CMMA;
$character{'-'} = $CR_MINS;
$character{'.'} = $CR_DOT;
$character{'/'} = $CR_SLSH;
$character{':'} = $CR_COLN;
$character{';'} = $CR_SEMI;
$character{'<'} = $CR_CRES;
$character{'='} = $CR_EQ;
$character{'>'} = $CR_DCRS;
$character{'?'} = $CR_QST;
$character{'@'} = $CR_AT;
$character{'['} = $CR_LBKT;
$character{'\\'} = $CR_BSL;
$character{']'} = $CR_RBKT;
$character{'^'} = $CR_HAT;
$character{'_'} = $CR_USCR;
$character{'\`'} = $CR_BQ;
$character{'{'} = $CR_LBRA;
$character{'|'} = $CR_VBAR;
$character{'~'} = $CR_TIDE;

#################################
# $expression に式が入っている
sub convToken
{
    local($str);
    
    $expr = $expression;
    while($TRUE) {
	if ($expr eq "") {
	    push(token, $TOKEN_EOF);
	    push(tokenValue, 0);
	    last;
	}
	$str = &getStr;
	while ($str =~ /[ \t]/o) {
	    $str = &getStr;	# skip over blanks
	}
	# 改行
	if ($str eq "\n") {
	    push(token, $TOKEN_NEW_LINE);
	    push(tokenValue, 0);
	    $line++;
	    next;
	}
	# 文字列
	if ($str eq "\"") {
	    # 改行が入ってもよくなっている
	    push(token, $TOKEN_CONSTANT);
	    push(tokenValue, &getStrToChar("\""));
	    next;
	}
	# シンボル名
	if ($variableName{$str}) {
	    push(token, $TOKEN_VARIABLE);
	    push(tokenValue, $variableName{$str});
	    next;
	}
	if ($calcVariableName{$str}) {
	    push(token, $TOKEN_CVARIABLE);
	    push(tokenValue, $calcVariableName{$str});
	    next;
	}
	if ($constantName{$str}) {
	    push(token, $TOKEN_CONSTANT);
	    push(tokenValue, $constantName{$str});
	    next;
	}
	# 演算子
	if ($operator{$str}) {
	    push(token, $TOKEN_OPERATOR);
	    push(tokenValue, $operator{$str});
	    next;
	}
	# 数字
	if ($str =~ /^\d*$/o) {
	    push(token, $TOKEN_CONSTANT);
	    push(tokenValue, $str);
	    next;
	}
	# その他の文字
	if ($character{$str}) {
	    push(token, $TOKEN_CHAR);
	    push(tokenValue, $character{$str});
	    next;
	}
	&error("line $line: Syntax error '$str'");
    }
}

#################################
# $expr から記号１文字、もしくはシンボル、数値を得る
sub getStr # return $str
{
    $expr =~ /^(\w*|\d*)/o;
    if ($& ne "") {
	$expr = $';
	return $&;
    }
    $expr =~ /^(\s|\.\.|\&\&|\|\||<[=>]|>=|=[=><]|!=)/o;
    if ($& ne "") {
	$expr = $';
	return $&;
    }
    $expr =~ /^[^\w\d\s]/o;
    if ($& ne "") {
	$expr = $';
	return $&;
    }
    &error("line $line: Internal error. Can't convert to token");
}   

#################################
# $expr 文字列を戻す
sub ungetStr # return void
{
    $expr = $_[0] . $expr;
}

#################################
# $expr から文字 $_[0] までを返す
sub getStrToChar # return $str
{
    $expr =~ /$_[0]/;
    $expr = $';
    $`;
}

#################################
# デバッグ用:トークンのダンプ
sub dumpToken
{
    local($i);
    
    print "Expression: $expression\n";
    for ($i = 0; $i < @token; $i++) {
	if (@token[$i] == $TOKEN_NULL) {
	    print "TOKEN_NULL";
	} elsif (@token[$i] == $TOKEN_EOF) {
	    print "TOKEN_EOF";
	} elsif (@token[$i] == $TOKEN_NEW_LINE) {
	    print "TOKEN_NEW_LINE";
	} elsif (@token[$i] == $TOKEN_VARIABLE) {
	    print "TOKEN_VARIABLE";
	} elsif (@token[$i] == $TOKEN_FUNCTION) {
	    print "TOKEN_FUNCTION";
	} elsif (@token[$i] == $TOKEN_CONSTANT) {
	    print "TOKEN_CONSTANT";
	} elsif (@token[$i] == $TOKEN_OPERATOR) {
	    print "TOKEN_OPERATOR";
	} elsif (@token[$i] == $TOKEN_COMPARE) {
	    print "TOKEN_COMPARE";
	} elsif (@token[$i] == $TOKEN_CHAR) {
	    print "TOKEN_CHAR";
	} elsif (@token[$i] == $TOKEN_CVARIABLE) {
	    print "TOKEN_CVARIABLE";
	} else {
	    print "ERROR";
	}
	print ":" . @tokenValue[$i];
	print "\n";
    }
}

#################################
# yylex
sub yylex
{
    while (@token[$tokenIndex] == $TOKEN_NEW_LINE) {
	$tokenIndex++;
    }
    if (@token[$tokenIndex] == $TOKEN_EOF) {
	$yylval = 0;
	$tokenIndex++;
	return (0);
    } elsif (@token[$tokenIndex] == $TOKEN_VARIABLE) {
	$yylval = $data{@tokenValue[$tokenIndex]};
	$tokenIndex++;
	return ($CONST);
    } elsif (@token[$tokenIndex] == $TOKEN_CVARIABLE) {
	if (!defined($data{@tokenValue[$tokenIndex]})) {
	    &calcData(@tokenValue[$tokenIndex]);
	}
	$yylval = $data{@tokenValue[$tokenIndex]};
	$tokenIndex++;
	return ($CONST);
    } elsif (@token[$tokenIndex] == $TOKEN_CONSTANT) {
	$yylval = @tokenValue[$tokenIndex];
	$tokenIndex++;
	return ($CONST);
    } elsif (@token[$tokenIndex] == $TOKEN_FUNCTION) {
	$yylval = @tokenValue[$tokenIndex];
	$tokenIndex++;
	return ($STRFUNC);
    } elsif (@token[$tokenIndex] == $TOKEN_OPERATOR) {
	if (@tokenValue[$tokenIndex] == $COMP_EQ ||
	    @tokenValue[$tokenIndex] == $COMP_NE ||
	    @tokenValue[$tokenIndex] == $COMP_STR_EQ ||
	    @tokenValue[$tokenIndex] == $COMP_STR_NE) {
	    $yylval = @tokenValue[$tokenIndex];
	    $tokenIndex++;
	    return ($EQUA);
	} elsif (@tokenValue[$tokenIndex] == $COMP_LT ||
		 @tokenValue[$tokenIndex] == $COMP_EL ||
		 @tokenValue[$tokenIndex] == $COMP_GT ||
		 @tokenValue[$tokenIndex] == $COMP_EG) {
	    $yylval = @tokenValue[$tokenIndex];
	    $tokenIndex++;
	    return ($COMP);
	} else {
	    $tokenIndex++;
	    $yylval = 0;
	    return (@tokenValue[$tokenIndex]);
	}
    } elsif (@token[$tokenIndex] == $TOKEN_CHAR) {
	$tokenIndex++;
	$yylval = 0;
	return (@tokenValue[$tokenIndex]);
    }
    &error("Internal error: Unknown token\n");
}

#################################
# トークンに対応する $data{...} を設定する。
sub calcData # ($_[0]:@tokenValue[$tokenIndex]) return void
{
    if ($_[0] eq $CVAR_AGE) {
	$data{$CVAR_AGE} = &calcAge($data{$VAR_BIRTH_YEAR},
				    $data{$VAR_BIRTH_MONTH},
				    $data{$VAR_BIRTH_DAY});
    } elsif ($_[0] eq $CVAR_CZODOAC) {
	$data{$VAR_CZODIAC} = &calcZodiac($data{$VAR_BIRTH_MONTH},
					  $data{$VAR_BIRTH_DAY});
    } elsif ($_[0] eq $CVAR_FAMILY_NAME) {
	($data{$CVAR_FAMILY_NAME}, $data{$CVAR_GIVEN_NAME}) =
	    split(" ", $data{$VAR_NAME});
    } elsif ($_[0] eq $CVAR_GIVEN_NAME) {
	($data{$CVAR_FAMILY_NAME}, $data{$CVAR_GIVEN_NAME}) =
	    split(" ", $data{$VAR_NAME});
    } elsif ($_[0] eq $CVAR_FAMILY_NAME_DESCRIPTION) {
	($data{$CVAR_FAMILY_NAME_DESCRIPTION},
	 $data{$CVAR_GIVEN_NAME_DESCRIPTION}) =
	     split(" ", $data{$VAR_DESCRIPTION});
    } elsif ($_[0] eq $CVAR_GIVEN_NAME_DESCRIPTION) {
	($data{$CVAR_FAMILY_NAME_DESCRIPTION},
	 $data{$CVAR_GIVEN_NAME_DESCRIPTION}) =
	     split(" ", $data{$VAR_DESCRIPTION});
    } elsif ($_[0] eq $CVAR_ROMAN_NAME) {
	$data{$CVAR_ROMAN_NAME} = &roman($data{$VAR_NAME});
    } elsif ($_[0] eq $CVAR_ROMAN_FAMILY_NAME) {
	if (!defined($data{$CVAR_FAMILY_NAME})) {
	    ($data{$CVAR_FAMILY_NAME}, $data{$CVAR_GIVEN_NAME}) =
		split(" ", $data{$VAR_NAME});
	}
	$data{$CVAR_ROMAN_FAMILY_NAME} = &roman($data{$CVAR_FAMILY_NAME});
    } elsif ($_[0] eq $CVAR_ROMAN_GIVEN_NAME) {
	if (!defined($data{$CVAR_GIVEN_NAME})) {
	    ($data{$CVAR_FAMILY_NAME}, $data{$CVAR_GIVEN_NAME}) =
		split(" ", $data{$VAR_NAME});
	}
	$data{$CVAR_ROMAN_GIVEN_NAME} = &roman($data{$CVAR_GIVEN_NAME});
    } elsif ($_[0] eq $CVAR_NOW_YEAR) {
	$data{$CVAR_NOW_YEAR} = $NowYear + 1900;
    } elsif ($_[0] eq $CVAR_NOW_MONTH) {
	$data{$CVAR_NOW_MONTH} = $NowMonth + 1;
    } elsif ($_[0] eq $CVAR_NOW_DAY) {
	$data{$CVAR_NOW_DAY} = $NowDay;
    } elsif ($_[0] eq $CVAR_NOW_DATE) {
	$data{$CVAR_NOW_DATE} = sprintf("%4d/%02d/%02d",
					$NowYear + 1900,
					$NowMonth + 1,
					$NowDay);
    } elsif ($_[0] eq $CVAR_BIRTH_DATE) {
	$data{$CVAR_BIRTH_DATE} = sprintf("%4d/%02d/%02d",
					  $data{$VAR_BIRTH_YEAR},
					  $data{$VAR_BIRTH_MONTH},
					  $data{$VAR_BIRTH_DAY});
    } elsif ($_[0] eq $CVAR_DEBUT_DATE) {
	$data{$CVAR_DEBUT_DATE} = sprintf("%4d/%02d/%02d",
					  $data{$VAR_DEBUT_YEAR},
					  $data{$VAR_DEBUT_MONTH},
					  $data{$VAR_DEBUT_DAY});
    } elsif ($_[0] eq $CVAR_SEX) {
	if ($data{$VAR_CLASSIFICATION} == $CONST_CLASS_MALE_NAME) {
	    $data{$CVAR_SEX} = $CONST_MALE;
	} elsif ($data{$VAR_CLASSIFICATION} == $CONST_CLASS_FEMALE_NAME) {
	    $data{$CVAR_SEX} = $CONST_FEMALE;
	} else {
	    $data{$CVAR_SEX} = $CONST_NULL;
	}
    } elsif ($_[0] eq $CVAR_INITIAL) {
	if (!defined($data{$CVAR_ROMAN_NAME})) {
	    $data{$CVAR_ROMAN_NAME} = &roman($data{$VAR_NAME});
	}
	$data{$CVAR_INITIAL} = substr($data{$CVAR_ROMAN_NAME}, 0, 1) .
	    index($data{$CVAR_ROMAN_NAME}, " ") != -1 ?
		substr($data{$CVAR_ROMAN_NAME},
		       index($data{$CVAR_ROMAN_NAME}, " ") + 1, 1) : "";
    } elsif ($_[0] eq $CVAR_FAMILY_NAME_INITIAL) {
	if (!defined($data{$CVAR_ROMAN_FAMILY_NAME})) {
	    if (!defined($data{$CVAR_FAMILY_NAME})) {
		($data{$CVAR_FAMILY_NAME}, $data{$CVAR_GIVEN_NAME}) =
		    split(" ", $data{$VAR_NAME});
	    }
	    $data{$CVAR_ROMAN_FAMILY_NAME} = &roman($data{$CVAR_FAMILY_NAME});
	}
	$data{$CVAR_FAMILY_NAME_INITIAL} =
	    substr($data{$CVAR_ROMAN_FAMILY_NAME}, 0, 1);
    } elsif ($_[0] eq $CVAR_GIVEN_NAME_INITIAL) {
	if (!defined($data{$CVAR_ROMAN_GIVEN_NAME})) {
	    if (!defined($data{$CVAR_GIVEN_NAME})) {
		($data{$CVAR_FAMILY_NAME}, $data{$CVAR_GIVEN_NAME}) =
		    split(" ", $data{$VAR_NAME});
	    }
	    $data{$CVAR_ROMAN_GIVEN_NAME} = &roman($data{$CVAR_GIVEN_NAME});
	}
	$data{$CVAR_GIVEN_NAME_INITIAL} =
	    substr($data{$CVAR_ROMAN_GIVEN_NAME}, 0, 1);
    } else {
	&error("Internal erorr: Unknown token\n");
    }
}

1;
