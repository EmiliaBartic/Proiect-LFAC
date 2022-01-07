%{
    #include "y.tab.h"
    int nr_linie=1;
%}

%option yylineno
%option noinput nounput
%option noyywrap

litera [a-zA-Z]
cifra [0-9]
op_unara "++"|"--"

%%
"write"                  { return PRINTF; }
"read"                   { return SCANF; }
"return"                { return RETURN; }
    /*tipuri variabile*/        
"void"                      { return VOID; }
"int"                    { return INT; }
"float"                     { return FLOAT; }
"bool"                      { return BOOL;}
"char"                      { return CHAR; }
"const"                 { return CONST;}
"string"                {return STRING;}
"(class"[ ]*\:[ ]*"name"                   { return CLASS; }
"(/class)"                   { return END_CLASS; }
    /*structuri repetitive*/

"(f("                        {return FUNCTION;}
"(/f)"                        {return END_FUNCTION;}
"(for"[ ]*\:                 { return FOR;}
"(/for)"                    { return END_FOR;}
"(else if"[ ]*\:	        { return ELSE_IF; }
"(else)"	                { return ELSE; }
"(/else)"	                { return END_ELSE; }
"(if"[ ]*\:                 { return IF; }
"(/if)"                     { return END_IF; }
"(while"[ ]*\:              { return WHILE;}
"(/while)"                  { return END_WHILE;}




"%%%%"                      { return SEPARATOR; }
"<main>"                      { return MAIN; }
"</main>"                      { return END_MAIN; }
"true"                      { return TRUE; }
"false"                     { return FALSE; }
[-]?{cifra}+                { return INT_NUM; }
[-]?{cifra}+\.{cifra}{1,6}  { return FLOAT_NUM; }
{litera}({litera}|{cifra}|"_")* { return ID; }
{op_unara}                  { return UNARY; }
"<="                        { return LE; }
">="                        { return GE; }
"=="                        { return EQ; }
"!="                        { return NE; }
">"	                        { return GT; }
"<"	                        { return LT; }
"&&"	                    { return AND; }
"||"	                    { return OR; }
"+"                         { return ADD; }
"-"                         { return SUBTRACT; }
"/"                         { return DIVIDE; }
"*"                         { return MULTIPLY; }
[ \t]*                      { ; }
[\n]                        { nr_linie++; }
.	                        { return *yytext; }
["].*["]                    { return STR; }
['].[']                     { return CHARACTER; }

%%
