function  [Prices,NumericDates,StartDate,EndDate] = SimpleXlsReader(filename)
[Prices,txtdata] = xlsread(filename);
%Prices,txtdata
flag=length(txtdata)-length(Prices)+1;
NumericDates = flipud(datenum(txtdata(flag:end,1)));
Prices = flipud(Prices(:,1));
StartDate = NumericDates(1);
EndDate   = NumericDates(end);
