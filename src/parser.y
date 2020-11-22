%{
#include <iostream>
#include <fstream>
#include <cstdio>

static void yyerror(const char *msg);
static int yyparse(void);

int yylex(void);

extern FILE *yyin;

#ifdef YAC_DEBUG
#define pr_dbg(...) fprintf(stderr, __VA_ARGS__)
#else
#define pr_dbg(...)
#endif

%}

%code requires
{
    #include <stdint.h>
    #include <string>

    typedef struct Parser_token
    {
        uint64_t val;
        uint64_t line;
        std::string* str;
    } Parser_token;

}

%union
{
    Parser_token ptoken;
}

%token	YY_EQ YY_NE YY_LT YY_GT YY_LE YY_GE
%token 	YY_ADD YY_SUB YY_DIV YY_MOD YY_MUL
%token	YY_ASSIGN
%token	YY_DECLARE_VAR YY_BEGIN YY_END
%token	YY_READ YY_WRITE
%token	YY_FOR YY_FROM YY_TO YY_DOWNTO YY_ENDFOR
%token	YY_WHILE YY_DO YY_ENDWHILE
%token  YY_REPEAT YY_UNTIL
%token	YY_IF YY_THEN YY_ELSE YY_ENDIF
%token	YY_VARIABLE YY_NUM
%token	YY_L_BRACKET YY_R_BRACKET YY_ARRAY_RANGE
%token	YY_ERROR
%token	YY_SEMICOLON YY_COMMA


%type <ptoken>	YY_EQ YY_NE YY_LT YY_GT YY_LE YY_GE
%type <ptoken> 	YY_ADD YY_SUB YY_DIV YY_MOD YY_MUL
%type <ptoken>	YY_ASSIGN
%type <ptoken>	YY_DECLARE_VAR YY_BEGIN YY_END
%type <ptoken>	YY_READ YY_WRITE
%type <ptoken>	YY_FOR YY_FROM YY_TO YY_DOWNTO YY_ENDFOR
%type <ptoken>	YY_WHILE YY_DO YY_ENDWHILE
%type <ptoken>  YY_REPEAT YY_UNTIL
%type <ptoken>	YY_IF YY_THEN YY_ELSE YY_ENDIF
%type <ptoken>	YY_VARIABLE YY_NUM
%type <ptoken>	YY_L_BRACKET YY_R_BRACKET YY_ARRAY_RANGE
%type <ptoken>	YY_ERROR
%type <ptoken>	YY_SEMICOLON YY_COMMA

%type <ptoken>  lvalue rvalue value

%%

program:
    YY_DECLARE_VAR vdeclar YY_BEGIN commands YY_END
    {

    }
    | YY_BEGIN commands YY_END
    {

    }
;

value:
    lvalue
    {

    }
    | rvalue
    {

    }
;

rvalue:
    YY_NUM
    {

    }
;

lvalue:
    YY_VARIABLE
    {

    }
    | YY_VARIABLE YY_L_BRACKET YY_VARIABLE YY_R_BRACKET
    {

    }
    | YY_VARIABLE YY_L_BRACKET YY_NUM YY_R_BRACKET
    {

    }
;

vdeclar:
    | vdeclar YY_COMMA YY_VARIABLE
    {
        pr_dbg("Next Variable declaration: %s\n", $3.str->c_str());
    }
    | vdeclar YY_COMMA YY_VARIABLE YY_L_BRACKET YY_NUM YY_ARRAY_RANGE YY_NUM YY_R_BRACKET
    {
        pr_dbg("Next Array declaration: %s\n", $3.str->c_str());
    }
    | YY_VARIABLE
    {
        pr_dbg("First Variable declaration: %s\n", $1.str->c_str());
    }
    | YY_VARIABLE YY_L_BRACKET YY_NUM YY_ARRAY_RANGE YY_NUM YY_R_BRACKET
    {
        pr_dbg("First Array declaration: %s\n", $1.str->c_str());
    }
;

commands:
    commands command
    {

    }
    | command
    {

    }

;

command:
    lvalue YY_ASSIGN expr YY_SEMICOLON
    {
        pr_dbg("Assigment\n");
    }
    | YY_READ lvalue YY_SEMICOLON
    {
        pr_dbg("Read\n");
    }
    | YY_WRITE value YY_SEMICOLON
    {
        pr_dbg("Write\n");
    }
    | fordeclar forend
    {
        pr_dbg("For loop\n");
    }
    | whiledeclar whileend
    {
        pr_dbg("While loop\n");
    }
    | repeatdeclar repeatend
    {
        pr_dbg("Repeat until loop\n");
    }
    | ifcond ifelse ifend
    {
        pr_dbg("If then else end\n");
    }
    | ifcond ifend
    {
        pr_dbg("If then end\n");
    }
;

fordeclar:
    YY_FOR YY_VARIABLE YY_FROM value YY_TO value YY_DO
    {
        pr_dbg("For DO\n");
    }
    | YY_FOR YY_VARIABLE YY_FROM value YY_DOWNTO value YY_DO
    {
        pr_dbg("For DOWNTO\n");
    }
;

forend:
    commands YY_ENDFOR
    {

    }
;

whiledeclar:
    prewhile cond YY_DO
    {

    }
;

prewhile:
    YY_WHILE
    {

    }
;

whileend:
    commands YY_ENDWHILE
    {

    }
;

repeatdeclar:
    YY_REPEAT
    {

    }
;

repeatend:
    commands YY_UNTIL cond YY_SEMICOLON
    {

    }
;

ifcond:
    YY_IF cond YY_THEN
    {

    }
;

ifend:
    commands YY_ENDIF
    {

    }
;

ifelse:
    commands YY_ELSE
    {

    }
;

expr:
    value
    {
        pr_dbg("Value expression\n");
    }
    | value YY_ADD value
    {
        pr_dbg("ADD\n");
    }
    | value YY_SUB value
    {
        pr_dbg("SUB\n");
    }
    | value YY_MUL value
    {
        pr_dbg("MUL\n");
    }
    | value YY_DIV value
    {
        pr_dbg("DIV\n");
    }
    | value YY_MOD value
    {
        pr_dbg("MOD\n");
    }
;

cond:
    value YY_EQ value
    {
        pr_dbg("EQ\n");
    }
    | value YY_NE value
    {
        pr_dbg("NE\n");
    }
    | value YY_LT value
    {
        pr_dbg("LT\n");
    }
    | value YY_LE value
    {
        pr_dbg("LE\n");
    }
    | value YY_GT value
    {
        pr_dbg("GT\n");
    }
    | value YY_GE value
    {
        pr_dbg("GE\n");
    }
;

%%


static void yyerror(const char* msg)
{
    std::cerr << "BLAD: " << msg << " w lini " << yylval.ptoken.line << std::endl;
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