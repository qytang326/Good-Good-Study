%compute FundCorrelation
%code by ariszheng@gmail.com
%2012-4-24
%文件信息
[typ, desc, fmt] = xlsfinfo('funddata.xls')
%读取数据
[data,textdate]= xlsread('funddata.xls');
%计算相关性 
R = corrcoef(data)
%写入到excel数据
[status, message] = xlswrite ('funddata.xls', R, 'sheet2', 'B2:E5')
%行名称与列名称
textdate=textdate(2,2:5)
[status, message] = xlswrite ('funddata.xls', textdate, 'sheet2', 'B1:E1')
[status, message] = xlswrite ('funddata.xls', textdate', 'sheet2', 'A2:A5')