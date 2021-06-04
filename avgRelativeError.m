function Result=avgRelativeError(RelativeErrorArray)
    avgError=0;
    n=length(RelativeErrorArray);
    for i=1:n
        avgError=avgError+RelativeErrorArray(i);
    end
    %Calculate the average error
    Result=(avgError/n);
end