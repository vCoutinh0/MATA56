/*
Quest�o 1 (2 pontos) � C3 Escreva em PROLOG as cl�usulas para ocultar uma palavra em uma lista de
palavras. A palavra ocultada deve ser substitu�da por xxxx. As cl�usulas que voc� escrever devem
retornar metas do tipo:
? - oculte(casa, [minha, casa, �, bonita, �, uma, linda, casa],L).
L = [minha, xxxx, �, bonita, �, uma, linda, xxxx].
*/

oculte(_,[],[]) :- !.
oculte(X,[H|R], [xxxx|W]) :- H == X, oculte(X, R, W),!.
oculte(X,[H|R], [H|W]) :- oculte(X, R, W).

/*
Quest�o 2 (2 pontos) � C2 Escreva em PROLOG as cl�usulas para ocultar um conjunto de palavras de
uma lista de palavras. As palavras ocultadas devem ser substitu�das por xxxx. Voc� pode assumir a
exist�ncia das cl�usulas da quest�o 1. As cl�usulas que voc� escrever devem retornar metas do tipo:
? � oculteConj([casa,bonita], [minha, casa, �, bonita, linda, casa],L).
L = [minha, xxxx, �, xxxx, linda, xxxx].
*/

oculteConj([],L,L) :- !.
oculteConj([H|R],L,W) :- oculte(H,L,L1), oculteConj(R, L1, W).

/*
Quest�o 3 (2 pontos) � C2: Escreva em PROLOG a cl�usula intercala(X,Y,N,L) que produz uma
lista L de tamanho N intercalando os valores X e Y. Por exemplo:
?- intercala(vermelho,azul,5,L).
L = [vermelho, azul, vermelho, azul, vermelho].
?- intercala(vermelho,azul,4,L).
L = [vermelho, azul, vermelho, azul].
*/

intercala(_,_,0,[]) :- !.
intercala(X,Y,N,[X|W]) :- N > 0, N1 is N-1, intercala(Y,X,N1,W).


/*
Quest�o 4 (2 pontos) � C5: Escreva em PROLOG a cl�usula sumarize(L,L1,L2), que sumariza a
lista L em duas listas: L1, que cont�m os elementos L, e L2, que cont�m o n�mero de ocorr�ncias destes
elementos em L. Por exemplo:
?- sumarize([a,a,a,d,e,s,s,s,e,e,a,a,w],L1,L2).
L1 = [a, d, e, s, w],
L2 = [5, 1, 3, 3, 1].
*/

sumarize(_,[],[],1) :- !.
sumarize(X,[X|L],R1,N) :- sumarize(X,L,R1,N1), N is N1 + 1, !.
sumarize(X,[Y|L],[Y|R1],N) :- sumarize(X,L,R1,N), !.

sumarize([],[],[]):- !.
sumarize([H|R],[H|L2],[N1|N2]) :- sumarize(H,R,R1,N1), sumarize(R1,L2,N2).

/*
Quest�o 5 (2 pontos) � C4: Escreva em PROLOG as cl�usulas empacote(L,LL), que transforma uma
lista em uma lista de listas, empacotando elementos consecutivos iguais em sublistas distintas. Por
exemplo:
?- empacote([a,a,a,b,c,c,a,a,d,e,e,e,e],X).
X = [[a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]
*/


empacote(X,[],_,[X]):-!.
empacote(X,[X|L],R1,[X|R2]) :- empacote(X,L,R1,R2),!.
empacote(X,[Y|L],[Y|L],[X]) :- !.

empacote([],[]) :- !.
empacote([H|R],[L1|L2]):- empacote(H,R,R1,L1), empacote(R1,L2).

