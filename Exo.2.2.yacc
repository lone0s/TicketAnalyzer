%{
#include<stdio.h>
#include "y.tab.h"

int yylex(void);
%}

%union {int nb; int code;};

%token <nb> NB
%token <code> CODEDOS
%token DOS PRENOMNOM CODECONCERT NOMCONCERT DATE HEURE PLACE RC SPACE FIN
%start S

%%

S : DOS SPACE CODEDOS RC PRENOMNOM RC C1 FIN { $<nb>$ = $<nb>7 ; printf("Le dossier %d concerne %d places !\n",$<code>3,$<nb>7); YYACCEPT ;}
  | error '\n' {yyerrok; printf("Error: le fichier n'est pas une commande"); YYERROR ;}
  ;
  
C1 : C1 C1 { $<nb>$ = $<nb>1 + $<nb>2 ; }
   | CODECONCERT SPACE NOMCONCERT SPACE DATE SPACE HEURE SPACE NB SPACE PLACE RC{ $<nb>$ = $<nb>9 ; }
   ;

      
%%

#include "lex.yy.c"

int main(){

    yylval.nb = 0;
    yylval.code = 0;    
    
    yyparse();

}


int yyerror(void)
{
fprintf(stderr, "Error: le fichier n'est pas une commande \n");
return 1;
}

