function Monte_Carlo_warmup(T,H,MCstep)
global L;
global SPIN; 
global Jx;
global Jy;
%global Jxy;
    for i=1:MCstep 
        m = randi(L,1,1);
        n = randi(L,1,1);
        E = Cal_E(H,m+1,n+1);
        SPIN1 = Flip_Spin(SPIN,m,n);
        E1 = Cal_E1(SPIN1,H,m+1,n+1);
        dE=E1-E;
        w=exp(-dE/(Jx*T));
        r=rand(1,1,'double'); 
        if (w>1||r<w)
        SPIN=SPIN1; 
        end
    end