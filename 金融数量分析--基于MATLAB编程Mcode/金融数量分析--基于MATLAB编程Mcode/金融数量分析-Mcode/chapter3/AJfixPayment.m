function F=AJfixPayment(MP,Num,B,Rate)
%code by ariszheng@gmail.com
%2009-6-18
IR=zeros(1,Num);
YE=zeros(1,Num);
BJ=zeros(1,Num);
YE(1)=B;
for i=1:Num
    IR(i)=Rate*YE(i);
    BJ(i)=MP-IR(i);
    if i<Num
    YE(i+1)=YE(i)-BJ(i);
    end
end
F=B-sum(BJ);

