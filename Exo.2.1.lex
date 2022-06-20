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
[1-9]{1,2}      {return(NB);}
{NUMBER}{8}     {return(CODEDOS);}
Dossier         {return(DOS);}
{PRENOMNOM}     {return(PRENOMNOM);}
T{NUMBER}+      {return(CODECONCERT);}
{CONCERT}       {return(NOMCONCERT);}
{DATE}          {return(DATE);}
{HH}:{MM}       {return(HEURE);}
places          {return(PLACE);}
[\n]            {return(RC);}
[ ]             {return(SPACE);}
<<EOF>>         {return (FIN);}

%%
