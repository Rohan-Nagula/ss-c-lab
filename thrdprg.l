%{
	#include<stdio.h>
	#include<string.h>
%}
letter [a-zA-Z_]
digit [0-9]
id {letter}({letter}|{digit})*
number {digit}+(.{digit}+)?(E[+-]?{digit}+)?
%%

if {printf("%s is a keyword", yytext);}
else {printf("%s is a keyword", yytext);}
{id} {printf("%s is an identifier", yytext);}
"<" {printf("%s is less than symbol", yytext);}
"<=" {printf("%s is less than equal to symbol", yytext);}
{number}+ {printf("%s is a number", yytext);}

%%

int yywrap(){}

int main()
{
	yylex();
	return 0;
}

	
