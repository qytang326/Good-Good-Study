classdef Line
    %UNTITLED6 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        p1;p2;
        color;
    end
    
    methods
        function obj=Line(x1,y1,x2,y2,c)
            obj.color=c;
            obj.p1=Point(x1,y1);
            obj.p2=Point(x2,y2);
            disp('Line constructing ！');
        end
    end
    
end

