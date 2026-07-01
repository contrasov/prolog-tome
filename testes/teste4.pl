% - grafo4 -
vertice(a).
vertice(b).
vertice(c).
vertice(d).
vertice(e).
vertice(f).

adj(a,b). adj(b,a).
adj(b,c). adj(c,b).
adj(c,d). adj(d,c).
adj(d,e). adj(e,d).
adj(e,f). adj(f,e).

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