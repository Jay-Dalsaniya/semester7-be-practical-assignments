%{
    #include <stdio.h>
%}

%%

\<[^>]*\> { // Matches anything between '<' and '>' (HTML tags)
    printf("%s\n", yytext);         // Print the matched HTML tag to the console
    fprintf(yyout, "%s\n", yytext); // Write the matched HTML tag to output.txt
}

.|\n;  // Matches any other character or newline (ignored)

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Jay Dalsaniya \n");
    printf("92100103336 \n");

    yyin = fopen("index.html", "r");  // Input file (HTML file)
    yyout = fopen("output.txt", "w"); // Output file (to store HTML tags)

    yylex();  // Start lexical analysis

    fclose(yyin);  // Close input file
    fclose(yyout); // Close output file
    return 0;
}
