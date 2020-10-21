%option noyywrap
%option header-file="lex.yy.h"

%{
#include <iostream>
#include <stdio.h>
char* ID = "T_ID";
char* boolLiteral = "T_BOOLEANLITERAL";
char* integerLiteral = "T_INTLITERAL";
char* doubleLiteral = "T_DOUBLELITERAL";
char* stringLiteral = "T_STRINGLITERAL";
void printKeyword(char* key);
void printID(char* IDType, char* value);

#define YY_DECL int yylex()
%}

seperators [\{\}\(\)\[\]\,\;]

operators [\+\*\-\=\>\<\|\%\/\?\&]
doubleOperators ((!=)|(==)|(<=)|(>=)|(\|\|)|(\&\&))?

delim [ \t\n]
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
c [//]
s []
l [\n]

comment (({letter}|{digit}|{sym}|{s}|{l})*)
comment2 ({c}+({letter}|{digit}|{sym}|{s})*{l})


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


{double} {printID(doubleLiteral, yytext);}
{boolean} {printID(boolLiteral,yytext);}
{seperators} {printKeyword(yytext);}
{doubleOperators} {printKeyword(yytext);}
{operators} {printKeyword(yytext);}
{integer} {printID(integerLiteral,yytext);}
{string} {printID(stringLiteral, yytext);}
{ID} {printID(ID, yytext); }
"/*"{comment}+"*/" {printComment(yytext);}
;}
{comment2} {printComment(yytext);}

.    {fprintf("UNDEFINED_TOKEN\n");}  
%% 



 void printKeyword(char* key){
    //  printf("%s\n", key);     
     fprintf(yyout,"%s\n", key);
 }


 void printID(char* IDType, char* value){
    //  printf("%s", value);
     fprintf(yyout, "%s %s\n", IDType, value);

 }

 void printComment(char* value){
     fprintf("this is comment :");
     fprintf(yyout , %s\n", value);
 }