%{
    #include <stdio.h>
    int yylex();
    void yyerror(char *);
%}

%token Id
%token LeftBracket
%token RightBracket
%token Add
%token Subtract
%token Divide
%token Multiply

%left Subtract Add
%left Multiply Divide

%%

P : P E '\n' {printf("Answer : %d\n", $2); }
    |
    ;
    
E : E Add E { $$ = $1 + $3; }
    | E Subtract E { $$ = $1 - $3; }
    | E Multiply E { $$ = $1 * $3; }
    | E Divide E { $$ = $1 / $3; }
    | LeftBracket E RightBracket { $$ = $2; }
    | Id { $$ = $1; }
    ;
    
%%
int main(){
    yyparse();
    return 0;
}

void yyerror(char *msg){
    printf("Error : %s",msg);
}
