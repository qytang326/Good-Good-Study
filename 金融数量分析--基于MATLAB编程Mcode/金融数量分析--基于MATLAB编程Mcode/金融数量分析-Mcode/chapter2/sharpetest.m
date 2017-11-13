%%
load funddata
daynum=length(js300)/2;
Cash=0.03/daynum;
RatioJS2007 = sharpe(js300(1:daynum), Cash)
RatioJS2008 = sharpe(js300(daynum+1:2*daynum), Cash)
%%
RatioBS2007 = sharpe(bszt(1:daynum), Cash)
RatioBS2008 = sharpe(bszt(daynum+1:2*daynum), Cash)
%%
RatioNF2007 = sharpe(nfjy(1:daynum), Cash)
RatioNF2008 = sharpe(nfjy(daynum+1:2*daynum), Cash)
