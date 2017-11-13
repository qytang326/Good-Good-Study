%集合函数运算示例 
A=[1 2 3 4 5 6];
B=[4 5 6 7 8 9];
%交集
C=intersect(A,B)
%并集
C =union (A,B)
%元素识别
b=4;
C = ismember(A,b)  
%非重复元素
C = unique([A,B])