function y = Monte_Carlo(T,H,MCstep) %返回y为一行2列的向量，元素依次为磁化强度，和熵
global L;
global SPIN;
global Jx;
global Jy;
global Jxy;
    EE = zeros(MCstep,1);
    magneton = zeros(MCstep,1);
    
    for i=1:MCstep 
        m = randi(L,1,1);
        n = randi(L,1,1);
        E = Cal_E(H);
        SPIN1 = Flip_Spin(SPIN,m,n);
        E1 = Cal_E1(SPIN1,H);
        dE=E1-E;
        r=rand(1,1,'double'); 
        if (r<exp(-dE/T))
        SPIN=SPIN1; 
        EE(i)=E1;
        else
        EE(i)=E;
        end
        magneton(i) = sum(sum(SPIN(2:L+1,2:L+1)));
    end
    
        E1st = sum(EE)/MCstep;
        E2th = EE'*EE/MCstep;
        Ave_magneton = sum(magneton)/MCstep;
        S=(E2th-E1st^2)/(T*T);
        y = [Ave_magneton,S];