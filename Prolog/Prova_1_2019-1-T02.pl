/*
Questão 1 (2 pontos) - C2: Escreva em PROLOG as cláusulas juntar(+L1,+L2,?L3) para juntar duas listas,
intercalando seus elementos, como pedido na Questão 4 da Lista 1. Por exemplo:
?- juntar([a,b,c],[d,e,f,g,h], L).
L = [a,d,b,e,c,f,g,h].
*/

juntar([],L,L):-!.
juntar([X|L1],L2,[X|L]):- juntar(L2,L1,L).


/*
Questão 2 (2 pontos) - C2: Escreva em PROLOG as cláusulas divide(+L,+N,?L1,?L2)que divide a lista L
nas listas L1 e L2, sendo que os N primeiros elementos de L estarão em L1 e o restante em L2. Por exemplo:
?- divide([a,b,c,d,e,f,g,h,i,k],3,L1,L2).
L1 = [a,b,c]
L2 = [d,e,f,g,h,i,k]

As cláusulas devem falhar se N for maior que o comprimento de L.

*/

divide(L,0,[],L) :- !.
divide([H|L],N,[H|L1],L2) :- N1 is N-1, divide(L, N1, L1, L2).


/*
Questão 3 (2 pontos) - C5: Escreva em PROLOG as cláusulas empacote(+L,?LL),  que transforma uma lista
em uma lista de listas, empacotando elementos iguais em sublistas distintas.  Por exemplo:
?- empacote([a,a,a,b,c,c,a,a,d,e,e,e,e],X).
X = [[a,a,a,a,a],[b],[c,c],[d],[e,e,e,e]]
*/

empacote(_,[],[],[]):-!.
empacote(X,[X|L],R,[X|LR]) :- empacote(X,L,R,LR),!.
empacote(X,[Y|L],[Y|R],LR) :- empacote(X,L,R,LR),!.
empacote([],[]):-!.
empacote([H|L],[LR|LL]):- empacote(H,[H|L],R,LR), empacote(R,LL).

/*
Questão 4 (2 pontos) - C3: Escreva em PROLOG as cláusulas codifique(+L,?LL), que codifica a lista L em
uma lista de listas LL codificada por comprimento linear dos elementos repetidos em L. Por exemplo:
?- codifique([a,a,a,b,c,c,a,a,d,e,e,e,e],X).
X = [[5,a],[1,b],[2,c],[1,d],[4,e]]
Você pode assumir a existência das cláusulas empacote da questão anterior e length/2 do Prolog.
*/

codifique_aux([],[]):-!.
codifique_aux([H|LR],[[N,X]|LLR]):- length(H, N), H = [X|_], codifique_aux(LR,LLR).

codifique([],[]):-!.
codifique(L,[[N,X]|LLR]):- empacote(L, [H|LR]), length(H, N), H = [X|_], codifique_aux(LR,LLR).

/*
Questão 5 (2 pontos) - C5: Escreva em PROLOG as cláusulas circule(+L,+N,?LR),  que recebe uma lista L e
gira ciclicamente os seus elementos N vezes para esquerda, se N>0 e para direita, se N<0 . Por exemplo:

?- circule([a,b,c,d,e,f,g,h],3,X).
X = [d,e,f,g,h,a,b,c]
?- circule([a,b,c,d,e,f,g,h],-2,X).
X = [g,h,a,b,c,d,e,f]

Você pode assumir a existência das cláusulas append/3 do PROLOG.
*/

circule(L, 0, L):-!.
circule(L, N, LO) :- N > 0, M is N-1, append(R, [X], LO), circule(L, M, [X|R]),!.
circule(L, N, [X|LO]) :- N < 0, M is N+1, append(LO, [X], R), circule(L, M, R),!.

