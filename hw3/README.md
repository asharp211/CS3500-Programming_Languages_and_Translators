Recursive Descent Parser 

Due Date:  Wednesday, October the 23th, 11:59:59pm
The Progrotron-19 programming language is a dynamically typed, imperative programming language. The language supports 3 basic types: Integers, decimals, and strings; and has common control structures like loops and conditional statements. 
Write a Recursive Descent Parser using the techniques used in class to recognize valid programs of the Progrotron-19 Programming Language. 
Description:
Programs of the Progrotron-19 programming language are built from the following tokens: 
Tokens:
Integers are non-empty sequences of digits optionally preceded with either a ‘+’ or ‘-’ sign.
Decimal numbers are Integers followed by a ‘.’, followed by a non-empty sequence of digits.
Strings are any non-space sequences of characters enclosed in “”.
e.g. “hello” “abc123”.
Keywords are the following strings: :=, +, -, *, /, OR, AND, ~, (, ), <, >, = , #, ;, PRINT, IF, ELSE, ENDIF, WHILE, ENDW, PROC, RETURN,  BEGIN, END.  (Notice: keywords are uppercase)
Identifiers are sequences of digits or letters. The first character must be a letter, and an identifier cannot be a Keyword. 

In Progrotron-19 tokens are always separated by white-spaces.

Grammar:
Programs in the Progrotron-19 programming language conform to the following EBNF grammar where:
"FunctionSequence"  is the start symbol.
Terminal symbols are in bold. 
Collections of terminal symbols are in blue
Brackets,  ‘[‘ and ‘]’ , denote an optional section of a rule.  
Braces,  ‘{‘ and ‘}’,  denote repetition of a rule section (possibly 0 times). 

Relation :=   < | > | = | #  
AddOperator :=   + | - | OR 
MulOperator :=   * | / | AND

Expression := SimpleExpression [ Relation SimpleExpression ]
SimpleExpression := Term { AddOperator Term }
Term := Factor { MulOperator Factor }
Factor :=  integer | decimal | string | identifier | ( Expression ) | ~ Factor

Assignment := identifier := Expression 
PrintStatement := PRINT ( Expression )
RetStatement := RETURN identifier 
IfStatement := IF ( Expression ) StatementSequence [ ELSE StatementSequence ]
		  ENDIF
WhileStatement = WHILE ( Expression ) StatementSequence ENDW

Statement := Assignment | PrintStatement | IfStatement | WhileStatement
StatementSequence = Statement { ; Statement }

ParamSequence :=  identifier  { , identifier }
FunctionDeclaration := PROC identifier ( [ ParamSequence ] ) BEGIN StatementSequence [ RetStatement ] END.

FunctionSequence := FunctionDeclaration { FunctionDeclaration }


Submission Guidelines:
Submit through the UNIX systems using the command 
		‘cssubmit 3500 a 3’.

Your main file shall be called “progparser” regardless of extension. (e.g. if you are programming in C++, your main file should be called “progparser.cpp”. If you are programming in Java your main file should be called “progparser.java” ).  Your main file should include your name.  
Include any other necessary files in your submission. In order to accommodate different languages, your submission should include a bash script named run.sh that compiles and runs your program with all the necessary options and commands.  For example, the following could be a run.sh script for C++ 11.
#!/bin/bash
g++ -std=c++11 *.cpp -o progparser.ex
./progparser.ex


A run.sh script for Python3:  
#!/bin/bash
python3 progparser.py3


Your program will be evaluated using the command:  
		./run.sh < inputFileName
Input:
Your Parser should accept input from “standard input” and output to “standard output”.
Output:
If the input program is valid, output “CORRECT”, otherwise output “INVALID!” and an error message that identifies the recursive descent function and token that generates the error.

Sample 1:
Input
PROC main ( )
BEGIN
  x := 2 + 2 ;
  PRINT ( x * 100 )
END.

Output
CORRECT

