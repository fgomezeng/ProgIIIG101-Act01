nacion_hostil(corea_del_sur).
arma(misil).
posee(corea_del_sur, misil).
es_estadounidense(coronel_west).
vende(coronel_west, misil, corea_del_sur).

criminal(X) :-
    es_estadounidense(X),
    vende(X,Arma,Nacion),
    arma(Arma),
    nacion_hostil(Nacion).