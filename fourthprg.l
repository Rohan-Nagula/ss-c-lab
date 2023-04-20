%{
	#include<stdio.h>
	int lines = 0, words = 0, blanks = 0, chars = 0;
%}
%%
[\t ] {blanks++;}
[\n] {lines++;}
[^ \t\n]+ {words++; chars+=yyleng;}
%%
int yywrap()
{
	fprintf(yyout, "charactres %d", chars);
	fprintf(yyout, "words %d", words);
	fprintf(yyout, "blanks %d", blanks);
	fprintf(yyout, "lines %d", lines);
	
}

int main(int argc, char* argv[])
{
	yyin = fopen(argv[1], "r");
	yyout=fopen(argv[2], "w");
	yyout=yylex();
	return 0;
}
