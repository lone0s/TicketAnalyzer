%{
#include<stdio.h>
%}

%token NB CODEDOS DOS PRENOMNOM CODECONCERT NOMCONCERT DATE HEURE PLACE RC SPACE FIN
%start S

%%

S : DOS SPACE CODEDOS RC PRENOMNOM RC C1 FIN { printf("La commande est valide !\n") ; YYACCEPT ; }
  | error '\n' {yyerrok; printf("Error: le fichier n'est pas une commande"); YYERROR ;}
  ;
  
C1 : C1 C1
   | CODECONCERT SPACE NOMCONCERT SPACE DATE SPACE HEURE SPACE NB SPACE PLACE RC
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
