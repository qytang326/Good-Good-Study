[data1,data2]=textread('1.txt','%s%s','delimiter', ',');
row=2;
while row<=length(data1)
    if(strncmp(data1(row,1),data1(row-1,1),3))||(strncmp(data1(row,1),data1(row+1,1),3))
    else
        data1{row,1}=data1{row,1}(1:3); %这句有问题
    end
    row=row+1;   
end 