%{
#include <stdio.h>
#include <ctype.h>

int characters = 0, words = 1, lines = 1, vowels = 0, consonants = 0;

int isVowel(char ch) {
    ch = tolower(ch);
    return (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u');
}
%}

%%

[a-zA-Z] {
    characters++;     // Count characters
    if (isVowel(yytext[0])) {
        vowels++;      // Count vowels
    } else {
        consonants++;  // Count consonants
    }
}

[ \t] {
    characters++;    // Count characters
}

\n {
    lines++;         // Count lines
    characters++;    // Count newline as a character
}

[.] {
    characters++;    // Period marks the end of input
    return 0;        // End lexing when a period is found
}

%%

int main() {
    printf("Enter text (end input with a period '.'): \n");
    yylex(); // Start scanning and tokenizing input

    printf("Jay Dalsaniya \n");
    printf("92100103336 \n");
    printf("\nStatistics:\n");
    printf("Characters: %d\n", characters);
    printf("Words: %d\n", words);
    printf("Lines: %d\n", lines);
    printf("Vowels: %d\n", vowels);
    printf("Consonants: %d\n", consonants);

    return 0;
}

int yywrap() {
    return 1;
}
