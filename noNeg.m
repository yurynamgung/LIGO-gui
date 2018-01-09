function posData = noNeg(dataIn) %no PGs below 10^-3

sizeData = size(dataIn);
posData = zeros(sizeData);

for z=1:1:sizeData(2)
    if dataIn(z) < 10^-3
        posData(z)=10^-3;
    else
        posData(z)=dataIn(z);
    end 
end

end