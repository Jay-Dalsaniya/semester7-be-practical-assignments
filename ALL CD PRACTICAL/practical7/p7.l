%{
#include <stdio.h>

int flag = 0; // Flag to determine if the sentence is compound
%}

%%

and|or|but|because|if|then|nevertheless  { flag = 1; } // Set flag for compound sentence
[.?!] ;                                    // Match end of sentence punctuation
\n  { return 0; }                         // Return 0 on newline (end of input)
[ \t]+ ;                                  // Ignore whitespace
. ;                                       // Match any other single character (ignore)

%%

int main() {
    printf("Jay Dalsaniya \n");
    printf("92100103336 \n");

    printf("Enter the sentence:\n");
    yylex(); // Invoke the lexer
    if (flag == 0)
	printf("\nThis is a simple sentence.\n");
    else
        printf("\nThis is a compound sentence.\n");

    return 0;
}

int yywrap() {
    return 1; // Indicate end of input
}
