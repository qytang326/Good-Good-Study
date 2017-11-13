function y = Cal_E(H)
global L;
global SPIN;
global Jx;
global Jy;
global Jxy;
E = 0;
for i = 2:L+1
    for j = 2:L+1
        E =-(SPIN(i,j)*SPIN(i-1,j)+SPIN(i,j)*SPIN(i+1,j))*Jx/2-(SPIN(i,j)*SPIN(i+1,j+1)+SPIN(i,j)*SPIN(i-1,j-1))*Jxy/2-(SPIN(i,j)*SPIN(i,j+1)+SPIN(i,j)*SPIN(i,j-1))*Jy/2-SPIN(i,j)*H+E;
    end
end
y=E;