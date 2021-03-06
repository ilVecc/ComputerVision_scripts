function [A] = ivec(v, r)
%IVEC crea una matrice raggruppando gli elementi del
%     vettore colonna 
%
%A = ivec(v,r) restituisce una matrice, A, con r righe
%dividendo il vettore v in r parti, in cui ogni parte 
%forma una colonna di A. Inverte l'operazione v = A(:),
%se e' noto il numero di righe di A
%
%N.B.
%Il numero delle righe deve essere un divisore della 
%dimensione del vettore v.

% Author: Andrea Fusiello

if (size(v,1) == 1)
    v = v';
end

if (size(v,2) ~= 1)
    error('Il vettore v deve essere un vettore colonna!!!');
end

if (mod(length(v), r)~=0)
    error('Il numero delle righe non e'' adatto!!!');
end

A = reshape(v, [r, length(v)/r]);
