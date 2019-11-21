%{
    int no_of_words;
%}

%%

[a-zA-Z0-9]+ {no_of_words++;}
.   {}

%%

int main(){
    yyin = fopen("input.txt","r");
    yylex();
    printf("No of Words : %d\n",no_of_words);
    return 0;
}

int yywrap(){
    return 1;
}
