%{

%}

LETTER      [A-Z]
NUMBER      [0-9]

HH          {NUMBER}{2}
MM          {NUMBER}{2}

DATE        ({NUMBER}{2}"/"{NUMBER})|({NUMBER}{2}"/"{NUMBER}{2})|({NUMBER}{2}"/"{NUMBER}{2}"/"{NUMBER}{2})|({NUMBER}{2}"/"{NUMBER}"/"{NUMBER}{2})

PRENOMNOM   ({LETTER}*"-"?{LETTER}*"/"{LETTER}*"-"?{LETTER}*)

CONCERT     (({LETTER}*|{NUMBER}*)"-"?({LETTER}*|{NUMBER}*))*

%%
[1-9]{1,2}      {printf("nb");}
{NUMBER}{8}     {printf("codeDossier");}
Dossier         {printf("dossier");}
{PRENOMNOM}     {printf("prenomNom");}
T{NUMBER}+      {printf("codeConcert");}
{CONCERT}       {printf("nomConcert");}
{DATE}          {printf("date");}
{HH}:{MM}       {printf("heure");}
places          {printf("places");}
[\n]            {printf(" RC\n");}
[ ]             {printf(" ");}
<<EOF>>         {
                printf("FinFichier\n");
                return 0;
                }

%%

