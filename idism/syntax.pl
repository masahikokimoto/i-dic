$yysccsid = "@(#)yaccpar 1.8 (Berkeley) 01/20/91 (Perl 2.0 12/31/92)";
#define YYBYACC 1
#line 5 "syntax.y"
    
#line 6 "y.tab.pl"
$CR_EXC=257;
$CR_DQ=258;
$CR_SHRP=259;
$CR_DOL=260;
$CR_PCNT=261;
$CR_AND=262;
$CR_SQ=263;
$CR_LP=264;
$CR_RP=265;
$CR_ASTR=266;
$CR_PLUS=267;
$CR_CMMA=268;
$CR_MINS=269;
$CR_DOT=270;
$CR_SLSH=271;
$CR_COLN=272;
$CR_SEMI=273;
$CR_CRES=274;
$CR_EQ=275;
$CR_DCRS=276;
$CR_QST=277;
$CR_AT=278;
$CR_LBKT=279;
$CR_BSL=280;
$CR_RBKT=281;
$CR_HAT=282;
$CR_USCR=283;
$CR_BQ=284;
$CR_LBRA=285;
$CR_VBAR=286;
$CR_RBRA=287;
$CR_TIDE=288;
$RANGE=289;
$LOG_OR=290;
$LOG_AND=291;
$ERROR=292;
$CONST=293;
$STRFUNC=294;
$COMP=295;
$EQUA=296;
$REGULAR=297;
$UMINUS=298;
$YYERRCODE=256;
@yylhs = (                                               -1,
    0,    0,    1,    1,    1,    1,    1,    1,    1,    1,
    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
    1,
);
@yylen = (                                                2,
    0,    1,    1,    3,    3,    3,    3,    3,    3,    3,
    3,    3,    2,    2,    2,    5,    3,    3,    5,    3,
    1,
);
@yydefred = (                                             0,
    0,    0,    0,    0,   21,    0,    0,    0,   15,    0,
   14,   13,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,   17,   20,    7,    6,    0,
    0,    0,    8,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,
);
@yydgoto = (                                              7,
    8,
);
@yysindex = (                                          -234,
 -234, -234, -234, -234,    0, -297,    0, -167,    0, -220,
    0,    0, -291, -234, -234, -234, -234, -234, -234, -234,
 -286, -234, -234, -234, -234,    0,    0,    0,    0, -232,
 -152, -232,    0, -205, -281, -135, -121, -188, -104, -234,
 -234, -152, -188,
);
@yyrindex = (                                             9,
    0,    0,    0,    0,    0,    1,    0,   10,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,   12,
   95,   44,    0,    0,    0,   97,   54,   52,   89,    0,
    0,  103,   60,
);
@yygindex = (                                             0,
    2,
);
$YYTABLESIZE=387;
@yytable = (                                             13,
    3,   27,    9,   10,   11,   12,   35,   41,    1,    2,
    0,    4,    0,    0,    0,   28,   29,   30,   31,   32,
   33,   34,    1,   36,   37,   38,   39,    0,   14,    2,
    0,    0,    3,   15,    4,    0,    0,    0,   19,    0,
   14,   42,   43,    5,   26,   15,   16,   17,   18,    0,
   19,    9,    0,   11,    0,   14,   20,    5,    6,   19,
   15,   16,   17,   18,    0,   19,   40,    0,   21,   22,
   23,   20,   14,    0,   24,   25,    0,   15,   16,    0,
   18,    0,   19,   21,   22,   23,    0,    0,   10,   24,
   25,    0,    0,   14,   18,    0,   12,    0,   15,   16,
   17,   18,   16,   19,    0,    0,    0,    0,   14,   20,
    0,    0,    0,   15,   16,    0,   18,    0,   19,    0,
    0,   21,   22,   23,   20,   14,    0,   24,   25,    0,
   15,   16,    0,   18,    0,   19,   21,   22,   23,   14,
    0,    0,   24,   25,   15,   16,    0,   18,    0,   19,
    0,    0,    0,   21,    0,   23,   14,    0,    0,   24,
   25,   15,   16,    0,   18,    0,   19,   21,    0,    0,
    0,    0,    0,   24,   25,    0,    0,    0,    0,    0,
    0,    0,    0,    0,   21,    0,    0,    0,    0,    0,
   24,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    3,    0,    0,    0,    3,    3,    3,    3,    3,
    0,    3,    3,    0,    0,    0,    4,    3,    4,    4,
    4,    0,    0,    4,    0,    0,    0,    0,    4,    3,
    3,    3,    0,    0,    0,    3,    3,    0,    0,    0,
    4,    4,    4,    0,    0,    0,    4,    4,    5,    0,
    5,    5,    5,    0,    0,    5,    9,    0,   11,    9,
    5,   11,    0,    9,   19,   11,    0,   19,    9,    0,
   11,   19,    5,    5,    5,    0,   19,    0,    5,    5,
    9,    9,    9,   11,   11,    0,    9,    9,   19,   19,
   19,    0,    0,   10,   19,   19,   10,    0,    0,   18,
   10,   12,   18,    0,   12,   10,   18,   16,   12,    0,
   16,    0,    0,   12,   16,    0,    0,    0,   10,   10,
    0,    0,    0,    0,   10,    0,   12,
);
@yycheck = (                                            297,
    0,  293,    1,    2,    3,    4,  293,  289,    0,    0,
   -1,    0,   -1,   -1,   -1,   14,   15,   16,   17,   18,
   19,   20,  257,   22,   23,   24,   25,   -1,  261,  264,
   -1,   -1,  267,  266,  269,   -1,   -1,   -1,  271,   -1,
  261,   40,   41,    0,  265,  266,  267,  268,  269,   -1,
  271,    0,   -1,    0,   -1,  261,  277,  292,  293,    0,
  266,  267,  268,  269,   -1,  271,  272,   -1,  289,  290,
  291,  277,  261,   -1,  295,  296,   -1,  266,  267,   -1,
  269,   -1,  271,  289,  290,  291,   -1,   -1,    0,  295,
  296,   -1,   -1,  261,    0,   -1,    0,   -1,  266,  267,
  268,  269,    0,  271,   -1,   -1,   -1,   -1,  261,  277,
   -1,   -1,   -1,  266,  267,   -1,  269,   -1,  271,   -1,
   -1,  289,  290,  291,  277,  261,   -1,  295,  296,   -1,
  266,  267,   -1,  269,   -1,  271,  289,  290,  291,  261,
   -1,   -1,  295,  296,  266,  267,   -1,  269,   -1,  271,
   -1,   -1,   -1,  289,   -1,  291,  261,   -1,   -1,  295,
  296,  266,  267,   -1,  269,   -1,  271,  289,   -1,   -1,
   -1,   -1,   -1,  295,  296,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,  289,   -1,   -1,   -1,   -1,   -1,
  295,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,  261,   -1,   -1,   -1,  265,  266,  267,  268,  269,
   -1,  271,  272,   -1,   -1,   -1,  265,  277,  267,  268,
  269,   -1,   -1,  272,   -1,   -1,   -1,   -1,  277,  289,
  290,  291,   -1,   -1,   -1,  295,  296,   -1,   -1,   -1,
  289,  290,  291,   -1,   -1,   -1,  295,  296,  265,   -1,
  267,  268,  269,   -1,   -1,  272,  265,   -1,  265,  268,
  277,  268,   -1,  272,  265,  272,   -1,  268,  277,   -1,
  277,  272,  289,  290,  291,   -1,  277,   -1,  295,  296,
  289,  290,  291,  290,  291,   -1,  295,  296,  289,  290,
  291,   -1,   -1,  265,  295,  296,  268,   -1,   -1,  265,
  272,  265,  268,   -1,  268,  277,  272,  265,  272,   -1,
  268,   -1,   -1,  277,  272,   -1,   -1,   -1,  290,  291,
   -1,   -1,   -1,   -1,  296,   -1,  290,
);
$YYFINAL=7;
#ifndef YYDEBUG
#define YYDEBUG 0
#endif
$YYMAXTOKEN=298;
#if YYDEBUG
@yyname = (
"end-of-file",'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',
'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',
'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',
'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',
'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',
'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',
'','','','','','','','','','','','','','','','','','','','','','','',"CR_EXC","CR_DQ","CR_SHRP",
"CR_DOL","CR_PCNT","CR_AND","CR_SQ","CR_LP","CR_RP","CR_ASTR","CR_PLUS",
"CR_CMMA","CR_MINS","CR_DOT","CR_SLSH","CR_COLN","CR_SEMI","CR_CRES","CR_EQ",
"CR_DCRS","CR_QST","CR_AT","CR_LBKT","CR_BSL","CR_RBKT","CR_HAT","CR_USCR",
"CR_BQ","CR_LBRA","CR_VBAR","CR_RBRA","CR_TIDE","RANGE","LOG_OR","LOG_AND",
"ERROR","CONST","STRFUNC","COMP","EQUA","REGULAR","UMINUS",
);
@yyrule = (
"\$accept : lines",
"lines :",
"lines : expr",
"expr : CONST",
"expr : expr CR_PLUS expr",
"expr : expr CR_MINS expr",
"expr : expr CR_ASTR expr",
"expr : expr CR_PCNT expr",
"expr : expr CR_SLSH expr",
"expr : expr COMP expr",
"expr : expr EQUA expr",
"expr : expr LOG_AND expr",
"expr : expr LOG_OR expr",
"expr : CR_MINS expr",
"expr : CR_PLUS expr",
"expr : CR_EXC expr",
"expr : expr CR_QST expr CR_COLN expr",
"expr : CR_LP expr CR_RP",
"expr : expr CR_CMMA expr",
"expr : expr RANGE CONST RANGE expr",
"expr : CONST REGULAR CONST",
"expr : ERROR",
);
#endif
sub yyclearin { $yychar = -1; }
sub yyerrok { $yyerrflag = 0; }
$YYSTACKSIZE = $YYSTACKSIZE || $YYMAXDEPTH || 500;
$YYMAXDEPTH = $YYMAXDEPTH || $YYSTACKSIZE || 500;
$yyss[$YYSTACKSIZE] = 0;
$yyvs[$YYSTACKSIZE] = 0;
sub YYERROR { ++$yynerrs; &yy_err_recover; }
sub yy_err_recover
{
  if ($yyerrflag < 3)
  {
    $yyerrflag = 3;
    while (1)
    {
      if (($yyn = $yysindex[$yyss[$yyssp]]) && 
          ($yyn += $YYERRCODE) >= 0 && 
          $yycheck[$yyn] == $YYERRCODE)
      {
#if YYDEBUG
       print "yydebug: state $yyss[$yyssp], error recovery shifting",
             " to state $yytable[$yyn]\n" if $yydebug;
#endif
        $yyss[++$yyssp] = $yystate = $yytable[$yyn];
        $yyvs[++$yyvsp] = $yylval;
        next yyloop;
      }
      else
      {
#if YYDEBUG
        print "yydebug: error recovery discarding state ",
              $yyss[$yyssp], "\n"  if $yydebug;
#endif
        return(1) if $yyssp <= 0;
        --$yyssp;
        --$yyvsp;
      }
    }
  }
  else
  {
    return (1) if $yychar == 0;
#if YYDEBUG
    if ($yydebug)
    {
      $yys = '';
      if ($yychar <= $YYMAXTOKEN) { $yys = $yyname[$yychar]; }
      if (!$yys) { $yys = 'illegal-symbol'; }
      print "yydebug: state $yystate, error recovery discards ",
            "token $yychar ($yys)\n";
    }
#endif
    $yychar = -1;
    next yyloop;
  }
0;
} # yy_err_recover

sub yyparse
{
#ifdef YYDEBUG
  if ($yys = $ENV{'YYDEBUG'})
  {
    $yydebug = int($1) if $yys =~ /^(\d)/;
  }
#endif

  $yynerrs = 0;
  $yyerrflag = 0;
  $yychar = (-1);

  $yyssp = 0;
  $yyvsp = 0;
  $yyss[$yyssp] = $yystate = 0;

yyloop: while(1)
  {
    yyreduce: {
      last yyreduce if ($yyn = $yydefred[$yystate]);
      if ($yychar < 0)
      {
        if (($yychar = &yylex) < 0) { $yychar = 0; }
#if YYDEBUG
        if ($yydebug)
        {
          $yys = '';
          if ($yychar <= $#yyname) { $yys = $yyname[$yychar]; }
          if (!$yys) { $yys = 'illegal-symbol'; };
          print "yydebug: state $yystate, reading $yychar ($yys)\n";
        }
#endif
      }
      if (($yyn = $yysindex[$yystate]) && ($yyn += $yychar) >= 0 &&
              $yycheck[$yyn] == $yychar)
      {
#if YYDEBUG
        print "yydebug: state $yystate, shifting to state ",
              $yytable[$yyn], "\n"  if $yydebug;
#endif
        $yyss[++$yyssp] = $yystate = $yytable[$yyn];
        $yyvs[++$yyvsp] = $yylval;
        $yychar = (-1);
        --$yyerrflag if $yyerrflag > 0;
        next yyloop;
      }
      if (($yyn = $yyrindex[$yystate]) && ($yyn += $yychar) >= 0 &&
            $yycheck[$yyn] == $yychar)
      {
        $yyn = $yytable[$yyn];
        last yyreduce;
      }
      if (! $yyerrflag) {
        &yyerror('syntax error');
        ++$yynerrs;
      }
      return(1) if &yy_err_recover;
    } # yyreduce
#if YYDEBUG
    print "yydebug: state $yystate, reducing by rule ",
          "$yyn ($yyrule[$yyn])\n"  if $yydebug;
#endif
    $yym = $yylen[$yyn];
    $yyval = $yyvs[$yyvsp+1-$yym];
    switch:
    {
if ($yyn == 1) {
#line 69 "syntax.y"
{ return ($TRUE); 
last switch;
} }
if ($yyn == 2) {
#line 71 "syntax.y"
{
	    if ($yyvs[$yyvsp-0]) {
		return ($TRUE);
	    } else {
		return ($FALSE);
	    }
	
last switch;
} }
if ($yyn == 3) {
#line 81 "syntax.y"
{ $yyval = $yyvs[$yyvsp-0]; 
last switch;
} }
if ($yyn == 4) {
#line 83 "syntax.y"
{ $yyval = $yyvs[$yyvsp-2] + $yyvs[$yyvsp-0]; 
last switch;
} }
if ($yyn == 5) {
#line 85 "syntax.y"
{ $yyval = $yyvs[$yyvsp-2] - $yyvs[$yyvsp-0]; 
last switch;
} }
if ($yyn == 6) {
#line 87 "syntax.y"
{ $yyval = $yyvs[$yyvsp-2] * $yyvs[$yyvsp-0]; 
last switch;
} }
if ($yyn == 7) {
#line 89 "syntax.y"
{
	    if (int($yyvs[$yyvsp-0]) == 0) {
		# error DIV0 

		&error("Devide by Zero");
	    } else {
		$yyval = $yyvs[$yyvsp-2] % $yyvs[$yyvsp-0];
	    }
	
last switch;
} }
if ($yyn == 8) {
#line 98 "syntax.y"
{
	    if (int($yyvs[$yyvsp-0]) == 0) {
		# error DIV0 

		&error("Devide by Zero");
	    } else {
		$yyval = $yyvs[$yyvsp-2] / $yyvs[$yyvsp-0];
	    }
	
last switch;
} }
if ($yyn == 9) {
#line 107 "syntax.y"
{
	    if ($yyvs[$yyvsp-1] == $COMP_LT) {
                $yyval = (int($yyvs[$yyvsp-2]) != 0) && ($yyvs[$yyvsp-2] < $yyvs[$yyvsp-0]);
	    } elsif ($yyvs[$yyvsp-1] == $COMP_EL) {
	        $yyval = (int($yyvs[$yyvsp-2]) != 0) && ($yyvs[$yyvsp-2] <= $yyvs[$yyvsp-0]);
	    } elsif ($yyvs[$yyvsp-1] == $COMP_GT) {
	        $yyval = (int($yyvs[$yyvsp-0]) != 0) && ($yyvs[$yyvsp-2] > $yyvs[$yyvsp-0]);
	    } elsif ($yyvs[$yyvsp-1] == $COMP_EG) {
	        $yyval = (int($yyvs[$yyvsp-0]) != 0) && ($yyvs[$yyvsp-2] >= $yyvs[$yyvsp-0]);
	    } else {
		&error("Internal error: expr COMP expr");
	    }
	
last switch;
} }
if ($yyn == 10) {
#line 121 "syntax.y"
{
	    if ($yyvs[$yyvsp-1] == $COMP_EQ) {
		$yyval = (int($yyvs[$yyvsp-2]) == int($yyvs[$yyvsp-0]));
	    } elsif ($yyvs[$yyvsp-1] == $COMP_NE) {
		$yyval = (int($yyvs[$yyvsp-2]) != int($yyvs[$yyvsp-0]));
	    } elsif ($yyvs[$yyvsp-1] == $COMP_STR_EQ) {
		$yyval = ($yyvs[$yyvsp-2] eq $yyvs[$yyvsp-0]);
	    } elsif ($yyvs[$yyvsp-1] == $COMP_STR_NE) {
		$yyval = ($yyvs[$yyvsp-2] ne $yyvs[$yyvsp-0]);
	    } else {
		&error("Interal error: expr EQUA expr");
	    }
	
last switch;
} }
if ($yyn == 11) {
#line 135 "syntax.y"
{ $yyval = ($yyvs[$yyvsp-2] && $yyvs[$yyvsp-0]); 
last switch;
} }
if ($yyn == 12) {
#line 137 "syntax.y"
{ $yyval = ($yyvs[$yyvsp-2] || $yyvs[$yyvsp-0]); 
last switch;
} }
if ($yyn == 13) {
#line 139 "syntax.y"
{ $yyval = - $yyvs[$yyvsp-0]; 
last switch;
} }
if ($yyn == 14) {
#line 141 "syntax.y"
{ $yyval = $yyvs[$yyvsp-0]; 
last switch;
} }
if ($yyn == 15) {
#line 143 "syntax.y"
{ $yyval = ! $yyvs[$yyvsp-0]; 
last switch;
} }
if ($yyn == 16) {
#line 145 "syntax.y"
{ $yyval = $yyvs[$yyvsp-4] ? $yyvs[$yyvsp-2] : $yyvs[$yyvsp-0]; 
last switch;
} }
if ($yyn == 17) {
#line 147 "syntax.y"
{ $yyval = $yyvs[$yyvsp-1]; 
last switch;
} }
if ($yyn == 18) {
#line 149 "syntax.y"
{ $yyval = $yyvs[$yyvsp-0]; 
last switch;
} }
if ($yyn == 19) {
#line 151 "syntax.y"
{ $yyval = ($yyvs[$yyvsp-4] <= $yyvs[$yyvsp-2] && $yyvs[$yyvsp-2] <= $yyvs[$yyvsp-0]); 
last switch;
} }
if ($yyn == 20) {
#line 153 "syntax.y"
{ $yyval = ($yyvs[$yyvsp-2] =~ /$yyvs[$yyvsp-0]/); 
last switch;
} }
if ($yyn == 21) {
#line 155 "syntax.y"
{ &error("Syntax error"); 
last switch;
} }
#line 490 "y.tab.pl"
    } # switch
    $yyssp -= $yym;
    $yystate = $yyss[$yyssp];
    $yyvsp -= $yym;
    $yym = $yylhs[$yyn];
    if ($yystate == 0 && $yym == 0)
    {
#if YYDEBUG
      print "yydebug: after reduction, shifting from state 0 ",
            "to state $YYFINAL\n" if $yydebug;
#endif
      $yystate = $YYFINAL;
      $yyss[++$yyssp] = $YYFINAL;
      $yyvs[++$yyvsp] = $yyval;
      if ($yychar < 0)
      {
        if (($yychar = &yylex) < 0) { $yychar = 0; }
#if YYDEBUG
        if ($yydebug)
        {
          $yys = '';
          if ($yychar <= $#yyname) { $yys = $yyname[$yychar]; }
          if (!$yys) { $yys = 'illegal-symbol'; }
          print "yydebug: state $YYFINAL, reading $yychar ($yys)\n";
        }
#endif
      }
      return(0) if $yychar == 0;
      next yyloop;
    }
    if (($yyn = $yygindex[$yym]) && ($yyn += $yystate) >= 0 &&
        $yyn <= $#yycheck && $yycheck[$yyn] == $yystate)
    {
        $yystate = $yytable[$yyn];
    } else {
        $yystate = $yydgoto[$yym];
    }
#if YYDEBUG
    print "yydebug: after reduction, shifting from state ",
        "$yyss[$yyssp] to state $yystate\n" if $yydebug;
#endif
    $yyss[++$yyssp] = $yystate;
    $yyvs[++$yyvsp] = $yyval;
  } # yyloop
} # yyparse
#line 158 "syntax.y"

sub yyerror
{
    printf(STDERR "Error: %s\n", @_);
    exit;
}
1;
#line 544 "y.tab.pl"
