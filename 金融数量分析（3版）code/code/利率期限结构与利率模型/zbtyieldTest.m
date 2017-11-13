%Test zbtprice
%到期日
%从bond.xls文件的'Data'sheet中读取
[~,Maturity,~] = xlsread('bond.xls','Data','E3:E27');
%票面利率
[Couponrate,~,~] = xlsread('bond.xls','Data','F3:F27');
%票面利率转换为小数
Couponrate=Couponrate/100;
%债券价格
[Price,~,~] = xlsread('bond.xls','Data','H3:H27');
%将字符日期转为数值格式
Maturity=datenum(Maturity);
%构建zbtyield参数Bonds
bonds=[Maturity, Couponrate];
%使用bndyield根据价格计算到期收益率 
Yield=bndyield(Price,Couponrate,'2012-5-30',Maturity)
%调用zbtyield函数，求利率期限结构（买方）
[zerorates1 dates1]=zbtyield(bonds, Yield,'2012-5-30');	
plot(dates1, zerorates1*100,'--r');
hold on
%读入卖方报价数据
[Price,~,~] = xlsread('bond.xls','Data','N3:N27');
%使用bndyield根据价格计算到期收益率 
Yield=bndyield(Price,Couponrate,'2012-5-30',Maturity)
%调用zbtprice函数，求利率期限结构（卖方）
[zerorates2 dates2]=zbtyield(bonds, Yield,'2012-5-30');
plot(dates2, zerorates2*100,'b');
dateaxis('x')
%X轴坐标
xlabel('time')
%Y轴坐标 
ylabel('yield(%)')
%线型标记 
legend('Buy','Sell')


