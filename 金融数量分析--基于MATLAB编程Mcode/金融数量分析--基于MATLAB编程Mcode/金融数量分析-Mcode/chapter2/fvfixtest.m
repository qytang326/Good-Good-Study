FaceValue=1000;
Payment=0.05*FaceValue;
Rate=0.06;
PresentVal=0
NumPeriods=10;
Due=0;
FutureVal = fvfix(Rate, NumPeriods, Payment, PresentVal, Due)+FaceValue

