%MoveHurst
%code by ariszheng  2012-5-3
[Prices, dates] =xlsread('shindex.xls');
DataLength=length(Prices);
cyclength=120;  %¼ÆËãÖÜÆÚ 
if cyclength > DataLength
    plot(1:100,1:100,'r*',1:100,100:-1:1,'ro');
    text(10,50,'Number of data must biger than Cycle Length','FontSize',28);
else
    plot(1:0.1:10,sin(1:0.1:10),'r*',1:0.1:10,-sin(1:0.1:10),'ro');
    logData=log(Prices);
    logData=logData(DataLength:-1:1);
    IndexReturn=[0;logData(2:DataLength)-logData(1:DataLength-1)];
    hurstE=zeros(DataLength,1);
    hurstE(1:cyclength-1)=NaN;
    for i=1:( DataLength-cyclength+1 )
         HurstExponent=HurstCompute(   IndexReturn (i:i+cyclength-1) );
         hurstE(cyclength+i-1)=HurstExponent(1);
    end
    fts = fints(dates,[hurstE(DataLength:-1:1) logData(DataLength:-1:1)],{'HurstExponent','logIndex'});
    chartfts(fts);  
end

