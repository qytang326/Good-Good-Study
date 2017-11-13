classdef MClock < handle
    %UNTITLED2 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        Enable=false;
        
    end
    
    methods
        function obj=MClock(IsEnable)
            if nargin ~=0
            obj.Enable=IsEnable;
            end
            hl=addlistener(obj,'Alarm',@CallbackFunction);
           
        end
        function AlarmSetChange(obj,IsEnable)
            if IsEnable~=obj.Enable
                obj.Enable=IsEnable;
                notify(obj,'Alarm');
              
            end
        end
        function CallbackFunction(source,eventData)
            alarm=source.Enable;
            disp('事件响应了');
        end
        
    end
   events
       Alarm
   end
    
    
end

