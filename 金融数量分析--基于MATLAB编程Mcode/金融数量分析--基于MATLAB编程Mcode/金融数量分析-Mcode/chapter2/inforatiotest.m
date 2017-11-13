%%
load funddata
daynum=length(js300)/2;
RatioJS2007 = inforatio(js300(1:daynum),hs300(1:daynum))
RatioJS2008 = inforatio(js300(daynum+1:2*daynum), hs300(daynum+1:2*daynum))
%%
RatioBS2007 = inforatio(bszt(1:daynum), hs300(1:daynum))
RatioBS2008 = inforatio(bszt(daynum+1:2*daynum), hs300(daynum+1:2*daynum))
%%
RatioNF2007 = inforatio(nfjy(1:daynum),hs300(1:daynum))
RatioNF2008 = inforatio(nfjy(daynum+1:2*daynum), hs300(daynum+1:2*daynum))