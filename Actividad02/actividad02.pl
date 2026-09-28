conexion(vancouver, edmonton, 16).
conexion(vancouver, calgary, 13).
conexion(edmonton, saskatoon, 12).
conexion(saskatoon, winnipeg, 20).
conexion(saskatoon, calgary, 9).
conexion(regina, winnipeg, 4).
conexion(regina, saskatoon, 7).
conexion(calgary, regina, 14).
conexion(calgary, edmonton, 4).

conexionEntreDos(X, Y) :-	conexion(X, Y, _).

costoConexion(X, Ciudad, Costo) :-	conexion(X, Ciudad, Costo).

nodoAristas(X) :-	conexion(X,_,_).

costoViaje(Destino, Destino, 0).

costoViaje(Origen, Destino, CostoTotal) :-
    conexion(Origen, Siguiente, CostoConexion),
    costoViaje(Siguiente, Destino, CostoRestante),
    CostoTotal is CostoConexion + CostoRestante.

posibleViaje(Destino, Destino).

posibleViaje(Origen, Destino) :-
    conexion(Origen, Siguiente, _),
    posibleViaje(Siguiente, Destino).
    							