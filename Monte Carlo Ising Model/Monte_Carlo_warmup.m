function Monte_Carlo_warmup(T,H,MCstep)
global L;
global SPIN; 
    for i=1:MCstep 
        m = randi([1,L],1,1);
        n = randi([1,L],1,1);
        E = Cal_E(H);
        SPIN1 = Flip_Spin(SPIN,m,n);
        E1 = Cal_E1(SPIN1,H);
        dE=E1-E;
        r=rand(1,1,'double'); 
        if (r<exp(-dE/T))
        SPIN=SPIN1; 
        end
    end