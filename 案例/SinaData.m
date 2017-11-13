function [Data, DataCell]=SinaData(StockCode)
% by LiYang(faruto) @http://www.matlabsky.com
% 本函数是基于 ariszheng @http://www.ariszheng.com/ 的相关函数进行修改而成
% 用来通过sina获取股票实时数据
%% 输入参数
% StockCode 证券代码（上海sh+code 深圳 sz+code)
%% 测试函数
%提取数据 招商银行（上海交易所）
% StockCode='sh600036';
% [Data, DataCell]=SinaData(StockCode);

%% Sina URL
url2Read=['http://hq.sinajs.cn/list=',StockCode];
s=urlread_General(url2Read);

result=textscan(s,'%s','delimiter', ',');

result = result{1,1};
DataCell = result;
Data = cellfun(@str2double, DataCell(2:30));

temp = cell2mat(DataCell(1));
StockName = temp(22:end);
StockID = temp(12:19);

DataCell{1, 1} = [StockName, '_', StockID];

StockDate = cell2mat( DataCell(31) );
StockTime = cell2mat( DataCell(32) );

DataCell{2, 1} = StockDate;
DataCell{3, 1} = StockTime;

DataCell(4:end-1) = mat2cell( Data, ones(length(Data), 1) );

temp = DataCell(1:32);
DataCell = temp;

ind = 1;
DataCell{ind, 2}  = '股票名称代码';
ind = ind + 1;
DataCell{ind, 2}  = '日期';
ind = ind + 1;
DataCell{ind, 2}  = '时间';
ind = ind + 1;
DataCell{ind, 2}  = '今开盘';
ind = ind + 1;
DataCell{ind, 2}  = '昨收盘';
ind = ind + 1;
DataCell{ind, 2}  = '当前价';
ind = ind + 1;
DataCell{ind, 2}  = '今最高';
ind = ind + 1;
DataCell{ind, 2}  = '今最低';
ind = ind + 1;
DataCell{ind, 2}  = '竞买价，即“买一”报价';
ind = ind + 1;
DataCell{ind, 2}  = '竞卖价，即“卖一”报价';
ind = ind + 1;
DataCell{ind, 2}  = '成交量，单位“股”';
ind = ind + 1;
DataCell{ind, 2}  = '成交额，单位“元”';
ind = ind + 1;
DataCell{ind, 2}  = '买一量';
ind = ind + 1;
DataCell{ind, 2}  = '买一价';
ind = ind + 1;
DataCell{ind, 2}  = '买二量';
ind = ind + 1;
DataCell{ind, 2}  = '买二价';
ind = ind + 1;
DataCell{ind, 2}  = '买三量';
ind = ind + 1;
DataCell{ind, 2}  = '买三价';
ind = ind + 1;
DataCell{ind, 2}  = '买四量';
ind = ind + 1;
DataCell{ind, 2}  = '买四价';
ind = ind + 1;
DataCell{ind, 2}  = '买五量';
ind = ind + 1;
DataCell{ind, 2}  = '买五价';
ind = ind + 1;
DataCell{ind, 2}  = '卖一量';
ind = ind + 1;
DataCell{ind, 2}  = '卖一价';
ind = ind + 1;
DataCell{ind, 2}  = '卖二量';
ind = ind + 1;
DataCell{ind, 2}  = '卖二价';
ind = ind + 1;
DataCell{ind, 2}  = '卖三量';
ind = ind + 1;
DataCell{ind, 2}  = '卖三价';
ind = ind + 1;
DataCell{ind, 2}  = '卖四量';
ind = ind + 1;
DataCell{ind, 2}  = '卖四价';
ind = ind + 1;
DataCell{ind, 2}  = '卖五量';
ind = ind + 1;
DataCell{ind, 2}  = '卖五价';

end