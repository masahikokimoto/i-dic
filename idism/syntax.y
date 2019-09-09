/*  -*- fundamental -*-
   syntax.pl
*/

%{    
%}

%start lines

%token CR_EXC		/* '!' */    
%token CR_DQ		/* '"' */
%token CR_SHRP		/* '#' */
%token CR_DOL		/* '$' */
%token CR_PCNT		/* '%' */
%token CR_AND		/* '&' */
%token CR_SQ		/* ''' */
%token CR_LP		/* '(' */
%token CR_RP		/* ')' */
%token CR_ASTR		/* '*' */
%token CR_PLUS		/* '+' */
%token CR_CMMA		/* ',' */
%token CR_MINS		/* '-' */
%token CR_DOT		/* '.' */
%token CR_SLSH		/* '/' */
%token CR_COLN		/* ':' */
%token CR_SEMI		/* ';' */
%token CR_CRES		/* '<' */
%token CR_EQ		/* '=' */
%token CR_DCRS		/* '>' */
%token CR_QST		/* '?' */
%token CR_AT		/* '@' */
%token CR_LBKT		/* '[' */
%token CR_BSL		/* '\' */
%token CR_RBKT		/* ']' */
%token CR_HAT		/* '^' */
%token CR_USCR		/* '_' */
%token CR_BQ		/* '`' */
%token CR_LBRA		/* '{' */
%token CR_VBAR		/* '|' */
%token CR_RBRA		/* '}' */
%token CR_TIDE		/* '~' */

%token RANGE		/* low .. value .. high */
%token LOG_OR
%token LOG_AND

%token  ERROR		/* syntax error (exit) */
%token  CONST		/* constant value */
%token  STRFUNC		/* string function name */

/* operators */
%token COMP
%token EQUA
%token REGULAR

%left CR_CMMA
%right CR_QST CR_COLN
%left LOG_OR
%left LOG_AND
%left EQUA REGULAR
%left COMP RANGE
%left CR_PLUS CR_MINS
%left CR_SLSH CR_ASTR CR_PCNT
%left UMINUS

%%

lines	: /* empty */
	{ return ($TRUE); }
	| expr
	{
	    if ($1) {
		return ($TRUE);
	    } else {
		return ($FALSE);
	    }
	}
	;

expr	: CONST
	{ $$ = $1; }
	| expr CR_PLUS expr
	{ $$ = $1 + $3; }
	| expr CR_MINS expr
	{ $$ = $1 - $3; }
	| expr CR_ASTR expr
	{ $$ = $1 * $3; }
	| expr CR_PCNT expr
	{
	    if (int($3) == 0) {
		/* error DIV0 */
		&error("Devide by Zero");
	    } else {
		$$ = $1 % $3;
	    }
	}
	| expr CR_SLSH expr
	{
	    if (int($3) == 0) {
		/* error DIV0 */
		&error("Devide by Zero");
	    } else {
		$$ = $1 / $3;
	    }
	}
	| expr COMP expr
	{
	    if ($2 == $COMP_LT) {
                $$ = (int($1) != 0) && ($1 < $3);
	    } elsif ($2 == $COMP_EL) {
	        $$ = (int($1) != 0) && ($1 <= $3);
	    } elsif ($2 == $COMP_GT) {
	        $$ = (int($3) != 0) && ($1 > $3);
	    } elsif ($2 == $COMP_EG) {
	        $$ = (int($3) != 0) && ($1 >= $3);
	    } else {
		&error("Internal error: expr COMP expr");
	    }
	}
	| expr EQUA expr
	{
	    if ($2 == $COMP_EQ) {
		$$ = (int($1) == int($3));
	    } elsif ($2 == $COMP_NE) {
		$$ = (int($1) != int($3));
	    } elsif ($2 == $COMP_STR_EQ) {
		$$ = ($1 eq $3);
	    } elsif ($2 == $COMP_STR_NE) {
		$$ = ($1 ne $3);
	    } else {
		&error("Interal error: expr EQUA expr");
	    }
	}
	| expr LOG_AND expr
	{ $$ = ($1 && $3); }
	| expr LOG_OR expr
	{ $$ = ($1 || $3); }
	| CR_MINS expr %prec UMINUS
	{ $$ = - $2; }
	| CR_PLUS expr %prec UMINUS
	{ $$ = $2; }
	| CR_EXC expr %prec UMINUS
	{ $$ = ! $2; }
	| expr CR_QST expr CR_COLN expr
	{ $$ = $1 ? $3 : $5; }
	| CR_LP expr CR_RP
	{ $$ = $2; }
	| expr CR_CMMA expr
	{ $$ = $3; }
	| expr RANGE CONST RANGE expr
	{ $$ = ($1 <= $3 && $3 <= $5); }
	| CONST REGULAR CONST
	{ $$ = ($1 =~ /$3/); }
	| ERROR
	{ &error("Syntax error"); }
	;
%%

sub yyerror
{
    printf(STDERR "Error: %s\n", @_);
    exit;
}
1;
