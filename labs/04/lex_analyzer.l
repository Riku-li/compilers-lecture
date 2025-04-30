%{
#include <stdio.h>
%}

%option noyywrap

LETRA    [a-zA-Z]
DIGITO   [0-9]
NUMERO   {DIGITO}+
DECIMAL  {DIGITO}+"."{DIGITO}+
ID       {LETRA}({LETRA}|{DIGITO})*
COMENT   \/\/.*

%%

{COMENT}        { printf("COMMENT\n"); }
^[ \t]*f[ \t]+  { printf("floatdcl\n"); }
^[ \t]*i[ \t]+  { printf("intdcl\n"); }
^[ \t]*p[ \t]+  { printf("print\n"); }
=               { printf("assign\n"); }
\+              { printf("plus\n"); }
\-              { printf("minus\n"); }
\*              { printf("times\n"); }
\/              { printf("divide\n"); }
{DECIMAL}       { printf("fnum\n"); }
{NUMERO}        { printf("inum\n"); }
{ID}            { printf("id\n"); }
[ \t\n]+        ; // ignora espacios y saltos de línea
.               ; // ignora cualquier otro carácter

%%

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *archivo = fopen(argv[1], "r");
        if (!archivo) {
            perror("No se pudo abrir el archivo");
            return 1;
        }
        yyin = archivo;
    }
    yylex();
    return 0;
}