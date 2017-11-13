function y = Flip_Spin(SPIN,m,n)
global L;
SPIN(m+1,n+1)=-SPIN(m+1,n+1);
    
switch m
case 1
    SPIN(L+2,n+1)=SPIN(2,n+1);
case L
	SPIN(1,n+1)=SPIN(L+1,n+1);
end

switch n
case 1
    SPIN(m+1,L+2)=SPIN(m+1,2);
case L
	SPIN(m+1,1)=SPIN(m+1,L+1);
end

switch n*m
case 1
    SPIN(L+2,L+2)=SPIN(2,2);
case L*L
	SPIN(1,1)=SPIN(L+1,L+1);
end

y=SPIN;