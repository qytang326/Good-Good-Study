
%2012-4-24
%文件信息
[typ, desc, fmt] = xlsfinfo('funddata.xls');
%读取数据
[data,textdate]= xlsread('funddata.xls');
funddata=data;
%将数据保存在Mat文件中
save funddata funddata 