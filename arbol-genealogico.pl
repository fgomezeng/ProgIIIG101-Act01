% Hechos: sexo 
hombre(abraham).
hombre(clancy).
hombre(herbert).
hombre(homero).
hombre(bart).

mujer(mona).
mujer(jacqueline).
mujer(marge).
mujer(patty).
mujer(selma).
mujer(lisa).
mujer(maggie).
mujer(ling).

% Hechos: parejas
pareja(abraham, mona).
pareja(clancy, jacqueline).
pareja(homero, marge).

% Hechos: relaciones directas de padre y madre
% Abraham y Mona
padre(abraham, homero).
madre(mona, homero).
padre(abraham, herbert).
madre(mona, herbert).

% Clancy y Jacqueline
padre(clancy, marge).
madre(jacqueline, marge).
padre(clancy, patty).
madre(jacqueline, patty).
padre(clancy, selma).
madre(jacqueline, selma).

% Homero y Marge
padre(homero, bart).
madre(marge, bart).
padre(homero, lisa).
madre(marge, lisa).
padre(homero, maggie).
madre(marge, maggie).

% Selma (padre no identificado en la imagen)
madre(selma, ling).



