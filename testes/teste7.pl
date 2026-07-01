% - grafo7 -
vertice(0).
vertice(1).
vertice(2).
vertice(3).
vertice(4).
vertice(5).
vertice(6).
vertice(7).
vertice(8).
vertice(9).
vertice(10).
vertice(11).
vertice(12).
vertice(13).
vertice(14).
vertice(15).

% v0
adj(0,4). adj(4,0).
adj(0,6). adj(6,0).
adj(0,12). adj(12,0).

% v1
adj(1,4). adj(4,1).
adj(1,6). adj(6,1).
adj(1,11). adj(11,1).

% v2
adj(2,6). adj(6,2).
adj(2,7). adj(7,2).
adj(2,10). adj(10,2).

% v3
adj(3,4). adj(4,3).
adj(3,5). adj(5,3).
adj(3,8). adj(8,3).
adj(3,9). adj(9,3).
adj(3,12). adj(12,3).

% v4
adj(4,5). adj(5,4).
adj(4,6). adj(6,4).
adj(4,8). adj(8,4).
adj(4,9). adj(9,4).
adj(4,12). adj(12,4).
adj(4,15). adj(15,4).

% v5
adj(5,8). adj(8,5).
adj(5,14). adj(14,5).

% v6
adj(6,10). adj(10,6).
adj(6,11). adj(11,6).

% v7
adj(7,11). adj(11,7).
adj(7,12). adj(12,7).
adj(7,13). adj(13,7).

% v8
adj(8,9). adj(9,8).
adj(8,12). adj(12,8).

% v9
adj(9,15). adj(15,9).

% v10
adj(10,11). adj(11,10).
adj(10,13). adj(13,10).

% v11
adj(11,12). adj(12,11).
adj(11,14). adj(14,11).

% v12
adj(12,14). adj(14,12).
adj(12,15). adj(15,12).

% v13
adj(13,14). adj(14,13).

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