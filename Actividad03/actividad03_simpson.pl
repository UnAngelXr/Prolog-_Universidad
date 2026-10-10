progenitor(abraham,[herbert, homero]).
progenitor(mona,[herbert, homero]).
progenitor(clancy,[marge, patty, selma]).
progenitor(jacqueline,[marge, patty, selma]).
progenitor(homero,[bart, lisa, maggie]).
progenitor(marge,[bart, lisa, maggie]).
progenitor(selma,[ling]).

abuelo(X,Y) :-
    progenitor(X,Z),
    member(Padres,Z),
    progenitor(Padres,Hijos),
    member(Y,Hijos).

nieto(X,Y) :-
    progenitor(Y,Padrelis),
    member(Padre,Padrelis),
    progenitor(Padre,Hijoslis),
    member(X,Hijoslis).

hijo(X,Y) :-
    progenitor(Y,Hijolis),
    member(X,Hijolis).

hermano(X,Y) :-
    progenitor(_,Hijoslis),
    member(X,Hijoslis),
    member(Y,Hijoslis),
    X \= Y.

tio(X,Y) :-
    hermano(X,Hermano),
    progenitor(Hermano,Hijolis),
    member(Y,Hijolis).

sobrino(X,Y) :-
    hermano(Y,Hermano),
    progenitor(Hermano,SobrinoList),
    member(X,SobrinoList),
    !.
