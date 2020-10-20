%{
/* definitions of manifest constants */
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
char* ID = "T_ID";
char* boolLiteral = "T_BOOLEANLITERAL";
char* integerLiteral = "T_INTLITERAL";
char* doubleLiteral = "T_DOUBLELITERAL";
char* stringLiteral = "T_STRINGLITERAL";
bool end = false;
FILE *fp; 
void printKeyword();
void printID();
%}

/* ****** regular expressions ***** */
%option noyywrap

seperators [\{\}\(\)\[\]\,\;]

operators [\+\*\-\=\>\<\|\%\/\?\&]
doubleOperators ((!=)|(==)|(<=)|(>=)|(\|\|)|(\&\&))?

delim [ \t\n]
ws {delim}+
letter [A-Za-z]
digit [0-9]
id {letter}({letter}|{digit})*
double (({digit}+)\.({digit}*)([eE][-+]?{digit}+)?)
ID ({letter})+({digit}|[_]|{letter})*
string \".*\"
boolean (true|false)?
hex [a-fA-F0-9]+
integer ({digit}+)|(0[xX]({hex})+)

%%
{ws} {/* ignore */}
void {printKeyword(yytext);return 0;}
if  {printKeyword(yytext);return 0;}
int  {printKeyword(yytext);return 0;}
bool  {printKeyword(yytext);return 0;}
string  {printKeyword(yytext);return 0;}
class  {printKeyword(yytext);return 0;}
interface  {printKeyword(yytext);return 0;} 
null  {printKeyword(yytext);return 0;} 
this  {printKeyword(yytext);return 0;} 
extends  {printKeyword(yytext);return 0;} 
implements  {printKeyword(yytext);return 0;} 
for  {printKeyword(yytext);return 0;} 
while  {printKeyword(yytext);return 0;}
else {printKeyword(yytext);return 0;}
return {printKeyword(yytext);return 0;}
break {printKeyword(yytext);return 0;}
continue {printKeyword(yytext);return 0;}
new {printKeyword(yytext);return 0;}
NewArray {printKeyword(yytext);return 0;}
Print {printKeyword(yytext);return 0;}
ReadInteger {printKeyword(yytext);return 0;}
ReadLine {printKeyword(yytext);return 0;}
dtoi {printKeyword(yytext);return 0;}
itod {printKeyword(yytext);return 0;}
btoi {printKeyword(yytext);return 0;}
itob {printKeyword(yytext);return 0;}
private {printKeyword(yytext);return 0;}
protected {printKeyword(yytext);return 0;}
public {printKeyword(yytext);return 0;}
operators {printKeyword(yytext);return 0;}


{double} {printID(doubleLiteral, yytext);}
{boolean} {printID(boolLiteral,yytext);}
{seperators} {printKeyword(yytext);}
{doubleOperators} {printKeyword(yytext);}
{operators} {printKeyword(yytext);}
{integer} {printID(integerLiteral,yytext);}
{string} {printID(stringLiteral, yytext);}
{ID} {printID(ID, yytext); }
.+ { end = true; printf("salam"); return 0;}
%%
/****** c functions *******/
 int main(){
    fp = fopen("out.txt", "w");
    while(!end){
     yylex();
    }
    fclose(fp);
    return 0;
 }

 void printKeyword(char* key){
     fprintf(fp,"%s\n", key);
 }


 void printID(char* IDType, char* value){
     fprintf(fp, "%s %s\n", IDType, value);

 }