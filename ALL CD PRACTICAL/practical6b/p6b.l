%{
#include <stdio.h>

int sl = 0;  // Counter for single-line comments
int ml = 0;  // Counter for multi-line comments

%}

%%

"//"[^\n]*  { sl++; }  // Match single-line comments and increment counter

"/\*"([^*]|\*+[^/*])*\*+"/"  { ml++; }  // Match multi-line comments and increment counter

%%

int yywrap() {
    return 1;
}

int main() {
    yyin = fopen("f1.c", "r");
    yyout = fopen("f2.c", "w");

    if (!yyin) {
        perror("Failed to open input file");
        return 1;
    }
// Match multi-line comments and increment counter
    if (!yyout) {
        perror("Failed to open output file");
        fclose(yyin);
        return 1;
    }
// Match multi-line comments and increment counter
    yylex();

    fclose(yyin);
    fclose(yyout);
    printf("Jay Dalsaniya \n");
    printf("92100103336 \n");

    printf("\nNumber of single line comments = %d\n", sl);
    printf("\nNumber of multiline comments = %d\n", ml);

    return 0;
}
