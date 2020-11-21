%{
#include <iostream>
#include <fstream>

static void yyerror(const char *msg);
static int yyparse(void);

int yylex(void);

extern FILE *yyin;

%}

%code requires
{

}

%union
{
    int a;
    int b;
}

%%
program:
    %empty
;
%%


static void yyerror(const char* msg)
{
    std::cerr << "BLAD: " << msg << std::endl;
}

int compile(const char* in_file, const char* out_file)
{
    yyin = fopen(in_file, "r");
    const int ret = yyparse();
    fclose(yyin);

    std::ofstream outstream;
    outstream.open(out_file);

    outstream << "(TEST)" << std::endl;

    return ret;
}