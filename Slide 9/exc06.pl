apagar(_,[],[]). %não tem como deletar da lista vazia
apagar(Item,[Item|Y], L2):-apagar(Item, Y, L2).
apagar(Item,[X|Y],[X|L2]):-Item\=X, apagar(Item, Y, L2). 
