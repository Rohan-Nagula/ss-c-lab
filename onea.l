%{
#include<stdio.h>
int a[]={0,0,0,0},i,valid=1,opnd=0,flag=1;
%}
%x OPER
%%
[a-zA-Z0-9]+ {BEGIN OPER; opnd++;}
<OPER>"+" {if(valid) { valid=0; i=0; flag=0;} else ext();}
<OPER>"-" {if(valid) { valid=0; i=1; flag=0;} else ext();}
<OPER>"*" {if(valid) { valid=0; i=2; flag=0;} else ext();}
<OPER>"/" {if(valid) { valid=0; i=3; flag=0;} else ext();}
<OPER>[a-zA-Z0-9]+ {opnd++; if(valid==0){valid = 1;a[i]++;}else ext();}
<OPER>"\n" { if(valid==0)ext();else if(valid==1 && flag==1) ext(); else return 0;}
.|\n ext();
%%
ext()
{
	printf("INvalid expression\n"); exit(0);
}
int yywrap(){};

int main()
{
	printf("Enter the arithmetic expression: \n");
	yylex();
	printf("The number of operands is %d\n", opnd);
	printf("The number of + operators is %d\n", a[0]);
	printf("The number of - operators is %d\n", a[1]);
	printf("The number of * operators is %d\n", a[2]);
	printf("The number of / operators is %d\n", a[3]);
	return 0;
	
}
	







