function y=TransDec20other(n,b)
ch1='0123456789ABCDEF';
k=1;
while n~=0
    p(k)=rem(n,b);
    n=fix(n/b);
    k=k+1;
end
k=k-1;
strdec='';
while k>=1;
    kb=p(k);
    strdec=strcat(strdec,ch1(kb+1:kb+1));
    k=k-1;
end
y=strdec;
end
