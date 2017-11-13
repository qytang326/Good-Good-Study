classdef MfunView
    %UNTITLED3 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        FunObj
        HSurf
    end
    
    methods
        function obj=MfunView(fobj)
            obj.FunObj=fobj;
        end
    end
     methods (Static = true)
         createViews(a)
     end
    
end

