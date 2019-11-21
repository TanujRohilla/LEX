%{
    int no_of_characters;
%}

%%

[a-zA-Z0-9]+    {no_of_characters += yyleng;}
.   {}

%%

int main(){
    yyin = fopen("input.txt","r");
    yylex();
    printf("No of Characters : %d\n",no_of_characters);
    return 0;
}

int yywrap(){
    return 1;
}
