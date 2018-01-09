function [ mode, freq, Q ] = readFreqQ( freqIn )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
fid=fopen('Qfactor');
formatSpec='%f %f\n';
sizeData=[2 Inf]; % col*row

data=fscanf(fid, formatSpec, sizeData);
data=data';

sizeData=size(data);

mode=[];
freq=[];
Q=[];
for z=1:1:sizeData(1)
    if (data(z, 1)>0.999*freqIn) && (data(z, 1)<1.001*freqIn)
        mode=[mode, z];
        freq=[freq, data(z, 1)];
        Q=[Q, data(z, 2)];
    end
end
end

