%------------------------------ AULA 3 ------------------------------

(%EXC 01)

%Considere as relações ao lado. Pede-se:
%​ - Defina a base de conhecimento​. 
% - Defina regras para: pai, mãe, tio, tia, irmão, irmã, irmão, avô, avó. ​

mulher(ana).
mulher(eva).
mulher(bia).
mulher(clô).
mulher(lia).
mulher(gal).

homem(ivo).
homem(gil).
homem(raí).
homem(ary).
homem(noé).

gerou(ana, eva).
gerou(ivo, eva).
gerou(bia, raí).
gerou(bia, clô).
gerou(bia, ary).
gerou(gil, raí).
gerou(gil, clô).
gerou(gil, ary).
gerou(eva, noé).
gerou(raí, noé).
gerou(ary, gal).
gerou(lia, gal).


pai(X, Y) :- gerou(X, Y), homem(X). 

mãe(X, Y) :- gerou(X, Y), mulher(X). 

filho(X, Y):- gerou(Y, X), homem(X).

filha(X, Y) :- gerou(Y, X), mulher(X).

irmãos(X, Y) :- pai(Z, X), pai(Z,Y), mãe(W,X), mãe(W, Y).

irmão(X, Y) :- pai(Z, X), pai(Z,Y), mãe(W,X), mãe(W, Y), homem(X).

irmã(X, Y) :- pai(Z, X), pai(Z,Y), mãe(W,X), mãe(W, Y), mulher(X).
    
tio(X, Y) :- gerou(Z, Y), irmão(X, Z), homem(X).

tia(X, Y) :- gerou(Z, Y), irmã(X, Z), mulher(X).

avô(X, Y) :- gerou(Z, Y), filho(Z, X), homem(X).
avô(X,Y) :- gerou(Z, Y), filha(Z,X), homem(X).

avó(X, Y) :- gerou(Z, Y), filho(Z, X), mulher(X).
avó(X,Y) :- gerou(Z, Y), filha(Z, X), mulher(X).


%(EXC 02)

estuda(fabricio, programação).
estuda(joana, lógica).
estuda(ana, tcc). 
estuda(josé, banco).
estuda(lucas, estrutura).
estuda(nicolas, lógica).
estuda(fernanda, tcc).
estuda(maria, tcc).

aluno(fabricio, ufmg).
aluno(joana, ufu).
aluno(ana, ufu).
aluno(josé, ufu).
aluno(lucas, ufmg).
aluno(nicolas, ufu).
aluno(fernanda, ufu).
aluno(maria, ufu).

professor(joão, programação).
professor(clara, lógica).
professor(roberta, tcc).
professor(antonio, banco).
professor(leandro, estrutura).

reitor(beatriz, ufmg).
reitor(marcos, ufu).

oferta(bcc, programação).
oferta(bcc, lógica).
oferta(si, tcc).
oferta(si, banco).
oferta(bcc, estrutura).

aluno_professor(X, Y) :- professor(Y, Z), estuda(X, Z).
aluno_bcc(X, Y) :- estuda(X, Z), oferta(Y, Z).
aluno_bsi(X, Y) :- estuda(X, Z), oferta(Y,Z).
aluno_universidade(X, Y) :- aluno(X, Y).
disciplina_professor(X, Y) :- professor(Y, X).
professor_universidade(X, Y) :- aluno_professor(Z, X), aluno(Z, Y).
disciplinas_universidade(X, Y) :- estuda(Z, X), aluno(Z, Y).
reitor_professor(X, Y) :- professor_universidade(Y, Z), reitor(X, Z).


%(EXC 03)

nota(joao, 5.0).
nota(jose, 6.0).
nota(joana, 8.0).
nota(luiz, 9.0).
nota(antonio, 8.5).
nota(felipe, 6.5).
nota(maria, 4.5).
nota(sandra, 4.0).
nota(marcia, 10.0).
nota(suely, 2.0).
nota(jessica, 4.9).

diario(X) :-
    nota(X, Nota),
    	(   (Nota >= 7.0, Nota =< 10, write('Aprovado'));
        	(Nota >= 5.0, Nota < 6.9, write('Recuperacao'));
    		(Nota >= 0.0, Nota < 4.9, write('Reprovado'))
    	).


%(EXC 04)

livro('aurora', 2015, 'marcela ceribelli').
livro('dom casmurro', 1899, 'machado de assis').
livro('modernidade líquida', 1999, 'zygmunt bauman').
livro('angústia', 1936, 'graciliano ramos').
livro('noites brancas' , 1848, 'fiódor dostoiévski').
livro('água viva', 1973, 'clarice lispector').
livro('tudo é rio', 2015, 'carla madeira').
livro('o ponto zero da revolução', 2019, 'silvia federici').
livro('ensaio sobre a lucidez', 2004, 'josé saramargo').
livro('calibã e a bruxa', 2023, 'silvia federici').
livro('laços de familia', 1960, 'clarice lispector').
livro('o cortiço', 1890, 'josé de alencar').
livro('o livro do desassossego', 1982, 'fernando pessoa').
livro('o pequeno príncipe', 1943, 'antoine de saint-exupéry').
livro('solitária', 2023, 'eliana alves').
livro('a mística feminina', 1963, 'betty friedan').
livro('o capital', 1967, 'karl marx').
livro('todos os homens são mortais', 1946, 'simone de beauvoir').
livro('a redoma de vidro', 2015, 'sylvia plath').
livro('carta ao pai', 1919, 'franz kafka').

%Quais os livros de um determinado autor
livros_autor(Autor) :-
    (   livro(Nome,_, Autor),
        write(Nome),
        nl,
        fail
    ).

%Existe livro em dado ano
busca_por_ano(Ano) :- livro(_, Ano, _).

%Livros 2015 e 2023
livro_2015() :- 
    (   livro(Nome, 2015,_),
        write(Nome),
        nl,
        fail
    ).

livro_2023() :-
    (   livro(Nome, 2023,_),
        write(Nome),
        nl,
        fail
    ).

%Regra consultar qual ano livro X foi publicado
ano_publicacao(Livro, Ano) :- livro(Livro, Ano, _).

%Regra consultar livros escritos antes de ano X
livro_antes_de(X) :-
    (   ano_publicacao(Livro, Ano),
        Ano < X,
        write(Livro),
        nl, %isso é pra separar os nomes dos livros
        fail %isso cria uma condição para o programa ter que buscar por mais soluções, ai ele vai mostrando na tela até dar false
    ).


%(EXC 05)

%filme(Titulo, Gênero, Diretor, Ano, Min)

filme('amnésia', 'suspense', 'nolan', 2000, 113).
filme('babel', 'drama', 'inarritu', 2006, 142).
filme('capote', 'drama', 'miller', 2005, 98).
filme('casablanca', 'romance', 'curtiz', 1942, 102).
filme('matrix', 'ficção', 'wachowsk', 1999, 136).
filme('rebecca', 'suspense', 'hitchcock', 1940, 130).
filme('shrek', 'aventura', 'adamson', 2001, 90).
filme('sinais', 'ficção', 'shymalan', 2002, 106).
filme('spartacus', 'ação', 'kubrik', 1960, 184).
filme('superman', 'aventura', 'donner', 1978, 143).
filme('titanic', 'romance', 'cameron', 1997, 194).
filme('tubarão', 'suspense', 'spielberg', 1975, 124).
filme('volver', 'drama', 'almodóvar', 2006, 121).

% a)
diretor_filme(Nome, Diretor) :- filme(Nome,_, Diretor, _,_).

% b)
filmes_suspense() :- 
    	(   filme(Nome, 'suspense', _, _, _),
            write(Nome),
            nl,
            fail
        ).

% c)
filmes_diretor(Diretor) :-
    (   filme(Nome,_, Diretor, _, _),
        write(Nome)
    ).

% d)
ano_filme(Nome) :-
    (   filme(Nome,_,_, Ano,_),
        write(Ano)
    ).

% e)
filme_menos_100min() :-
    (   filme(Nome,_,_,_, Minutos),
        Minutos < 100,
        write(Nome),
        nl,
        fail
    ).
% f)
filmes_2000_2005() :-
    (   filme(Nome,_,_,Ano,_),
        Ano >= 2000,
        Ano =< 2005,
        write(Nome),
        nl,
        fail
    ).

% g)
classico() :- 
    (   filme(Nome,_,_,Ano,_),
        Ano < 1980,
        write(Nome),
        nl,
        fail
    ).

%h)
genero(Genero) :-
    	(   filme(Nome,Genero,_,_,_),
        	write(Nome),
        	nl,
        	fail
    	).

% i) Clássicos de suspense

classicos_suspense() :-
    (   filme(Nome, suspense,_,Ano,_),
        Ano < 1980,
        write(Nome),
        nl,
        fail
    ).
    
   
%(EXC 06)

%times_VCT(Time, Ano, País, Títulos, Treinos, Patrocinador).

times_VCT('loud', 2019, 'brasil', 10, 'segunda', 'itaú').
times_VCT('mibr', 2003, 'brasil', 7, 'terça', 'itaú').
times_VCT('sentinels', 2016, 'estados unidos', 5, 'quarta', 'starforge').
times_VCT('leviatán', 2020, 'argentina', 8, 'quinta', 'logitech').
times_VCT('furia', 2017, 'brasil', 9, 'sexta', 'itaú').
times_VCT('kru', 2020, 'argentina', 4, 'segunda', 'redbull').
times_VCT('100 thieves', 2017, 'estados unidos', 4, 'terça', 'redbull').
times_VCT('cloud9', 2020, 'estados unidos', 6, 'quarta', 'logitech').
times_VCT('evilG', 2015, 'canadá', 5, 'quinta', 'monster').
times_VCT('nrg', 2020, 'canadá', 6, 'sexta', 'monster').

%Em qual ano time X foi fundado?
ano_fundacao(Time) :- times_VCT(Time, Ano,_,_,_,_), write(Ano).

%Time X é brasileiro?
time_brasileiro(Time) :- times_VCT(Time,_,'brasil',_,_,_).

% X é patrocinador de time Y?
patrocina(Patrocinador, Time) :- times_VCT(Time,_,_,_,_,Patrocinador). 

%Quais os times que treinam na segunda?
treino_segunda() :-
    (   times_VCT(Time,_,_,_,'segunda',_),
        write(Time),
        nl,
        fail
    ).

%Qual time tem X títulos?
busca_por_titulo(Titulos) :- times_VCT(Nome,_,_,Titulos,_,_), write(Nome).

%Quais times fundados antes de 2017?
antes_2017() :-
    (   times_VCT(Time,Ano,_,_,_,_),
        Ano < 2017,
        write(Time),
        nl,
        fail
    ).



%------------------------------ AULA 4 ------------------------------

%(EXC 01)

mulher(ana).
mulher(julia).
mulher(patricia).
mulher(alana).
homem(matheus).
homem(rafael).
homem(carlos).
homem(joao).
gerou(ana, patricia).
gerou(ana, carlos).
gerou(matheus, patricia).
gerou(matheus, carlos).
gerou(julia,alana).
gerou(julia, joao).
gerou(rafael, alana).
gerou(rafael, joao).

%a
ehFeliz(X) :- gerou(X,Y).

%b)
casal(X,Y) :- gerou(X,Z), gerou(Y,Z).



%(EXC 02)

recebeDados():- write('Digite seu nome aqui:'),
    			read(Nome),
				write('Nome da disciplina 1:'),
				read(Disciplina1),
    			write('Nota obtida:'),
    read(Nota1),
    			write('Nome da disciplina 2:'),
    			read(Disciplina2),
    write('Nota obtida:'),
    read(Nota2),
    			write('Nome da disciplina 3:'),
    			read(Disciplina3),
    write('Nota obtida:'),
    read(Nota3),
    			write('Nome da disciplina 4:'),
    			read(Disciplina4),
    write('Nota obtida:'),
    read(Nota4),
    			write('Nome da disciplina 5:'),
    			read(Disciplina5),
    write('Nota obtida:'),

    

%(EXC 03)

aluno(carla, cálculo, 100).
aluno(fernanda, sistema,90).
aluno(letícia, dados, 80).
aluno(isabel, dados, 70).
aluno(maria, cálculo, 60).
aluno(isadora, sistemas, 100).
aluno(anna, cálculo, 80).
aluno(paloma, dados, 50).
aluno(beatriz, sistemas, 70).
aluno(ariel, sistemas, 60).
aluno(bruna, dados, 90).
aluno(clara, sistemas, 90).
aluno(pâmela, sistemas,60).
aluno(samira, dados, 100).
aluno(janice, dados, 80).
aluno(vitória, dados, 70).
aluno(joy, cálculo, 85).
aluno(lana, cálculo, 67).
aluno(olivia, dados, 40).

professor(elisa, cálculo, 3).
professor(camila, dados, 2).
professor(julia, sistemas, 1).

nota(NomeAluno, Disciplina, Valor) :-
    	(   aluno(NomeAluno, Disciplina, Valor), %pega a nota do aluno
        	professor(_, Disciplina, Peso), %pega o peso da disciplina
        	NotaAluno is (Valor*Peso)/5,
        	write(NotaAluno)
    	).



%(EXC 04)

governou(joao, 1952, 1968).
governou(jose, 1968, 1970).
governou(maria, 1970, 1974).
governou(joana, 1974, 1982).
governou(mario, 1982, 1988).
governou(rodrigo, 1988, 1994).
governou(ana, 1994, 1995).
governou(lucio, 1995, 2000).
governou(fernanda, 2005, 2010).

presidente(Nome, Ano) :- 
    (   governou(Nome, AnoComeço,AnoFim),
        Ano >= AnoComeço,
    	Ano =< AnoFim
    ).
 

%(EXC 05)

populacao(paisA, 203).
populacao(paisB, 548).
populacao(paisC, 800).
populacao(paisD, 108).
populacao(paisE, 392).
populacao(paisF, 290).
populacao(paisG, 111).
area(paisA, 8).
area(paisB, 3).
area(paisC, 10).
area(paisD, 8).
area(paisE, 5).
area(paisF, 3).
area(paisG, 4).

%construa a rega densidade(X, Y) que calcula a densidade demográfica Y do pais X.

densidade(Pais, Densidade) :-
    (   populacao(Pais, População),
        area(Pais, Área),
        Densidade is População/Área
    ).


%(EXC 06)

%Escreva uma regra para o predicado sucessor(X, Y), que indica que o número X %é sucessor do número Y.

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




%------------------------------ AULA 5 ------------------------------

%(EXC 01)

%estrada(Número,Origem,Destino)
%a)

estrada(1, a, b).
estrada(2, a, d).
estrada(3, b, c).
estrada(4, c, d).
estrada(5, b, e).
estrada(6, c, f).
estrada(7, d, f).
estrada(8, e, f).

%b) Defina o predicado rota(A,B,R), que determina uma rota R (lista de estradas) que leva da cidade A até a cidade B.

rota(A, B, R) :- estrada(R, A, B).

%c) Defina um predicado rotac(R, A) que determina uma rota R (listas de Estradas) que chegam a cidade A

rotac(R, a) :- estrada(R,_,a).

%d) Defina um predicado rotas(R, A) que determina uma rota R (listas de Estradas) que saem da cidade A

rotas(R, a) :- estrada(R, a, _).



%(EXC 02)

%2) Construa uma base de dados sobre livros com pelo menos dez estruturas do tipo: 

%livro(nome('C completo e total'), autor('Schildt'), pal_chave([linguagemc, programacao, computacao])).
%onde a lista de palavras chave pode ter três elementos. 

livro(nome('Cálculo'), autor('Guidorrizi'), pal_chave([matemática, exatas, números])).
livro(nome('Coraline'), autor('Gaiman'), pal_chave([fantasia, aventura, infantil])).
livro(nome('Água Viva'), autor('Lispector'), pal_chave([clássico, brasileiro, psicológico])).
livro(nome('O Capital'), autor('Marx'), pal_chave([política, economia, educação])).
livro(nome('O Cortiço'), autor('Azevedo'), pal_chave([clássico, brasileiro, história])).
livro(nome('Aurora'), autor('Ceribelli'), pal_chave([autoajuda, brasileiro, mulher])).
livro(nome('Iracema'), autor('Alencar'), pal_chave([clássico, brasileiro, romance])).
livro(nome('Percy Jackson'), autor('Riordan'), pal_chave([infantil, fantasia, mitologia])).
livro(nome('Tudo é Rio'), autor('Madeira'), pal_chave([psicológico, ficção, brasileiro])).
livro(nome('O Segundo Sexo'), autor('Beauvoir'), pal_chave([política, mulher, francês])). 

%a) Escreva consultas para encontrar: 

%nome do autor, dado o nome do livro

nome_autor(Nome) :- 
    (   livro(nome(Nome), autor(Autor), pal_chave([_, _, _])),
        write(Autor)
    ).

% nome do livro, dado o nome do autor 

nome_livro(Autor) :-
    (   livro(nome(Nome), autor(Autor), pal_chave([_, _, _])),
        write(Nome)
    ).

%as palavras chave, dado o nome do livro 

palavras_chave(Nome) :-
    (   livro(nome(Nome), autor(_), pal_chave([P1, P2, P3])),
        write(P1),
        nl,
        write(P2),
        nl,
        write(P3)
    ).

%nome do autor e o nome do livro, dada uma palavra chave.

autor_livro(Palavra) :-
    (   livro(nome(Nome), autor(Autor), pal_chave([Palavra, _, _])), 
    	write(Nome),
        nl,
        write(Autor),
        nl; 
    	livro(nome(Nome), autor(Autor), pal_chave([_, Palavra, _])),
        write(Nome),
        nl,
        write(Autor),
        nl; 
    	livro(nome(Nome), autor(Autor), pal_chave([_, _, Palavra])),
        write(Nome),
        nl,
        write(Autor)
    ).




%(EXC 03)

%3) Usando a tabela d(0,zero), d(1,um), ..., d(9,nove), defina o predicado txt(D,P) que converte 
%uma lista de dígitos numa lista de palavras.

%Por exemplo, txt([7,2,1],P) resulta em P=[sete,dois,um].

d(0, zero).
d(1, um).
d(2, dois).
d(3, três).
d(4, quatro).
d(5, cinco).
d(6, seis).
d(7, sete).
d(8, oito).
d(9, nove).
d(10, dez).
txt([],[]).

txt([D | Digito)], [P | Palavra]).



%(EXC 04)

% Construa uma base de dados sobre carros e seus proprietários com pelo menos dez estruturas do tipo: 

%dono(jose, carro(onix, azul, passeio)), onde a lista de palavras chave pode ter três elementos.

dono(nanda, carro(gol, prata, faculdade)).
dono(joao, carro(hb20, preto, trabalho)).
dono(carlos, carro(corolla, cinza, viagem)).
dono(janice, carro(celta, vermelho, trabalho)).
dono(anita, carro(uno, verde, viagem)).
dono(samuel, carro(ka, branco, trabalho)).
dono(patricia, carro(compass, preto, viagem)).
dono(juliana, carro(renegade, azul, faculdade)).
dono(antônio, carro(fusca, preto, viagem)).
dono(ana, carro(santana, branco, faculdade)).
    
%Maria é dona de alguma coisa? 
fulano_dono(Nome) :- dono(Nome, carro(_, _, _)).

%João é dono de quê? 
dono_de(Nome, Carro) :- dono(Nome, carro(Carro,_,_)).

%Quem é dono de um carro (de qualquer marca) preto? 
carro_preto(Nome) :- dono(Nome, carro(_, preto, _)).

%Existe alguém que seja dono de algum carro (de qualquer cor e marca)? 
existe_dono(Carro) :- dono(_, carro(Carro,_,_)).

%Quais são as cores do carros de trabalho?
carro_trabalho(Cor) :- dono(_, carro(_, Cor, trabalho)).




