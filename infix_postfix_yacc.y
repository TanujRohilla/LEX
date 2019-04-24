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

P : P E '\n' {printf("\n"); }
    |
    ;
    
E : E Add E { printf("+"); }
    | E Subtract E { printf("-"); }
    | E Multiply E { printf("*"); }
    | E Divide E { printf("/"); }
    | LeftBracket E RightBracket
    | Id { printf("%d",yylval); }
    ;
    
%%
int main(){
    yyparse();
    return 0;
}

void yyerror(char *msg){
    printf("Error : %s",msg);
}
