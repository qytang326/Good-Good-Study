%@MfunView/ createViews.m
function createViews(funevalobj)

%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
viewobj=MfunView(funevalobj);
viewobj.Hsurf=surf(viewobj.FunObj.Data.X,...
    viewobj.FunObj.Data.Y,viewobj.FunObj.Data.Z);
shading interp
end

