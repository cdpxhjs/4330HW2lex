/*Lex code to count total number of tokens */
/*Prerequisite: Fast lexical Analyzer Generator*/

%{
#include<stdio.h>
#include<string.h>
int n = 0 ;//the total number of tokens
%}

//rule section
%%

//count number of keywords
"while"|"if"|"else" {n++;printf("\t keywords : %s", yytext);}

// count number of keywords
"int"|"float" {n++;printf("\t keywords : %s", yytext);}

// count number of identifiers
[a-zA-Z_][a-zA-Z0-9_]* {n++;printf("\t identifier : %s", yytext);}

// count number of operators
">"|"<"|">="|"<="|"=="|"!="|"="|"/"|"mod"|"-"|"*"|"+" {n++;printf("\t operator : %s", yytext);}

// count number of separators
[(){}|, ;] {n++;printf("\t separator : %s", yytext);}

// count number of float number
[0-9]*"."[0-9]+ {n++;printf("\t float : %s", yytext);}

// count number of integers
[0-9]+ {n++;printf("\t integer : %s", yytext);}						

. ;
%%

int yywrap(){}//wraps the above rule
int main()
{
	//Take file input
	FILE *fp;
	char filename[50];
	printf("Enter the filename: \n");
	scanf("%s",filename);
	fp = fopen(filename,"r");
	yyin = fp;
	//
	yylex();
	printf("\n The total number of token = %d\n", n);
	return 0;
}
