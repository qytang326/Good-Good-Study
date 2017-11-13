function  [Prices,NumericDates,StartDate,EndDate] = SimpleXlsReader(filename)
[Prices,txtdata] = xlsread(filename);
%Prices,txtdata
NumericDates = flipud(datenum(txtdata(:,1)));
Prices = flipud(Prices(:,1));
StartDate = NumericDates(1);
EndDate   = NumericDates(end);
