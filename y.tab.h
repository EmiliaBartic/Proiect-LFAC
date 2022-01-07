/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    VOID = 258,
    CHARACTER = 259,
    PRINTF = 260,
    SCANF = 261,
    INT = 262,
    FLOAT = 263,
    CHAR = 264,
    FOR = 265,
    IF = 266,
    ELSE = 267,
    TRUE = 268,
    FALSE = 269,
    FLOAT_NUM = 270,
    ID = 271,
    LE = 272,
    GE = 273,
    EQ = 274,
    NE = 275,
    GT = 276,
    LT = 277,
    AND = 278,
    OR = 279,
    STR = 280,
    ADD = 281,
    MULTIPLY = 282,
    DIVIDE = 283,
    SUBTRACT = 284,
    UNARY = 285,
    RETURN = 286,
    BOOL = 287,
    CONST = 288,
    WHILE = 289,
    MAIN = 290,
    INT_NUM = 291,
    SEPARATOR = 292,
    CLASS = 293,
    END_CLASS = 294,
    END_WHILE = 295,
    END_IF = 296,
    END_ELSE = 297,
    ELSE_IF = 298,
    END_FOR = 299,
    STRING = 300,
    END_MAIN = 301,
    FUNCTION = 302,
    END_FUNCTION = 303
  };
#endif
/* Tokens.  */
#define VOID 258
#define CHARACTER 259
#define PRINTF 260
#define SCANF 261
#define INT 262
#define FLOAT 263
#define CHAR 264
#define FOR 265
#define IF 266
#define ELSE 267
#define TRUE 268
#define FALSE 269
#define FLOAT_NUM 270
#define ID 271
#define LE 272
#define GE 273
#define EQ 274
#define NE 275
#define GT 276
#define LT 277
#define AND 278
#define OR 279
#define STR 280
#define ADD 281
#define MULTIPLY 282
#define DIVIDE 283
#define SUBTRACT 284
#define UNARY 285
#define RETURN 286
#define BOOL 287
#define CONST 288
#define WHILE 289
#define MAIN 290
#define INT_NUM 291
#define SEPARATOR 292
#define CLASS 293
#define END_CLASS 294
#define END_WHILE 295
#define END_IF 296
#define END_ELSE 297
#define ELSE_IF 298
#define END_FOR 299
#define STRING 300
#define END_MAIN 301
#define FUNCTION 302
#define END_FUNCTION 303

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
