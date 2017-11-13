%DateClassByYear
%载入数据 
%文件信息
[typ, desc, fmt] = xlsfinfo('funddata.xls');
%读取数据
[data,textdate,raw]= xlsread('funddata.xls');
%textdate第一列的4：491行数据为时间
%datenum将字符时间转换为数值格式
Date=datenum(textdate(4:491,1))
%显示数据Date(1)
datestr(Date(1))
%数据归类
%2007年数据 year(Date)返回日期的年份
DateIndex2007=find(year(Date)==2007);
Date2007=Date(DateIndex2007);
length(Date2007)
%2008年数据 
DateIndex2008=find(year(Date)==2008);
Date2008=Date(DateIndex2008);
length(Date2008)

