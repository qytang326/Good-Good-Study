function f=TEobj(x,IndexPrice,StockPrice,Money)
%tracking error function
%code by ariszheng@gmail.com 2009-8-4
StockV=zeros(1,10);
L=length(IndexPrice);
PortPrice=zeros(1,L);
StockV=Money*x./StockPrice(1,:);
for i=1:L
    PortPrice(i)=sum(StockV.*StockPrice(i,:));
end
IndexReturn=price2ret(IndexPrice);
PortReturn=price2ret(PortPrice);
%Äê»¯¸ú×ÙÎó²î
f=std(IndexReturn-PortReturn)*sqrt(240);
