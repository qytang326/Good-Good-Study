%读取数据
load HS300Data
%矩阵转时间序列格式
HS300_TS = fints(Date,[OpenPrice HighPrice LowPrice ClosePrice Vol]);
%时间序列转矩阵 
HS300_mat1= fts2mat(HS300_TS);
HS300_mat2= fts2mat(HS300_TS,1);
