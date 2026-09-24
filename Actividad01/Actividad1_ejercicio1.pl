progenitor(abraham, herbert).
progenitor(abraham, homero).
progenitor(mona, herbert).
progenitor(mona, homero).
progenitor(clancy, marge).
progenitor(clancy, patty).
progenitor(clancy, selma).
progenitor(jacqueline, marge).
progenitor(jacqueline, patty).
progenitor(jacqueline, selma).
progenitor(homero, bart).
progenitor(homero, lisa).
progenitor(homero, maggie).
progenitor(marge, bart).
progenitor(marge, lisa).
progenitor(marge, maggie).
progenitor(selma, ling).

abuelo(X,Y) :- 	progenitor(X, Z) , 
    			progenitor(Z, Y).

nieto(X,Y) :- 	progenitor(Z, X) , 
    			progenitor(Y, Z).

hijo(X,Y) :- 	progenitor(Y,X).

hermano(X,Y) :- progenitor(Z,X) , 
    			progenitor(Z,Y) ,
    			X \= Y.

tio(X,Y) :- 	hermano(X,Z) , 
    			progenitor(Z, Y).

sobrino(X,Y) :- progenitor(Z,X) , 
    			hermano(Z,Y).

