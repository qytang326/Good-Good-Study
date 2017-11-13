function update_LB(handles)
vas=evalin('base','who');
set(handles.LB,'String',vars);
set(handles.LB,'Value',1)