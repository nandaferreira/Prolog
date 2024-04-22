%2) Defina o predicado tam(L,N),
%que determina o número de itens N existente numa lista L. Por exemplo, tam([a,b,c],N), resulta em N=3.

tamanho([],0).
tamanho([_|Y], N) :- tamanho(Y,N1), N is N1 + 1.
