%{
    #include <stdio.h>
    #include<string.h>
    char* reverse;
%}

%%

[a-zA-Z0-9" "]+ {strcpy(reverse,yytext)}
. {}

%%
 
 int main(){
    yyin = fopen("input.txt","r");
       
    yylex();
    strrev(reverse);
    printf("Reverse String %c :",reverse);
    return 0;
}


 int yywrap(){
    return 1;
 }
