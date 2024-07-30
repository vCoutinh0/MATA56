/*
%Q1
concatenar(L1, [], L1) :- !.
concatenar([], L2, L2) :- !.
concatenar([X|R], L2, [X|W]) :- concatenar(R,L2,W).

%Q2

concatenarInv(L1, [], L1) :- !.
concatenarInv([], L2, L2) :- !.
concatenarInv(L1, [X|R], [X|W]) :- concatenarInv(L1,R,W).

%Q3

concatenarListas([], []) :- !.
concatenarListas([X|R], Z) :- concatenarListas(R, W),!, concatenar(X,W,Z).

insere1(X,L,[X|L]):-!.
insere1(X,[Y|R],[Y|Rertorno]) :- insere1(X,R,Retorno).

insere(X,L,[X|L) :!.
insere(X,[Y|R], [Y|R2]) :- insere(X,R,R2).
*/



%--------------LISTA01-V06
%%Q1) Escreva as cláusulas para concatenar duas listas.

concatenar([],L2,L2):-!.
concatenar([X|R],L2,[X|L]):- concatenar(R,L2,L).

%%Q2) Escreva as cláusulas para concatenar duas listas, sendo que a segunda lista vem na frente.

concatenarInv(L1, L2, L) :- concatenar(L2,L1,L).

%%Q3 Escreva as cláusulas para concatenar uma lista de listas.

concatenar([X|[]], X):-!.
concatenar([X|R], L) :- concatenar(R, W), concatenar(X,W,L).

%Q4 Escreva as cláusulas para juntar duas listas, intercalando seus elementos.
/*
Por exemplo:
?- mesclando([a,b,c],[d,e,f,g,h], L).
Deve retornar:
L = [a,d,b,e,c,f,g,h].
*/
mesclando([],L2,L2):-!.
mesclando(L1,[],L1):-!.
mesclando([X|R1],[Y|R2],[X,Y|L]):- mesclando(R1,R2,L).

%Q5 Escreva as cláusulas para adicionar um elemento ao final de uma lista.
%OBS: O head de uma lista é um elemento apenas, já o resto é uma lista de elementos
/*
Por exemplo:
?- adicionarFinal(z,[a,b,c], L).
Deve retornar:
L = [a,b,c,z].
*/

adicionarFinal(X,[],[X]):-!.
adicionarFinal(X,[H|R],[H|W]) :- adicionarFinal(X,R,W).

%Q6 Escreva as cláusulas para inverter uma lista.

/*
Por exemplo:
?- inverter([a,b,c],L).
Deve retornar:
L = [c,b,a].
*/

%coloque(X,L,[X|L]).

%inverter([H|[]],L,[H|L]):-!.
%inverter([H|R],L,W):- coloque(H,L,LR), inverter(R,LR,W).

inverter([],A,A) :- !.
inverter([X|R],A,LR) :- inverter(R,[X|A],LR).
inverter(L,W):- inverter(L,[],W).
  
  
%Q7 Escreva as cláusulas para inverter uma lista genérica de tal forma que todas as suas sublistas sejam também invertidas
/*
Por exemplo:
?- inverterLG([a,b,[c,d,e]], L).
Deve retornar:
L = [[e,d,c],b,a]
*/

is_list([]) :- !.
is_list([_|R]) :- is_list(R).

inverterLG([],A,A) :- !.
inverterLG([X|R],A,LR) :- is_list(X), inverterLG(X, LX), inverterLG(R,[LX|A],LR),!.
inverterLG([X|R],A,LR) :- inverterLG(R,[X|A],LR).
inverterLG(L,W):- inverterLG(L,[],W).


%Q8 Escreva as cláusulas parear que recebe um elemento E e uma lista L, e produz a lista de pares cujo primeiro elemento é E e o segundo elemento é um membro de L.
/*
Por exemplo:
?- parear(x,[a,b,c], LL).
Deve retornar:
LL = [[x,a],[x,b],[x,c]].
*/
parear(_, [], L, W):- inverter(L,W),!.
parear(X, [H|R], L, W) :- parear(X, R, [[X,H]|L], W).
parear(X, [H|R], W) :- parear(X, R, [[X,H]|[]], W).


%Q9 Escreva as cláusulas pares que recebe uma lista L, e produz a lista de todos os pares não ordenados dos elementos de L.
/*
Por exemplo:
?- pares([a,b,c,d], LL).
Deve retornar:
L = [[a, b], [a, c], [a, d], [b, c], [b, d], [c, d]].
*/
pares([_|[]],L,L):- !.
pares([H|R],L,W) :- parear(H, R, L1), concatenar(L,L1,LL), pares(R,LL,W).
pares([H|R],W) :- parear(H, R, L1), pares(R,L1,W).


