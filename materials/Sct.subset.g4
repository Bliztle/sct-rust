grammar Sct;

start: (class_def)* EOF;

// All argument definitions are here
args_def: (type ID (COMMA type ID)*)?;
args_agent: (ID COLON expression (COMMA ID COLON expression)*)?;
args_call: (expression (COMMA expression)*)?;

// Statements
statement_list: statement*;
statement:
	expression SEMI	# ExpressionStatement
	| declaration	# StatementTag
	| assignment	# StatementTag
	| if			# StatementTag
	| while			# StatementTag
	| enter			# StatementTag
	| create		# StatementTag
	| destroy		# StatementTag;

declaration:
	type ID ASSIGN expression SEMI # variableDeclaration;
assignment: ID ASSIGN expression SEMI;
if:
	IF LPAREN expression RPAREN LCURLY statement_list RCURLY ;
while:
	WHILE LPAREN expression RPAREN LCURLY statement_list RCURLY;
enter: ENTER ID SEMI;
create: CREATE agent_create SEMI;
destroy: DESTROY SEMI;

// Expressions
expression:
	LIT									# LiteralExpression
	| ID								# IDExpression
	| LPAREN expression RPAREN			# ParenthesisExpression
	| unary_minus = MINUS expression	# UnaryMinusExpression
	| not = NOT expression				# LogicalNotExpression
	| expression op = MULT expression	# BinaryExpression
	| expression op = DIV expression	# BinaryExpression
	| expression op = MOD expression	# BinaryExpression
	| expression op = PLUS expression	# BinaryExpression
	| expression op = MINUS expression	# BinaryExpression
	| expression op = GT expression		# BooleanExpression
	| expression op = LT expression		# BooleanExpression
	| expression op = GTE expression	# BooleanExpression
	| expression op = LTE expression	# BooleanExpression
	| expression op = EQ expression		# BooleanExpression
	| expression op = NEQ expression	# BooleanExpression
	| expression op = AND expression	# BooleanExpression
	| expression op = OR expression		# BooleanExpression;

// Class
class_def:
	CLASS ID LPAREN args_def RPAREN LCURLY class_body RCURLY;
class_body: (state)*;

state: STATE ID LCURLY statement_list RCURLY;

// Not using literals probably allows WS arround '::'
agent_create: ID DBL_COLON ID LPAREN args_agent RPAREN;

type: T_INT;
T_INT: 'int';

ASSIGN: '=';
IF: 'if';
WHILE: 'while';
ENTER: 'enter';
CREATE: 'create';
DESTROY: 'destroy';

MULT: '*';
DIV: '/';
PLUS: '+';
MINUS: '-';
MOD: '%';
AND: '&&';
OR: '||';
EQ: '==';
NEQ: '!=';
GT: '>';
LT: '<';
GTE: '>=';
LTE: '<=';
NOT: '!';

CLASS: 'class';
STATE: 'state';

WS: [ \t\r\n]+ -> skip;
COMMENT: '//' ~[\r\n]* -> skip;

LPAREN: '(';
RPAREN: ')';
LCURLY: '{';
RCURLY: '}';
SEMI: ';';
COMMA: ',';
COLON: ':';
DBL_COLON: '::';
ID: [a-zA-Z_][a-zA-Z_0-9]*;
LIT: INT;
INT: [0-9]+;