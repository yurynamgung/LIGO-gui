function makeTEMiterationFile

fid=fopen('TEM_names.modes');
formatSpec='%s';
dataTemp=textscan(fid, formatSpec);
fclose(fid);

sizeDataTEM=size(dataTemp{1,1});
nRows=sizeDataTEM(1);

data{1,1}{1,1}='\t\t';
for a=1:1:nRows
    data{1,1}{a+1,1}=dataTemp{1,1}{a,1};
end
nRows=nRows+1;

fid=fopen('Qfactor');
formatSpec='%f %f\n';
dataFreq=fscanf(fid, formatSpec, [2 Inf]);
fclose(fid);

sizeDataFreq=(size(dataFreq));
for z=1:1:sizeDataFreq(2)
    data{z+1,1}{1,1}=dataFreq(1,z);
    for p=2:nRows
        data{z+1,1}{p,1}=randi(100); %random int later
    end
end


fid=fopen('TEMiteration.txt','w');

for row=1:nRows
    fprintf(fid,'%s\t',data{1,1}{row,1});
    for col=2:sizeDataFreq(2)
%     for col=2:15
        fprintf(fid, repmat('%e\t', [1 sizeDataFreq(2)]),data{col,1}{row,1});
    end
    fprintf(fid, '%e\n', data{sizeDataFreq(2)+1,1}{row,1});
end

fclose(fid);
end
