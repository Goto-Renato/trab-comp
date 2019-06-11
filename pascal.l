%{
/*
 * scan.l
 *
 * lex input file for pascal scanner
 *
 * extensions: to ways to spell "external" and "->" ok for "^".
 */

#include <stdio.h>
// #include "y.tab.h"
int line_no = 1;
void commenteof();

%}

%%

"and"   {printf("%s\n", yytext);}
"array"   {printf("%s\n", yytext);}
"case"   {printf("%s\n", yytext);}
"const"   {printf("%s\n", yytext);}
"div"   {printf("%s\n", yytext);}
"do"    {printf("%s\n", yytext);}
"downto"  {printf("%s\n", yytext);}
"else"   {printf("%s\n", yytext);}
"end"   {printf("%s\n", yytext);}
"extern"|"external" {printf("%s\n", yytext);}
"for"   {printf("%s\n", yytext);}
"forward"  {printf("%s\n", yytext);}
"function" {printf("%s\n", yytext);}
"goto"   {printf("%s\n", yytext);}
"if"    {printf("%s\n", yytext);}
"in"    {printf("%s\n", yytext);}
"label"   {printf("%s\n", yytext);}
"mod"   {printf("%s\n", yytext);}
"nil"   {printf("%s\n", yytext);}
"not"   {printf("%s\n", yytext);}
"of"    {printf("%s\n", yytext);}
"or"    {printf("%s\n", yytext);}
"otherwise" {printf("%s\n", yytext);}
"packed"  {printf("%s\n", yytext);}
"begin"   {printf("%s\n", yytext);}
"file"   {printf("%s\n", yytext);}
"procedure" {printf("%s\n", yytext);}
"program"  {printf("%s\n", yytext);}
"record"  {printf("%s\n", yytext);}
"repeat"  {printf("%s\n", yytext);}
"set"   {printf("%s\n", yytext);}
"then"   {printf("%s\n", yytext);}
"to"    {printf("%s\n", yytext);}
"type"   {printf("%s\n", yytext);}
"until"   {printf("%s\n", yytext);}
"var"   {printf("%s\n", yytext);}
"while"   {printf("%s\n", yytext);}
"with"   {printf("%s\n", yytext);}
[a-zA-z_][a-zA-z_0-9]* {printf("%s\n", yytext);}
[0-9]+ {printf("%s\n", yytext);}
[0-9]+"."[0-9]+ {printf("%s\n", yytext);}
"||" {printf("%s\n", yytext);}
"&&" {printf("%s\n", yytext);}
"..." {printf("%s\n", yytext);}
"=="|"!=" {printf("%s\n", yytext);}
"<="|">=" {printf("%s\n", yytext);}
">>"|"<<" {printf("%s\n", yytext);}
"++"|"--" {printf("%s\n", yytext);}
"->" {printf("%s\n", yytext);}
";"|"="|","|"{"|"}"|"("|")"|"["|"]"|"*"|"+"|"-"|"/"|"?"|":"|"&"|"|"|"^"|"!"|"~"|"%"|"<"|">"	{printf("%s\n", yytext);}
"*="|"/="|"+="|"%="|">>="|"-="|"<<="|"&="|"^="|"|=" {printf("%s\n", yytext);}
"'"."'" {printf("%s\n", yytext);}
\"(\\.|[^\"])*\" {printf("%s\n", yytext);}
"//"(\\.|[^\n])*[\n] ;
[/][*]([^*]|[*]*[^*/])*[*]+[/] ;
[ \t] ;
\n    line_no++;

%%

void commenteof()
{
 fprintf (stderr, "unexpected EOF inside comment at line %d\n",
  line_no);
 exit (1);
}

int main()
{
    yylex();
    printf("\nNumero lineas analizadas: %d\n", line_no); 
    return 0;
}
