%take in frequency, give mode and cumulative histogram of pg
function [mode] = plotHistogram(freqIn)

fid=fopen('uModes800W.txt');
formatSpec='%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f\n';
sizeData=[20 Inf];

data=fscanf(fid, formatSpec, sizeData);
mode=0;

sizeData=size(data);
nRow=sizeData(2);

%make PG positive 
f=@noNeg;

for z=1:1:sizeData(1) 
    if (data(z, 2)>freqIn*.999) && (data(z, 2)<freqIn*1.001)
        mode=data(z, 1); %give mode
        
       %graph
        posData=f(data(z, 3:nRow));
        [f,x]=ecdf(posData, 'function', 'survivor');
        figure();
        plot(x,f);
        set(gca, 'yscale', 'log', 'xscale', 'log');
        % histogram(posData, 'Normalization', 'cdf');
        
       %percentile
        percentile = prctile(posData, 95);
        line([percentile percentile], [10^-6 1], 'Color', 'red', 'LineStyle', '--');

    end
end

if mode==0
    disp('The frequency is not in this file');
end
    
fclose(fid);
end

function posData = noNeg(dataIn) %no PGs below 10^-3

posData = [];
sizeData = size(dataIn);

for z=1:1:sizeData(2)
    if dataIn(z) < 10^-3
        posData(z)=10^-3;
    else
        posData(z)=dataIn(z);
    end 
end

end

