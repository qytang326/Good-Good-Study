classdef WeekDays
    %UNTITLED3 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
    end
    
    methods
        function tf=isMeetingDay(obj)
            tf=~(WeekDays.Tuesday==obj);
        end
    end
    enumeration
        Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday
    end
end

