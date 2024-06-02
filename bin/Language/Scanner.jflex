// 1. Package e importaciones
package Language;
import java_cup.runtime.*;
%%

//  2. Configuraciones para el analisis (operaciones y declaraciones)
%{
    // Codigo Java
%}

// Directivas
%class Scanner
%public
%cupsym TOK
%cup
%char
%column
%line
%unicode
%ignorecase

// Constructor
%init{
    yyline = 1;
    yychar = 1;
%init}

// Expresiones regulares
UNUSED=[ \r\t]+
CONTENT = ([^\n\"\\]|\\.)
ID = (\_)*[a-zA-Z][a-zA-Z0-9\_]*
STRING = \"({CONTENT}*)\"
CHAR = \'({CONTENT})\'
INTEGER = [0-9]+
DOUBLE = [0-9]+\.[0-9]+
COMMENTS = "//"([^\r\n]*)?
COMMENTM = [/][*][^*]*[*]+([^/*][^*]*[*]+)*[/]

%%
// 3. Reglas Semanticas
// Reservadas
"init"              {return new Symbol(TOK.RW_int,              yyline, yychar, yytext());}
"double"            {return new Symbol(TOK.RW_double,           yyline, yychar, yytext());}
"bool"              {return new Symbol(TOK.RW_bool,             yyline, yychar, yytext());}
"char"              {return new Symbol(TOK.RW_char,             yyline, yychar, yytext());}
"std::string"       {return new Symbol(TOK.RW_str,              yyline, yychar, yytext());}
"true"              {return new Symbol(TOK.RW_true,             yyline, yychar, yytext());}
"false"             {return new Symbol(TOK.RW_false,            yyline, yychar, yytext());}
"pow"               {return new Symbol(TOK.RW_pow,              yyline, yychar, yytext());}
"new"               {return new Symbol(TOK.RW_new,              yyline, yychar, yytext());}
"if"                {return new Symbol(TOK.RW_if,               yyline, yychar, yytext());}
"else"              {return new Symbol(TOK.RW_else,             yyline, yychar, yytext());}
"switch"            {return new Symbol(TOK.RW_switch,           yyline, yychar, yytext());}
"case"              {return new Symbol(TOK.RW_case,             yyline, yychar, yytext());}
"default"           {return new Symbol(TOK.RW_default,          yyline, yychar, yytext());}
"while"             {return new Symbol(TOK.RW_while,            yyline, yychar, yytext());}
"for"               {return new Symbol(TOK.RW_for,              yyline, yychar, yytext());}
"do"                {return new Symbol(TOK.RW_do,               yyline, yychar, yytext());}
"break"             {return new Symbol(TOK.RW_break,            yyline, yychar, yytext());}
"continue"          {return new Symbol(TOK.RW_continue,         yyline, yychar, yytext());}
"return"            {return new Symbol(TOK.RW_return,           yyline, yychar, yytext());}
"void"              {return new Symbol(TOK.RW_void,             yyline, yychar, yytext());}
"cout"              {return new Symbol(TOK.RW_cout,             yyline, yychar, yytext());}
"endl"              {return new Symbol(TOK.RW_endl,             yyline, yychar, yytext());}
"tolower"           {return new Symbol(TOK.RW_tolower,          yyline, yychar, yytext());}
"toupper"           {return new Symbol(TOK.RW_toupper,          yyline, yychar, yytext());}
"round"             {return new Symbol(TOK.RW_round,            yyline, yychar, yytext());}
"length"            {return new Symbol(TOK.RW_length,           yyline, yychar, yytext());}
"typeof"            {return new Symbol(TOK.RW_typeof,           yyline, yychar, yytext());}
"std::tostring"     {return new Symbol(TOK.RW_tostring,         yyline, yychar, yytext());}
"c_str"             {return new Symbol(TOK.RW_c_str,            yyline, yychar, yytext());}
"execute"           {return new Symbol(TOK.RW_execute,          yyline, yychar, yytext());}
// Valores
{STRING}            {return new Symbol(TOK.TK_string,           yyline, yychar, yytext().substring(1, yytext().toString().length() - 1));}
{CHAR}              {return new Symbol(TOK.TK_char,             yyline, yychar, yytext().substring(1, yytext().toString().length() - 1));}
{INTEGER}           {return new Symbol(TOK.TK_int,              yyline, yychar, yytext());}
{DOUBLE}            {return new Symbol(TOK.TK_double,           yyline, yychar, yytext());}
// Variables
{ID}                {return new Symbol(TOK.TK_string,           yyline, yychar, yytext());}
// Incremento y Decremento
"++"                {return new Symbol(TOK.TK_inc,              yyline, yychar, yytext());}
"--"                {return new Symbol(TOK.TK_dec,              yyline, yychar, yytext());}
// Concatenacion
"+="                {return new Symbol(TOK.TK_add,              yyline, yychar, yytext());}
"-="                {return new Symbol(TOK.TK_sub,              yyline, yychar, yytext());}
// Opoeradorfes Aritmeticos
"+"                 {return new Symbol(TOK.TK_plus,             yyline, yychar, yytext());}
"-"                 {return new Symbol(TOK.TK_minus,            yyline, yychar, yytext());}
"*"                 {return new Symbol(TOK.TK_mult,             yyline, yychar, yytext());}
"/"                 {return new Symbol(TOK.TK_div,              yyline, yychar, yytext());}
"%"                 {return new Symbol(TOK.TK_mod,              yyline, yychar, yytext());}
// Operadores Relacionales
"=="                {return new Symbol(TOK.TK_equequ,           yyline, yychar, yytext());}
"!="                {return new Symbol(TOK.TK_notequ,           yyline, yychar, yytext());}
"<="                {return new Symbol(TOK.TK_lessequ,          yyline, yychar, yytext());}
">="                {return new Symbol(TOK.TK_moreequ,          yyline, yychar, yytext());}
"="                 {return new Symbol(TOK.TK_equ,              yyline, yychar, yytext());}
"<"                 {return new Symbol(TOK.TK_less,             yyline, yychar, yytext());}
">"                 {return new Symbol(TOK.TK_more,             yyline, yychar, yytext());}
// Operadores Lógicos
"&&"                {return new Symbol(TOK.TK_and,              yyline, yychar, yytext());}
"||"                {return new Symbol(TOK.TK_or,               yyline, yychar, yytext());}
"!"                 {return new Symbol(TOK.TK_not,              yyline, yychar, yytext());}
// Simbolos de Agrupacion
"("                 {return new Symbol(TOK.TK_lpar,             yyline, yychar, yytext());}
")"                 {return new Symbol(TOK.TK_rpar,             yyline, yychar, yytext());}
"{"                 {return new Symbol(TOK.TK_lbrc,             yyline, yychar, yytext());}
"}"                 {return new Symbol(TOK.TK_rbrc,             yyline, yychar, yytext());}
"["                 {return new Symbol(TOK.TK_lbcs,             yyline, yychar, yytext());}
"]"                 {return new Symbol(TOK.TK_rbcs,             yyline, yychar, yytext());}
// Fin de Instrucciones
","                 {return new Symbol(TOK.TK_comma,            yyline, yychar, yytext());}
":"                 {return new Symbol(TOK.TK_colon,            yyline, yychar, yytext());}
";"                 {return new Symbol(TOK.TK_semicolon,        yyline, yychar, yytext());}
\n                  {yychar = 1;}
{UNUSED}            {}
{COMMENTS}          {}
{COMMENTM}          {}
.                   {}