classdef Myclock <handle
    properties
        Hour=0;
        Minute=0;
        Second=0;   
    end
    methods
        function obj=Myclock(h,m,s)
            switch nargin
                case 3
                    obj.Hour=h;obj.Minute=m;obj.Second=s;
                case 2
                    obj.Hour=h;obj.Minute=m;obj.Second=0;
                case 1
                    obj.Hour=h;obj.Minute=0;obj.Second=0;
                otherwise
                    obj.Hour=0;obj.Minute=0;obj.Second=0;
            end
        end
        function show(obj)
            disp([num2str(obj.Hour),':',num2str(obj.Minute),':',num2str(obj.Second)]);
        end 
        %function val=get.Time(obj)
            %val=clock;
       % end
       
    end
   
    
end


    
