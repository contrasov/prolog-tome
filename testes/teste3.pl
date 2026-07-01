% - grafo3 - 
vertice(a).
vertice(b).
vertice(c).
vertice(d).
vertice(e).

adj(a,b). adj(b,a).
adj(a,d). adj(d,a).
adj(b,d). adj(d,b).
adj(d,c). adj(c,d).
adj(c,e). adj(e,c).

possui_ciclo :- adj(X,Y), busca(Y, X, [X, Y]).

busca(Atual, Final, Passados) :-
    adj(Atual, Final),
    length(Passados, Tamanho),
    Tamanho >= 3.

busca(Atual, Final, Passados) :-
    adj(Atual, Proximo),
    \+ member(Proximo, Passados),
    busca(Proximo, Final, [Proximo | Passados]).

mostrar_ciclo(Ciclo) :- adj(X,Y), busca_ciclo(Y, X, [Y, X], CicloOrganizado), reverse(CicloOrganizado, Ciclo).

busca_ciclo(Atual, Final, Passados, [Final | Passados]) :-
    adj(Atual, Final),
    length(Passados, Tamanho),
    Tamanho >= 3.

busca_ciclo(Atual, Final, Passados, CicloFinal) :-
    adj(Atual, Proximo),
    \+ member(Proximo, Passados),
    busca_ciclo(Proximo, Final, [Proximo | Passados], CicloFinal).