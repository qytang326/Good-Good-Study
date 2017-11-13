%beta计算
load funddata
%数据列顺序为'Hs300','博时主题','嘉实300','南方绩优'
%将价格序列改为收益率序列
Rate=price2ret(funddata);
%博时主题
BSbeta=portbeta(Rate(:,1),Rate(:,2));
sprintf('博时主题Beta=%3.5f',BSbeta)
%'嘉实300'
JSbeta=portbeta(Rate(:,1),Rate(:,3));
sprintf('嘉实300Beta=%3.5f',JSbeta)
%'南方绩优'
NFbeta=portbeta(Rate(:,1),Rate(:,4));
sprintf('南方绩优Beta=%3.5f',NFbeta)
sprintf('南方绩优Beta=%2.3f',NFbeta)
sprintf('南方绩优Beta=%1.1f',NFbeta)