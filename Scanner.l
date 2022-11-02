%option noyywrap
%{
	#include <stdio.h>
	#include "y.tab.h"
%}

%%
[a-z][a-z0-9]+  {return IDENTIFICADOR;}
[0-9]+		    {return CONSTANTE;}
[+-]		    {return OPADICION;}
[*/^]           {return OPMULTIPLICACION;}
[=;()]		    {return yytext[0];}
.		;
%%
