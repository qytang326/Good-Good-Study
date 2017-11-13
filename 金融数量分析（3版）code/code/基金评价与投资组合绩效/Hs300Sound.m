load fundData
fs=1000;
rate=price2ret(funddata);
sound(rate(:,1),fs)
