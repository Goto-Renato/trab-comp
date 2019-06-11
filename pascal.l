%{
/*
 * scan.l
 *
 * lex input file for pascal scanner
 *
 * extensions: to ways to spell "external" and "->" ok for "^".
 */

#include <stdio.h>
// #include "y.tab.h"
int line_no = 1;
void commenteof();

%}

NQUOTE [^']
%%

"and"   return(AND);
"array"   return(ARRAY);
"case"   return(CASE);
"const"   return(CONST);
"div"   return(DIV);
"do"    return(RETURN);
"downto"  return(DOWNTO);
"else"   return(ELSE);
"end"   return(END);
"extern"|"external" return(EXTERNAL);
"for"   return(FOR);
"forward"  return(FORWARD);
"function" return(FUNCTION);
"goto"   return(GOTO);
"if"    return(IF);
"in"    return(IN);
"label"   return(LABEL);
"mod"   return(MOD);
"nil"   return(NIL);
"not"   return(NOT);
"of"    return(OF);
"or"    return(OR);
"otherwise" return(OTHERWISE);
"packed"  return(PACKED);
"begin"   return(PBEGIN);
"file"   return(PFILE);
"procedure" return(PROCEDURE);
"program"  return(PROGRAM);
"record"  return(RECORD);
"repeat"  return(REPEAT);
"set"   return(SET);
"then"   return(THEN);
"to"    return(TO);
"type"   return(TYPE);
"until"   return(UNTIL);
"var"   return(VAR);
"while"   return(WHILE);
"with"   return(WITH);
[a-zA-Z]([a-zA-Z0-9])+  return(IDENTIFIER);

":="    return(ASSIGNMENT);
'({NQUOTE}|'')+'  return(CHARACTER_STRING);
":"    return(COLON);
","    return(COMMA);
[0-9]+    return(DIGSEQ);
"."    return(DOT);
".."    return(DOTDOT);
"="    return(EQUAL);
">="    return(GE);
">"    return(GT);
"["    return(LBRAC);
"<="    return(LE);
"("    return(LPAREN);
"<"    return(LT);
"-"    return(MINUS);
"<>"    return(NOTEQUAL);
"+"    return(PLUS);
"]"    return(RBRAC);
[0-9]+"."[0-9]+   return(REALNUMBER);
")"    return(RPAREN);
";"    return(SEMICOLON);
"/"    return(SLASH);
"*"    return(STAR);
"**"    return(STARSTAR);
"->"   |
"^"    return(UPARROW);

"(*"   |
"{"    { register int c;
     while ((c = input()))
     {
      if (c == '}')
       break;
      else if (c == '*')
      {
       if ((c = input()) == ')')
        break;
       else
        unput (c);
      }
      else if (c == '\n')
       line_no++;
      else if (c == 0)
       commenteof();
     }
    }

[ \t\f]    ;

\n    line_no++;

.    { fprintf (stderr,
    "'%c' (0%o): illegal charcter at line %d\n",
     yytext[0], yytext[0], line_no);
    }

%%

void commenteof()
{
 fprintf (stderr, "unexpected EOF inside comment at line %d\n",
  line_no);
 exit (1);
}

int main()
{
    yylex();
    printf("\nNumero lineas analizadas: %d\n", line_no); 
    return 0;
}
