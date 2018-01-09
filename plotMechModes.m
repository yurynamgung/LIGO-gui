function plotMechModes(x, y, z)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
xlin=linspace(min(x), max(x), 33);
ylin=linspace(min(y), max(y), 33);
[X, Y]=meshgrid(xlin, ylin);
Z=griddata(x, y, z, X, Y);
surf(X, Y, Z)
end

