%{
    #include<stdio.h>
    #include<string.h>

    extern FILE* yyin;
    extern char* yytext;
    extern int yylineno;
    
    void yyerror(char * s);
    int yylex();
%}

%token VOID CHARACTER PRINTF SCANF INT FLOAT CHAR FOR IF ELSE TRUE 
%token FALSE FLOAT_NUM ID LE GE EQ NE GT LT AND OR STR ADD MULTIPLY 
%token DIVIDE SUBTRACT UNARY RETURN BOOL CONST WHILE MAIN INT_NUM
%token SEPARATOR CLASS END_CLASS END_WHILE END_IF END_ELSE ELSE_IF END_FOR
%token STRING END_MAIN FUNCTION END_FUNCTION

%%

program: global SEPARATOR defined SEPARATOR MAIN body END_MAIN {printf("corect sintactic!!\n");}
;

global: statements
| 
;
defined: FUNCTION ID ')' '(' fdatatype ')' ':' parameters ')' body return END_FUNCTION defined
| CLASS '=' ID ')' statements END_CLASS  defined
|
;

parameters: datatype ID init ',' parameters
| datatype ID init
;

datatype: INT 
    | FLOAT 
    | CHAR
    | BOOL
    | STRING
    ;

fdatatype: datatype 
| VOID
;

body: FOR statement ',' condition ',' statement ')' body END_FOR body
    | WHILE condition ')' body END_WHILE body
    | IF condition ')' body END_IF else body
    | statement ';' body
    | PRINTF '(' STR ')' ';' body
    | SCANF '(' STR ',' '&' ID ')' ';' body
    |
    ;


else: ELSE_IF condition ')' body END_ELSE else
| ELSE body END_ELSE
|
;

condition: value relop value 
| TRUE 
| FALSE
;


statements: statements statement ';'
| statement ';'
;
statement: const datatype ID init 
| const datatype ID '['']'
| const datatype ID '['INT_NUM']'
| const datatype ID '['INT_NUM']' '=' '{'list'}'
| ID '=' '{'list'}'
| ID '=' expression 
| ID '['INT_NUM']' '=' value
| ID UNARY 
| UNARY ID
;

list: list ',' value
| value
|
;

const: CONST
|
;

init: '=' expression
| 
;

expression: expression arithmetic value
| value
;

arithmetic: ADD 
| SUBTRACT 
| MULTIPLY
| DIVIDE
;

relop: LT
| GT
| LE
| GE
| EQ
| NE
;

value: INT_NUM
| FLOAT_NUM
| CHARACTER
| ID
| STR
;

return: RETURN value ';' 
|
;

%%

void yyerror(char * s){
  printf("eroare: %s la linia:%d\n",s,yylineno);
}

int main(int argc, char** argv){
  yyin=fopen(argv[1],"r");
  yyparse();
} 