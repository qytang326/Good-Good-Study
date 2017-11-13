function y = Cal_E1(SPIN1,H)
global L;
global Jx;
global Jy;
global Jxy;
E = 0;
for i = 2:L+1
    for j = 2:L+1
        E =-(SPIN1(i,j)*SPIN1(i-1,j)+SPIN1(i,j)*SPIN1(i+1,j))*Jx/2-(SPIN1(i,j)*SPIN1(i+1,j+1)+SPIN1(i,j)*SPIN1(i-1,j-1))*Jxy/2-(SPIN1(i,j)*SPIN1(i,j+1)+SPIN1(i,j)*SPIN1(i,j-1))*Jy/2-SPIN1(i,j)*H+E;
    end
end
y=E;