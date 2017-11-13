function MP=AJvarPayment(Num,B,Rate)
%code by ariszheng@gmail.com
%2009-6-18
MP=zeros(1,Num);
YE=zeros(1,Num);
MB=B/Num;
YE=B-cumsum([0,MB*ones(1,Num-1)]);
MP=MB+Rate*YE;