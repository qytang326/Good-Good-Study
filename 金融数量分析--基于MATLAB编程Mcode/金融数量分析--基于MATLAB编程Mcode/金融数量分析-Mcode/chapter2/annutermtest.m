PresentValue=500000;
Payment=-4000;%支出为负数
FutureValue=0;
Due=0;
Rate=0.0389/12;
NumPeriods = annuterm(Rate, Payment, PresentValue,FutureValue,Due)
