classdef Circle
    %UNTITLED7 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        Radius=0;
    end
    
    methods
        function obj=Circle(radius)
            if nargin>0
                obj.Radius=radius;
            end
            
        end
        function S=GetArea(obj)
            S=(obj.Radius)^2*pi;
        end
    end
    
end

