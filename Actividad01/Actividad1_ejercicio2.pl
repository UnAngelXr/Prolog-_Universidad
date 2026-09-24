nacionalidad(coronelWest, estadoUnidence).
hostil(coreaDelSur).
vende(coronelWest, armas, coreaDelSur).

criminal(X) :-	nacionalidad(X,estadoUnidence),
    			vende(X,armas,Y),
    			hostil(Y).

