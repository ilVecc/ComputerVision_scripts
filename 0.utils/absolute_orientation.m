function [s,R,t] = absolute_orientation(X,Y)
%ABSOLUTE_ALIGNMENT Fits Y to X using the least squared distances approach
%   Resolves the problem of min_{R,t}sum_{i=1}^{N}norm{X_i - s(RY_i +
%   t)}^2. Given two DxN matrices, X for model and Y for data, ideally
%   representing D-dimensional points X_i and Y_i disposed by column, tries 
%   to fit as good as possible Y to X, applying a rototranslation (R,t) and
%   scaling by s.
if size(X) ~= size(Y)
    error('Dimensions do not match');
end
if size(X,1) < size(X,2)
    X = X';
    Y = Y';
end

% discard nan values
i = find(~isnan(X));
X = reshape(X(i),length(X(i))/3,3)';
Y = reshape(Y(i),length(Y(i))/3,3)';

% center the clouds
centroid_X = mean(X,2);
centroid_Y = mean(Y,2);
cX = X - centroid_X;
cY = Y - centroid_Y;

% extract the parameters
s = norm(cX(:,1)) / norm(cY(:,1));
[U,~,Vt] = svd(cY * cX');
R = (U * diag([1 1 det(U * Vt')]) * Vt')';
t = (1/s) * centroid_X - R * centroid_Y;
end

