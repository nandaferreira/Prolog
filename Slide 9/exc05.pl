%5) Defina um predicado retornaElemento(N, Elem, L) que retorna o Elememento (Elem) da posição N da lista L.
%retornaElemento(Posicao, Elemento, Lista).

retornaElemento(1,X,[X|_]).
retornaElemento(Posicao, Elemento, [_|Y]) :- Posicao1 is Posicao - 1, retornaElemento(Posicao1, Elemento, Y).
