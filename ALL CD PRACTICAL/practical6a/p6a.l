%{
#include <stdio.h>
#include <string.h>

char words[1000][50]; 
int counts[1000], n = 0, i;
%}

%%

[a-zA-Z]+   {
    for (i = 0; i < n && strcmp(words[i], yytext); i++);
    if (i < n) 
        counts[i]++; 
    else { 
        strcpy(words[n], yytext); 
        counts[n++] = 1; 
    }
}
.|\n        ;  // Ignore other characters

%%

int main() {
    printf("Enter the Sentence:\n");
    yylex();
    for (i = 0; i < n; i++) 
        printf("%s: %d\n", words[i], counts[i]);
    return 0;
}

int yywrap() {
    return 1;
}
