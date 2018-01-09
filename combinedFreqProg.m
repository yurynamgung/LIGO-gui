function combinedFreqProg %[modeNumber, OverlapModeNames, freq, numOfFreqs, Qfactor, histogramPerc,IterationModeNames,iterations] = combinedFreqProg(freqIn)

readFreq=@readFreqQ;
overlap=@giveOverlap;
histo=@plotHistogram;
coords=@findCoords;
plotMM=@plotMechModes;
TEMit=@giveTEMiteration;

str=input('Enter the numbers of the programs you would like to run:\n(1)Give Q-factor\n(2)Plot mech modes\n(3)Plot histogram\n(4)Give highest overlapping parameters\n(5)Give modes w/ highest iterations\n','s');

runProg=zeros(5,1);
nums=str2num(str);
[col,row]=size(nums);

for r=1:5
    for q=1:row
        if r==nums(q)
            runProg(r,1)=1;
        end
    end
end

freqIn=input('Enter the frequency:\n');
[modeNumber, freq, Qfactor]=readFreq(freqIn);
[IterationModeNames,iterations]=TEMit(freqIn);

if runProg(1)==1
    fprintf(['(1) Mode Number: ' num2str(modeNumber) '\n\tFreq: ' num2str(freq) '\n\tQ-factor: ' num2str(Qfactor) '\n']);
end
if runProg(2)==1
    fprintf('(2)\n');
    [X, Y, Z]=coords(modeNumber);
    plotMM(X, Y, Z);
end
if runProg(3)==1 
    [mode, histogramPerc]=histo(freqIn);
    fprintf(['(3) Mode Number: ' num2str(mode) '\n\tPercentile: ' num2str(histogramPerc) '\n']);
end
if runProg(4)==1
    [numOfFreqs, OverlapModeNames]=overlap(freqIn);
    fprintf(['(4) Number of Frequencies: ' num2str(numOfFreqs) '\n\tMode Names: ' cell2mat(OverlapModeNames) '\n']);
   
end
if runProg(5)==1
  fprintf(['(5) Highest Iterations: ' num2str(iterations) '\n\tMode Names: ' cell2mat(IterationModeNames) '\n']);
end
end

