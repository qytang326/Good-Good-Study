classdef SubMyclock <Myclock
    properties 
        Time;
    end
    methods 
        function obj=SubMyclock(x,y)
        obj.Hour=x;
        obj.Time=y;
        end
    end
end