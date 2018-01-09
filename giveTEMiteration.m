function [modeName, iteration] = giveTEMiteration(freqIn)

fid=fopen('Qfactor');
formatSpec='%f %f\n';
dataFreq=fscanf(fid, formatSpec, [2 Inf]);
fclose(fid);
sizeDataFreq=(size(dataFreq));
nCol=sizeDataFreq(2)+1;

fid=fopen('TEMiteration.txt');
data=textscan(fid, ['%s' repmat('%f', [1 sizeDataFreq(2)])], 'delimiter', '\t');
fclose(fid);

for q=2:nCol
    if data{1,q}(1,1)==freqIn
        freqCol=q;
    end
end

iterAll=data{1,freqCol};
iterAll(1,1)=0; 
iterTemp=sort(iterAll, 'descend');
iterUnique=unique(iterAll);
iterUnique=sort(iterUnique,'descend');

modeList=data{1,1};

iteration=[];
iterLocs=[];
modeName=[];

count=1;
while size(iterLocs)<3
    locTemp=find(iterAll==iterUnique(count));
    [col,row]=size(locTemp);
    if col>1
        for a=0:col-1
            iterLocs=[iterLocs,locTemp(a+1)];
        end
    else 
        iterLocs=[iterLocs,locTemp(1)];
    end
    count=count+1;
end

[col,row]=size(iterLocs);
for z=1:row
    modeName=[[modeName '\t'],modeList(iterLocs(z))];
    iteration=[iteration,iterAll(iterLocs(z))];
end

iteration=iteration/sum(iterAll);
end










