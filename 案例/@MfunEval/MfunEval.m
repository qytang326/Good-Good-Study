classdef MfunEval
    properties
        HFun;
        Lm=[-2*pi 2*pi];
    end
    properties (Dependent = true)
        Data;
    end
    
    methods
        function obj=MfunEval(fun_handle,limits)
            obj.HFun=fun_handle;
            obj.Lm=limits;
        end
        function data=get.Data(obj)
            [x,y]=MfunEval.grid(obj.Lm);
            z=obj.HFun(x,y);
            data.X=x;
            data.Y=y;
            data.Z=z;
        end
    end
    methods (Static)
        function [x,y]=grid(lim)
            step=(lim(2)-lim(1))/50;
            [x,y]=meshgrid(lim(1):step:lim(2));
        end
    end
end
        