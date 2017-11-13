classdef MClockFun <handle
    %UNTITLED3 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
         ListenerHandle;
    end
    
    methods
        function obj=MClockFun(MClock_obj)
            h1=addlistener(MClock_obj,'Alarm',@MClock.listenMyEvent);
            obj.ListenerHandle=h1;
        end
    end
    methods (Static=true)
        function listenMyEvent(obj,src,~)
            disp('Alarm')
            figure(1)
        end
    end
    
end

