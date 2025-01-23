%{
#include<stdio.h>

int sl=0;  // Single-line comment counter
int ml=0;  // Multi-line comment counter

%}

%%

"/*"([^*]|\*+[^/])*"\*/" { ml++; }   // Multi-line comments (handles /* */)
"//".* { sl++; }                     // Single-line comments (handles //)

%%

int yywrap() {
    return 1;
}

int main() {
    FILE *yyin = fopen("f1.c", "r");
    if (yyin == NULL) {
        printf("Error opening file f1.c\n");
        return 1;
    }

    yylex();  // Start the lex scanner

    fclose(yyin);

    printf("\nNumber of single line comments = %d\n", sl);
    printf("Number of multi-line comments = %d\n", ml);

    return 0;
}
