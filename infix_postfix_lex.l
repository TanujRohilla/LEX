%{
    #include "y.tab.h"
    extern int yylval;
%}

%%

[0-9]   { yylval = atoi(yytext); 
            return Id; }
[+]     { return Add; }
[-]     { return Subtract; }
[/]     { return Divide; }
[*]     { return Multiply; }
[(]     { return LeftBracket; }
[)]     { return RightBracket; }
"\n"    { return *yytext; }

%%

int yywrap(){
    return 1;
}
