FaceValue=1000;
Payment=0.05*FaceValue;
Rate=0.06;
ExtraPayment=FaceValue;
NumPeriods=10;
Due=0;
PresentVal = pvfix(Rate, NumPeriods, Payment, ExtraPayment, Due)