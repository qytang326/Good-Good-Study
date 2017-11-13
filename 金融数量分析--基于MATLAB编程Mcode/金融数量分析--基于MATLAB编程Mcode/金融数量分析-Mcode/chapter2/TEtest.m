load funddata
daynum=length(js300)/2;
benchmark=0.95*hs300+0.05*0.0198/daynum;
[RatioJS2007,TEJS2007] = inforatio(js300(1:daynum),benchmark(1:daynum))
[RatioJS2008,TEJS2008] = inforatio(js300(daynum+1:2*daynum), benchmark(daynum+1:2*daynum))