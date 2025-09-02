% Hechos: sexo 
es_hombre(abraham).
es_hombre(clancy).
es_hombre(herbert).
es_hombre(homero).
es_hombre(bart).

es_mujer(mona).
es_mujer(jacqueline).
es_mujer(marge).
es_mujer(patty).
es_mujer(selma).
es_mujer(lisa).
es_mujer(maggie).
es_mujer(ling).

% Hechos: parejas
es_pareja_de(abraham, mona).
es_pareja_de(clancy, jacqueline).
es_pareja_de(homero, marge).

% Hechos: relaciones directas de padre y madre
% Abraham y Mona
es_padre_de(abraham, homero).
es_madre_de(mona, homero).
es_padre_de(abraham, herbert).
es_madre_de(mona, herbert).

% Clancy y Jacqueline
es_padre_de(clancy, marge).
es_madre_de(jacqueline, marge).
es_padre_de(clancy, patty).
es_madre_de(jacqueline, patty).
es_padre_de(clancy, selma).
es_madre_de(jacqueline, selma).

% Homero y Marge
es_padre_de(homero, bart).
es_madre_de(marge, bart).
es_padre_de(homero, lisa).
es_madre_de(marge, lisa).
es_padre_de(homero, maggie).
es_madre_de(marge, maggie).

% Selma (padre no identificado en la imagen)
es_madre_de(selma, ling).

% Reglas: derivaciones (> 1 generación)
es_progenitor_de(P, Hijo):- es_padre_de(P, Hijo); es_madre_de(P, Hijo).

es_abuelo_de(A, N):- es_padre_de(A, X), es_progenitor_de(X, N).
es_abuela_de(A, N):- es_madre_de(A, X), es_progenitor_de(X, N).

% Hermanos (comparte al menos un progenitor)
es_hermane_de(A, B):- es_progenitor_de(P, A), es_progenitor_de(P, B), A \= B.
es_hermano_de(H, X):- es_hermane_de(H, X), hombre(H).
es_hermana_de(H, X):- es_hermane_de(H, X), mujer(H).





