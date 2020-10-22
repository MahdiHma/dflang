%option noyywrap
%option header-file="lex.yy.h"

%{
#include <iostream>
#include <stdio.h>
const char* ID = "T_ID";
const char* boolLiteral = "T_BOOLEANLITERAL";
const char* integerLiteral = "T_INTLITERAL";
const char* doubleLiteral = "T_DOUBLELITERAL";
const char* stringLiteral = "T_STRINGLITERAL";
void printKeyword(const char* key);
void printID(const char* IDType,const char* value);

#define YY_DECL int yylex()
%}

seperators [\{\}\(\)\[\]\,\;]

operators [\+\*\-\=\>\<\|\%\/\?\&]
doubleOperators ((!=)|(==)|(<=)|(>=)|(\|\|)|(\&\&))?

delim [ \t\n\r\f]
ws {delim}+
letter [a-zA-Z]
digit [0-9]
id {letter}({letter}|{digit})*
double (({digit}+)\.({digit}*)([eE][-+]?{digit}+)?)
ID ({letter})+({digit}|[_]|{letter})*
string \".*\"
boolean (true|false)?
hex [a-fA-F0-9]
integer ({digit})+|(0[xX]({hex})+)

sym [~!@#$%^&*()_+|><""''.,]
c [/]
s []
l [\n]

comment \/\*(.*)(\n)*\*\/
comment2 \/\/[^\n]+ 


%%
{ws} {/* ignore */}
void {printKeyword(yytext);}
if  {printKeyword(yytext);}
int  {printKeyword(yytext);}
bool  {printKeyword(yytext);}
string  {printKeyword(yytext);}
double  {printKeyword(yytext);}
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

{comment2} {}
{comment} {}
{double} {printID(doubleLiteral, yytext);}
{boolean} {printID(boolLiteral,yytext);}
{seperators} {printKeyword(yytext);}
{doubleOperators} {printKeyword(yytext);}
{operators} {printKeyword(yytext);}
{integer} {printID(integerLiteral,yytext);}
{string} {printID(stringLiteral, yytext);}
{ID} {printID(ID, yytext); }
. {printKeyword("UNDEFINED_TOKEN");}

%%
 void printKeyword(const char* key){
     fprintf(yyout,"%s\n", key);
 }


 void printID(const char* IDType,const char* value){
     fprintf(yyout, "%s %s\n", IDType, value);

 }

