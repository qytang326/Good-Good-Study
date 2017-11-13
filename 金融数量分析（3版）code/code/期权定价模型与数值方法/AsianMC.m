function [P, aux ,CI] = AsianMC(S0,K,r,T,sigma,NSamples,NRepl)
Payoff = zeros(NRepl,1);
for i=1:NRepl
   Path=AssetPaths(S0,r,sigma,T,NSamples,1);
   Payoff(i) = max(0, mean(Path(2:(NSamples+1))) - K);
end
[P,aux,CI] = normfit( exp(-r*T) * Payoff);
