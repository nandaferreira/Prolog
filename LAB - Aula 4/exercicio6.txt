%Escreva uma regra para o predicado sucessor(X, Y), 
%que indica que o número X é sucessor do número Y.

sucessor(X, Y) :-  X is Y+1.

%Escreva uma regra para o predicado par(X), 
%que indica se o número inteiro não-negativo X é par.

par(X) :-
    (   X > 0,
    	Resto is X mod 2,
        Resto =:= 0
    ).

%Escreva uma regra para o predicado triplo(X, Y), 
%que indica que X é o triplo do número Y.

triplo(X,Y) :- X is Y*3.

%Escreva uma regra para o predicado entre(X, A, B), 
%que indica que o número X está entre os números A e B, 
%inclusive (isto é, deve retornar verdadeiro também se X = A ou X = B).

entre(X, A, B) :- 
    (   X >= A, X =< B; 
    	X =< A, X >=B
    ).
