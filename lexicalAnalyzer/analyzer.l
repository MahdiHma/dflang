%{
/* definitions of manifest constants */
#include <stdio.h>
char* ID = "T_ID";
char* boolLiteral = "T_BOOLEANLITERAL";
char* integerLiteral = "T_INTLITERAL";
char* doubleLiteral = "T_DOUBLELITERAL";
char* stringLiteral = "T_STRINGLITERAL";
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
void {printKeyword(yytext);}
if  {printKeyword(yytext);}
int  {printKeyword(yytext);}
bool  {printKeyword(yytext);}
string  {printKeyword(yytext);}
class  {printKeyword(yytext);}
interface  {printKeyword(yytext);} 
null  {printKeyword(yytext);} 
this  {printKeyword(yytext);} 
extends  {printKeyword(yytext);} 
implements  {printKeyword(yytext);} 
for  {printKeyword(yytext);} 
while  {printKeyword(yytext);}
else {printKeyword(yytext);}
return {printKeyword(yytext);}
break {printKeyword(yytext);}
continue {printKeyword(yytext);}
new {printKeyword(yytext);}
NewArray {printKeyword(yytext);}
Print {printKeyword(yytext);}
ReadInteger {printKeyword(yytext);}
ReadLine {printKeyword(yytext);}
dtoi {printKeyword(yytext);}
itod {printKeyword(yytext);}
btoi {printKeyword(yytext);}
itob {printKeyword(yytext);}
private {printKeyword(yytext);}
protected {printKeyword(yytext);}
public {printKeyword(yytext);}
operators {printKeyword(yytext);}

{double} {printID(doubleLiteral, yytext);}
{boolean} {printID(boolLiteral,yytext);}
{seperators} {printKeyword(yytext);}
{doubleOperators} {printKeyword(yytext);}
{operators} {printKeyword(yytext);}
{integer} {printID(integerLiteral,yytext);}
{string} {printID(stringLiteral, yytext);}
{ID} {printID(ID, yytext); }

%%
/****** c functions *******/
 int main(){
    while(1){

     yylex();
    }
    return 0;
 }

 void printKeyword(char* key){
     printf("%s\n", key);
 }


 void printID(char* IDType, char* value){
     printf("%s %s\n", IDType, value);
 }