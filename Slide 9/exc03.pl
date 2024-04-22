%3) Defina o predicado soma(L,S)
%que calcula a soma S dos itens da lista L. Por exemplo, soma([4,9,1],S) resulta em S=14.

soma([X], X).
soma([X|Y], S) :- soma(Y, S1), S is S1 + X.
