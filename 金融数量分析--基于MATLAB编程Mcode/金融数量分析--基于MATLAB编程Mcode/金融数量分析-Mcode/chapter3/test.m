RATE1=0.04/12;
RATE2=0.05/12;
N=5*12;
Payment=5303.3;
pv1 = pvfix(RATE1, N, Payment)
pv2 = pvfix(RATE2, N, Payment)
pv1-pv2