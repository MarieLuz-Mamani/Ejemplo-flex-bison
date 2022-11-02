%{
	#include <stdio.h>
	#include <conio.h>
	void yyerror(const char *);
%}

%token CONSTANTE
%token IDENTIFICADOR
%token OPADICION
%token OPMULTIPLICACION

%% 

programa        : listaSentencias
	            ;
listaSentencias : listaSentencias sentencia 
		        | sentencia
		        ;
sentencia       : IDENTIFICADOR '=' expresion ';'
                ;
expresion       : termino
                | termino OPADICION expresion
                ;
termino         : factor 
                | factor OPMULTIPLICACION termino 
                ;
factor          : CONSTANTE
                | '(' expresion ')'
                ;

%%

int main(void)
{
	if(yyparse()==0)
		printf("Compilacion exitosa\n");
	return 0;
}

void yyerror(const char * s)
{
	puts(s);
	return ;
}
