%{
	#include<stdio.h>
	#include<string.h>
	int vow_count=0;
	int con_count=0;
%}

%%
[aeiouAEIOU] {vow_count++;}
[a-zA-Z] {con_count++; }
"\n" {printf("No of vowels are: %d\n-No of consonants are: %d\n", vow_count, con_count);}
%%

int yywrap(){}

int main()
{
	printf("ENter the string of vowels and consonants");
	yylex();
	
	return 0;
}

	
