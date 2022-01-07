%{
    #include<stdio.h>
    #include<string.h>

    extern FILE* yyin; 
    extern char* yytext;
    extern int yylineno;
    extern int nr_linie;
     int count=0;
    int q;
    char type[10];


    void yyerror(char * s);
    void insert_type_variable();
    int yylex();
    int search(char*type);
    struct variables {
        char * data_type;
        char * id_name;
        char * scope;
        int value;
        int line_no;
      } symbol_table_variables[50];

    struct functions {
        char * id_name;
        char * returned_type;
        int line_no;

        struct f_parameter {
            char* par_name;
            char* type;
        }parameter[10];
        
      } symbol_table_functions[50];

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

void insert_type_variable(){
  strcpy(type,yytext);
}

void add_to_table_var(char c,int val,char* scop) {
  q=search(yytext); /*cautam simbolul in tabel si daca nu il gasim continuam*/
  if(!q) {

    if(c == 'I') {
      symbol_table_variables[count].data_type=strdup("int");
      symbol_table_variables[count].id_name=strdup(yytext);
      symbol_table_variables[count].value=val;
      symbol_table_variables[count].line_no=nr_linie;
      symbol_table_variables[count].scope=scop;
      count++;  
    }  else if(c == 'F') {
      symbol_table_variables[count].data_type=strdup("float");
      symbol_table_variables[count].id_name=strdup(yytext);
      symbol_table_variables[count].value=val;
      symbol_table_variables[count].line_no=nr_linie;
      symbol_table_variables[count].scope=scop;   
      count++;  
    }  else if(c == 'B') {
      symbol_table_variables[count].data_type=strdup("bool");
      symbol_table_variables[count].id_name=strdup(yytext);
      symbol_table_variables[count].value=val;
      symbol_table_variables[count].line_no=nr_linie;
      symbol_table_variables[count].scope=scop;  
      count++;  
    }  else if(c == 'C') {
     symbol_table_variables[count].data_type=strdup("const");
      symbol_table_variables[count].id_name=strdup(yytext);
      symbol_table_variables[count].value=val;
      symbol_table_variables[count].line_no=nr_linie;
      symbol_table_variables[count].scope=scop;  
      count++;  
    }else if (c=='S'){
      symbol_table_variables[count].data_type=strdup("string");
      symbol_table_variables[count].id_name=strdup(yytext);
      symbol_table_variables[count].value=val;
      symbol_table_variables[count].line_no=nr_linie;
      symbol_table_variables[count].scope=scop;
    }
}
}

int search(char *type) { 
    int i; 
    for(i=count-1; i>=0; i--) {
        if(strcmp(symbol_table_variables[i].id_name, type)==0) {   
            return -1;
            break;  
        }
    } 
    return 0;
}


int main(int argc, char** argv){
  yyin=fopen(argv[1],"r");
  yyparse();
} 