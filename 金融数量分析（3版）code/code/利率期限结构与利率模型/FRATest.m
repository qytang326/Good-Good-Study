%Step1
%%
%数据第一列为时间，2-5列为不同日期的利率期限结构
Data=[0.2500    1.1900    1.1700    1.1900    1.2000
    0.5000    1.6200    1.5700    1.5300    1.5000
    2.0000    2.3800    2.1900    2.1000    1.7700
    3.0000    2.2900    2.1300    2.0400    1.6400
    5.0000    3.0900    2.9500    2.8900    2.6000
   10.0000    3.8200    3.7300    3.7300    3.5000
   30.0000    4.5400    4.4900    4.5200    4.3000];
%时间
Year=Data(:,1);
%利率结构
bonds=Data(:,[2 3 4 5]) 
%做出相应的利率期限结构图，并用不同的线型表示
figure %生成空白画布
plot(Year,bonds(:,1),'k+--');  
hold on;%在一个页面上画多图（
plot(Year,bonds(:,2),'k*--');
plot(Year,bonds(:,3),'kx--');
plot(Year,bonds(:,4),'ko--');
%X,Y坐标轴
xlabel('time')
ylabel('yield')
legend('Today','Day ago','Week ago','Month ago')
%Step2：
%%
%输入远期时间点，数值格式变为字符格式
%注意日期输入前方的0不能省略，如'07-23-2008'不可写成'7-23-2008'，字符长度一致
%分别为3个月后，6个月后，一年后……
curvedates=datenum(['07-23-2008';'10-24-2008';'04-23-2010';'04-23-2011';'04-23-2013';'04-23-2018';'04-23-2028']);
%调用zero2fwd函数分别求出来对应的FRA值
fwdone=zero2fwd(bonds(:,1),curvedates, '4-23-2008');
fwdtwo=zero2fwd(bonds(:,2),curvedates, '4-23-2008');
fwdthree=zero2fwd(bonds(:,3),curvedates, '4-23-2008');
fwdfour=zero2fwd(bonds(:,4),curvedates, '4-23-2008');
%做出相应的利率期限结构图，并用不同的线型表示
figure %生成空白画布
plot(curvedates,fwdone,'k+--');hold on;
plot(curvedates,fwdtwo,'k*--');
plot(curvedates,fwdthree,'kx--');
plot(curvedates,fwdfour,'ko--');
%x轴为时间序列
dateaxis('x');
%X,Y坐标轴
xlabel('time')
ylabel('yield')
%标记
legend('Today','Day ago','Week ago','Month ago')