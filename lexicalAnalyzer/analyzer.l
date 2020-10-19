%{
/* definitions of manifest constants */
#include <stdio.h>
%}

/* ****** regular expressions ***** */
%option noyywrap
seperators [\{\}\(\)\[\];]

operators [\+\*\-\=\>\<]

delim [ \t\n]
ws {delim}+
letter [A-Za-z]
digit [0-9]
id {letter}({letter}|{digit})*
number {digit}+(\.{digit}+)?(E[+-]?{digit}+)?
error ([.])+
word ({letter}|{error})+

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
true {printKeyword(yytext);}
false {printKeyword(yytext);}
{word} {printKeyword("error");}
%%
void printKeyword(char* key){
     printf("%s", key);
 }
/****** c functions *******/
 int main(){
    while(1){

     yylex();
    }
    return 0;
 }