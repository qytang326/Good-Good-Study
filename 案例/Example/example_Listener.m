function main()
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
hobj=MClock;
hl=event.listener(hobj,'Alarm',@CallbackFunction);
hobj.AlarmSetChange(1);
end
function CallbackFunction(source,eventData)
alarm=source.Enable
disp('事件响应了');
end

