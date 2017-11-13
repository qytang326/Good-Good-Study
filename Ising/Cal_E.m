function y = Cal_E(H,i,j)
%global L;
global SPIN;
global Jx;
global Jy;
%global Jxy;
%E = 0;
%for i = 2:L+1
 %   for j = 2:L+1
%if(i=1)
 %   y=-(SPIN(i,j+1)+SPIN(i,j-1)+SPIN(i+1,j)+SPIN(L+2,j))*SPIN(i,j)*Jx/2;
        y =-(SPIN(i,j)*SPIN(i-1,j)+SPIN(i,j)*SPIN(i+1,j))*Jx/2-(SPIN(i,j)*SPIN(i,j+1)+SPIN(i,j)*SPIN(i,j-1))*Jy/2-SPIN(i,j)*H;
 %   end
%end
%y=E;
%-(SPIN(i,j)*SPIN(i+1,j+1)+SPIN(i,j)*SPIN(i-1,j-1))*Jxy/2