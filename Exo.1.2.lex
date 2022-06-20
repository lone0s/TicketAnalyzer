%{
    int nb;
    
%}

LETTER      [A-Z]
NUMBER      [0-9]

HH          {NUMBER}{2}
MM          {NUMBER}{2}

DATE        ({NUMBER}{2}"/"{NUMBER})|({NUMBER}{2}"/"{NUMBER}{2})|({NUMBER}{2}"/"{NUMBER}{2}"/"{NUMBER}{2})|({NUMBER}{2}"/"{NUMBER}"/"{NUMBER}{2})

PRENOMNOM   ({LETTER}*"-"?{LETTER}*"/"{LETTER}*"-"?{LETTER}*)

CONCERT     (({LETTER}*|{NUMBER}*)"-"?({LETTER}*|{NUMBER}*))*

%%
[1-9]{1,2}      {}
{NUMBER}{8}     {}
Dossier         {}
{PRENOMNOM}     {printf("%s",yytext);}
T{NUMBER}+      {nb++;}
{CONCERT}       {}
{DATE}          {}
{HH}:{MM}       {}
places          {}
[\n]            {}
[ ]             {}
<<EOF>>         {
                return 0;
                }

%%

int main(){
    nb = 0 ; yylex() ; printf (" a acheté des places de %d concerts \n",nb) ;
}
