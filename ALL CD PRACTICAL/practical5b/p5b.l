%{
#include <stdio.h>
#include <string.h>

int num_zeros = 0;  // Variable to store the number of zeros to append
%}

%%

[a-zA-Z0-9]+ {
    // This pattern matches any alphanumeric string
    // Get the length of the string
    int len = yyleng;
    
    // Determine the number of zeros to append
    num_zeros = (len % 3);  // Example condition: append zeros based on the length modulo 3
    
    printf("Jay Dalsaniya \n");
    printf("92100103336 \n");

    // Print the original string
    printf("Original String: %s\n", yytext);
    
    // Print the string followed by the zeros
    printf("Modified String: %s", yytext);

    // Variable declaration outside of the loop
    int i;
    for (i = 0; i < num_zeros; i++) {
        printf("0");
    }
    printf("\n");
}

.|\n  {
    // Any other character (including new lines) is ignored
}

%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
