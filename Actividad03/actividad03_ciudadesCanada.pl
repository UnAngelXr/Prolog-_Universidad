rutas([ruta(vancouver, edmonton, 16), ruta(vancouver, calgary, 13), ruta(edmonton, saskatoon, 12),
       ruta(saskatoon, winnipeg, 20), ruta(saskatoon, calgary, 9), ruta(regina, winnipeg, 4), 
       ruta(regina, saskatoon, 7), ruta(calgary, regina, 14), ruta(calgary, edmonton, 4)]).


conexionEntreDos(X, Y, Costo) :-
    rutas(Listas),
    member(ruta(X,Y,Costo), Listas).
    
costoConexion(X, Ciudad, Costo) :-	
    conexionEntreDos(X,Ciudad,Costo).

nodoAristas(Nodo) :-
    conexionEntreDos(Nodo,_,_).

costoViaje(Origen, Destino, CostoTotal) :-
    costoViaje(Origen, Destino, CostoTotal, [Origen]).
    
costoViaje(Destino, Destino, 0, _).

costoViaje(Origen, Destino, CostoTotal, Visitadas) :-
    conexionEntreDos(Origen, Siguiente, CostoConexion),
    \+ member(Siguiente,Visitadas),
    costoViaje(Siguiente, Destino, CostoRestante, [Siguiente|Visitadas]),
    CostoTotal is CostoConexion + CostoRestante.

posibleViaje(Origen, Destino) :-
    posibleViaje(Origen, Destino, [Origen]).

posibleViaje(Destino, Destino, _).

posibleViaje(Origen, Destino, Visitadas) :-
    conexionEntreDos(Origen, Siguiente, _),
    \+ member(Siguiente, Visitadas),
    posibleViaje(Siguiente, Destino, [Siguiente|Visitadas]),
    !.