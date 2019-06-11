yacc -v pascal.y
lex pascal.l
gcc -o a.out y.tab.c lex.yy.c -lfl -lm
./a.out < inp
