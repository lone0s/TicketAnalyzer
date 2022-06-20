%{
#include<stdio.h>
%}

%token NB CODEDOS DOS PRENOMNOM CODECONCERT NOMCONCERT DATE HEURE PLACE RC SPACE FIN CODEPLACE
%start S

%%

S : DOS SPACE CODEDOS RC PRENOMNOM RC C FIN { printf("La commande est valide !\n") ; YYACCEPT ; }
  | error '\n' {yyerrok; printf("Error: le fichier n'est pas une commande"); YYERROR ;}
  ;
  
C : C C
  | CODECONCERT SPACE NOMCONCERT SPACE DATE SPACE HEURE SPACE NB SPACE PLACE RC P RC
  ;


P : P SPACE P
  | CODEPLACE
  ; 

    
%%

#include "lex.yy.c"

int main(){
    yyparse();
}

int yyerror(void)
{
fprintf(stderr, "Error: le fichier n'est pas une commande \n");
return 1;
}
