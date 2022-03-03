function mt = p2t(H, m)
%_P2T Applica una trasformazione proiettiva nel 2D.
%   mt = p2t(H,m) data una omografia H del piano proiettivo e un insieme di 
%   punti immagine m, calcola la trasformazione del piano immagine in se 
%   stesso.

% Author: Andrea Fusiello

[na, ma] = size(H);
if na~=3 || ma~=3
    error('Formato errato della matrice di trasformazione (3x3)');
end

[rml, cml] = size(m);
if (rml ~= 2)
    error('Le coordinate immagine devono essere cartesiane');
end
 
c3d = [m;  ones(1, cml)];  % all the complanar (no z-axis) cartesian 3D coordinates in the plane
h2d = H * c3d;  % transformed plane, homogeneous 2D coordinates
c2d = h2d ./ h2d(3,:);  % switch to cartesian 2D coordinates

mt = c2d(1:2,:);


