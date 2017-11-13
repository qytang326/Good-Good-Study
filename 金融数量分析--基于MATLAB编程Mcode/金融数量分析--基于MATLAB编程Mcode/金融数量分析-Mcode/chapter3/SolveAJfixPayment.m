Num=12*10;
B=5e5;
Rate=0.05/12;
MPo=1000;
MP= fsolve(@(MP) AJfixPayment(MP,Num,B,Rate),MPo)