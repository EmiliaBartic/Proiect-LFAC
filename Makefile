all:
	lex limbaj.l
	yacc -d limbaj.y
	gcc lex.yy.c y.tab.c -o test