%------- exc01 -------
fatorial(0,1).
fatorial(N,F) :-
	( N > 0,
	  N1 is N - 1,
	  fatorial(N1, F1),
	  F is N*F1
	).

%------- exc02 -------

caminho(a,b,5).
caminho(b,e,25).
caminho(a,c,10).
caminho(c,d,10).
caminho(d,e,5).
caminho(e,f,5).
caminho(a,g,75).
caminho(g,f,20).
caminho(b,f,5).
caminho(a,f,5).

%Sempre pensar primeiro no caso base, o mais "bobo" de acontecer:
custoCaminho(Origem,Origem,0).

%Qual o custo de um lugar A até B, passando por todos os caminhos possíveis?
custoCaminho(Origem, Destino, Custo) :-
    (   
    	caminho(Origem, Proximo, CustoA1),
        custoCaminho(Proximo, Destino, CustoA2),
        Custo is CustoA1 + CustoA2
    ).

%------- exc03 -------

%calculoMDC(X,Y,Z).
%calculoMDC(40,60,20). (Qual o caso base?)

%O caso base será quando tivermos um cálculo de MDC entre um X qualquer e o 0 (MDC resultará no próprio X).
calculoMDC(X,0,X).

%O que eu retorno? A multiplicação dos valores que dividem ambos números, simultaneamente, então:
%Detalhe: Y > 0, porque, se for 0 -> entra no caso base; se for Y < 0, é invalido. Então limita o usuário a numeros>0.

calculoMDC(X,Y,Z) :- 
    (   Y > 0,
        Y2 is X mod Y, %guarda o resto da divisao entre X e Y
        calculoMDC(Y, Y2, Z) %chamada recursiva. Acontece até que Y seja igual a 0.
    ).


------- exc04 -------



