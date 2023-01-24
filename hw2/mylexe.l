/* ---- PROLOGUE ---- */ 
%{ 

#include <iostream> 
using namespace std; 
int no_lines = 0;
int num = 0;

%}
                /* ---- DEFINITIONS ---- */ 

%option noyywrap 
DIGIT [0-9]
ALPAB [a-zA-Z]

%%              /* ---- REGULAR EXPRESSIONS ---- */ 

[ \t\r\f]         /*  whitespace  */;
\n                                          { no_lines++;}
%+[ \.\t]?[% \.\ta-zA-Z0-9]+["?"]?           /*ignore comment*/;
[+\-]?{DIGIT}+                              { cout << "#" << num << ": TOKEN: INTCONST\tLEXEME:\t" << yytext << endl; num++;}
[+\-]?{DIGIT}+\.{DIGIT}+                    { cout << "#" << num << ": TOKEN: DECCONST\tLEXEME:\t" << yytext << endl; num++;}
[+\-]?{DIGIT}+\.{DIGIT}{DIGIT}?E[+\-]?{DIGIT}+  { cout << "#" << num << ": TOKEN: SCICONST\tLEXEME:\t" << yytext << endl; num++;}
[a-zA-Z0-9]+H                               { cout << "#" << num << ": TOKEN: HEXCONST\tLEXEME:\t" << yytext << endl; num++;}
[0|1]+B                                     { cout << "#" << num << ": TOKEN: BINCONST\tLEXEME:\t" << yytext << endl; num++;}
\({DIGIT}{DIGIT}{DIGIT}\){DIGIT}{DIGIT}{DIGIT}\-{DIGIT}{DIGIT}{DIGIT}{DIGIT}      { cout << "#" << num << ": TOKEN: PHCONST\tLEXEME:\t" << yytext << endl; num++;}
{DIGIT}{DIGIT}{DIGIT}\.{DIGIT}{DIGIT}{DIGIT}\.{DIGIT}{DIGIT}{DIGIT}{DIGIT}        { cout << "#" << num << ": TOKEN: PHCONST\tLEXEME:\t" << yytext << endl; num++;}
{DIGIT}{DIGIT}{DIGIT}\-{DIGIT}{DIGIT}{DIGIT}\-{DIGIT}{DIGIT}{DIGIT}{DIGIT}        { cout << "#" << num << ": TOKEN: PHCONST\tLEXEME:\t" << yytext << endl; num++;}
IF|THEN|ELSE|WHILE|END|PROC                 { cout << "#" << num << ": TOKEN: KEYWORD\tLEXEME:\t" << yytext << endl; num++;}
[a-zA-Z]+[a-zA-Z0-9]+?                      { cout << "#" << num << ": TOKEN: IDENT\tLEXEME:\t" << yytext << endl; num++;}
\"(\\.|[^\n])*\"                            { cout << "#" << num << ": TOKEN: STRCONST\tLEXEME:\t" << yytext << endl; num++;}
"+"|"-"|"*"|"/"|"<"|">"|"="                 { cout << "#" << num << ": TOKEN: OPERATOR\tLEXEME:\t" << yytext << endl; num++;}
.                                           { cout << "#" << num << ": TOKEN: ?\t\tLEXEME:\t" << yytext << endl; num++;}

%%               /* ---- EPILOGUE ---- */ 

int main() 
{
    cout << "Hello FLEX!" << endl;
    yylex();
    cout << no_lines << " lines processed." << endl;
    return 0;
}
