%take in freq, give 3 modes with the highest overlap with that freq
function [numOfFreq, mode] = giveOverlap(freqIn)

fid=fopen('Overlap.txt');
formatSpec='%s %f %f %f';

data=textscan(fid, formatSpec);
sizeData=size(data{1,1});
% data=data';
%disp(sizeData(1));

modeAll=[];
overlapAll=[];

for z=1:1:sizeData(1)
    if data{1,2}(z,1)==freqIn
        modeAll=[modeAll, data{1,1}(z,1)];
        overlapAll=[overlapAll, data{1,3}(z,1)]; %all modes and overlaps w same freq
    end
end

numOfFreqTemp=size(modeAll);
numOfFreq=numOfFreqTemp(2);
maxLocs=[];
mode=[];

if size(modeAll)<4
    mode=modeAll;
else 
    overlapTemp=sort(overlapAll, 'descend');
    for z=1:1:3
        maxLocs=[maxLocs, find(overlapAll==overlapTemp(z))];
    end
    for z=1:1:3
        mode=[mode, modeAll(maxLocs(z))];
    end
end
fclose(fid);
end


        
    
    
        
        
