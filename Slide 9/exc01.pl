%1) Defina o predicado último(L), que retorne o último item da numa
%lista L. Por exemplo, último([a,b,c]), resulta em c.

ultimo(L, [L]).
ultimo(L,[_|Y]) :-
    ultimo(L, Y).
