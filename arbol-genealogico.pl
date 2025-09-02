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
es_hermano_de(H, X):- es_hermane_de(H, X), es_hombre(H).
es_hermana_de(H, X):- es_hermane_de(H, X), es_mujer(H).

% Tios/Tías (hermanos del progenitor)
es_tio_de(T, S):- es_hombre(T), es_progenitor_de(P, S), es_hermane_de(T, P).
es_tia_de(T, S):- es_mujer(T), es_progenitor_de(P, S), es_hermane_de(T, P).

% Primos (Hijos de los hermanos)
es_prime_de(A, B):- es_progenitor_de(P1, A), es_progenitor_de(P2, B), es_hermane_de(P1, P2), A \= B.
es_primo_de(A, B):- es_prime_de(A, B), es_hombre(A).
es_prima_de(A, B):- es_prime_de(A, B), es_mujer(A).

% Parejas (relación bidireccional)
es_pareje_de(X, Y):- es_pareja_de(X, Y).
es_pareje_de(X, Y):- es_pareja_de(Y, X).

% Suegros / yerno / nuera (a partir de pareja)
es_suegro_de(S, Y):- es_pareje_de(Y, X), es_padre_de(S, X).
es_suegra_de(S, Y):- es_pareje_de(Y, X), es_madre_de(S, X).
es_yerno_de(Y, P):- es_pareje_de(Y, X), es_progenitor_de(P, X), es_hombre(Y).
es_nuera_de(N, P):- es_pareje_de(N, X), es_progenitor_de(P, X), es_mujer(N). 



