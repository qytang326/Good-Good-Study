function HurstExponent=HurstCompute(Xtimes)
%HurstCompute
%code by ariszheng@gmail.com
%2008-10-07
%example HurstExponent=HurstCompute(rand(1,240))
LengthX=length(Xtimes);
[FactorMatrix,FactorNum]=HurstFactorization(LengthX);
LogRS=zeros(FactorNum,1);
LogN=zeros(FactorNum,1);
for i=1:FactorNum
    dataM=reshape(Xtimes,FactorMatrix(i,:));
    MeanM=mean(dataM);
    SubM =dataM - repmat( MeanM,FactorMatrix(i,1),1) ;
    RVector=zeros(FactorMatrix(i,2),1);
    SVector=zeros(FactorMatrix(i,2),1);
    for j=1:FactorMatrix(i,2)
        %SubVector=zeros(FactorMatrix(i,1),1);
        SubVector=cumsum( SubM(:,j));
        RVector(j)=max(SubVector)-min(SubVector);
        SVector(j)=std( dataM(:,j) );
    end
    LogRS(i)=log( sum( RVector./SVector)/ FactorMatrix(i,2) );
    LogN(i)=log( FactorMatrix(i,1) );
end

HurstExponent=polyfit(LogN,LogRS,1);
%testX=1:0.5:ceil(max(LogN));
%textY=polyval(HurstExponent,testX);
%plot(LogN,LogRS,'o',testX,textY)
    
    
    