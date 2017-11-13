function  [FactorMatrix,FactorNum]=HurstFactorization(x)
%hurstFactorization 
%code by ariszheng@gmail.com
%2008-10-07
N=floor(x/4);
FactorNum=0;
for i=4:N
    if mod(x,i)==0
        FactorNum=FactorNum+1;
        FactorMatrix(FactorNum,:)=[i,x/i];
    end
end
    


