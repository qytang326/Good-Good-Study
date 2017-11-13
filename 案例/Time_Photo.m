function varargout = Time_Photo(varargin)
% TIME_PHOTO MATLAB code for Time_Photo.fig
%      TIME_PHOTO, by itself, creates a new TIME_PHOTO or raises the existing
%      singleton*.
%
%      H = TIME_PHOTO returns the handle to a new TIME_PHOTO or the handle to
%      the existing singleton*.
%
%      TIME_PHOTO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TIME_PHOTO.M with the given input arguments.
%
%      TIME_PHOTO('Property','Value',...) creates a new TIME_PHOTO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Time_Photo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Time_Photo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Time_Photo

% Last Modified by GUIDE v2.5 24-Apr-2012 14:04:26

% Begin initialization code - DO NOT EDIT

%Time_Photo--常规定时拍照GUI
% (C) 2012-2022 XTU,Liu Xiu

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Time_Photo_OpeningFcn, ...
                   'gui_OutputFcn',  @Time_Photo_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Time_Photo is made visible.
function Time_Photo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Time_Photo (see VARARGIN)

% Choose default command line output for Time_Photo
set(handles.edit2,'String','5')
set(handles.edit3,'String','我的图片')
set(handles.edit5,'String','20')
handles.ges='jpg';
path=cd;
set(handles.edit4,'String',path)
guidata(hObject,handles);

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Time_Photo wait for user response (see UIRESUME)
% uiwait(handles.Time_Photo);


% --- Outputs from this function are returned to the command line.
function varargout = Time_Photo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in tg_chakan.
function tg_chakan_Callback(hObject, eventdata, handles)
% hObject    handle to tg_chakan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
winvideo=imaqhwinfo('winvideo');
Formats=winvideo.DeviceInfo.SupportedFormats;
[Sel,ok]=listdlg('ListString',Formats,'PromptString','请选一种格式','SelectionMode','single');
if ok
    format=Formats(Sel);
    str=format{1};
    set(handles.tgfenbianlv,'String',str)
end

% --- Executes on button press in tg_lianjie.
function tg_lianjie_Callback(hObject, eventdata, handles)
% hObject    handle to tg_lianjie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fenbianlv=get(handles.tgfenbianlv,'String');
obj = videoinput('winvideo',1,fenbianlv);
set(obj,'ReturnedColorSpace','rgb');
handles.ob=obj;
guidata(hObject,handles);
h=msgbox('摄像头连接成功！','提示');
pause(0.8)
close(h)

% --- Executes on button press in tg_paizhao.
function tg_paizhao_Callback(hObject, eventdata, handles)
% hObject    handle to tg_paizhao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
obj=handles.ob;
frame = getsnapshot(obj);
imshow(frame)


function tgfenbianlv_Callback(hObject, eventdata, handles)
% hObject    handle to tgfenbianlv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tgfenbianlv as text
%        str2double(get(hObject,'String')) returns contents of tgfenbianlv as a double


% --- Executes during object creation, after setting all properties.
function tgfenbianlv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tgfenbianlv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tg_name.
function tg_name_Callback(hObject, eventdata, handles)
% hObject    handle to tg_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Photoname=get(handles.edit3,'String');
if ~isempty(Photoname)
    ges=handles.ges;
    path=[get(handles.edit4,'String'),'\'];
    Str=dir([path,'*.',ges]);
    assignin('base','Str',Str)
L=length(Str);

flag=1;
for i=1:L
    Name=Str(i).name;
    K=regexp(Name,['\d','.',ges]);
    Name(K:end)=[];
    if strcmp(Photoname,Name)
            helpdlg('有相同的文件名，请更换名字！');
            flag=0;
            break
    end
 end
if flag
    handles.Photoname=Photoname;
    guidata(hObject,handles)
    set(handles.tg_dingshipz,'Value',0)
    h=msgbox('图像名称设置成功！','提示');
    pause(0.5)
    close(h)
end
else
    msgbox('图像名不能为空','提示')
end


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tg_yulan.
function tg_yulan_Callback(hObject, eventdata, handles)
% hObject    handle to tg_yulan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
obj=handles.ob;
f=figure('Name','我的预览窗口','NumberTitle','off');
uicontrol('String', 'Close', 'Callback', 'close(gcf)');
set(f,'menubar','none')
vidRes = get(obj, 'VideoResolution');
nBands = get(obj, 'NumberOfBands');
hImage = image( zeros(vidRes(2), vidRes(1), nBands) );
preview(obj,hImage);



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tg_lujing.
function tg_lujing_Callback(hObject, eventdata, handles)
% hObject    handle to tg_lujing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Path=uigetdir('');
set(handles.edit4,'string',Path)


% --- Executes on button press in tg_qingchu.
function tg_qingchu_Callback(hObject, eventdata, handles)
% hObject    handle to tg_qingchu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
button=questdlg('您想清除图像吗？','提问对话框','是','否','否');
switch button
    case '是'
        cla
    otherwise
end

% --- Executes on button press in tg_tuichu.
function tg_tuichu_Callback(hObject, eventdata, handles)
% hObject    handle to tg_tuichu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
button=questdlg('您想退出吗？','提问对话框','是','否','否');
switch button
    case '是'
       close(gcf)
    otherwise
end

% --- Executes on button press in tg_baocun.
function tg_baocun_Callback(hObject, eventdata, handles)
% hObject    handle to tg_baocun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%geshi=handles.ges;
%Path=get(handles.edit4,'String');
[filename,pathname]=uiputfile({'*.jpg';'*.bmp';'*.png';'*.tif';'*.emf'});
if ~isequal(filename,0)
A=getimage(handles.axes1);
imwrite(A,[pathname,filename]);
h=msgbox('保存成功','提示');
pause(0.5)
close(h)
end

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function tgMenu_Callback(hObject, eventdata, handles)
% hObject    handle to tgMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function tgEdit_Callback(hObject, eventdata, handles)
% hObject    handle to tgEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function tgHelp_Callback(hObject, eventdata, handles)
% hObject    handle to tgHelp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function tgHelpdoc_Callback(hObject, eventdata, handles)
% hObject    handle to tgHelpdoc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function tgAbout_Callback(hObject, eventdata, handles)
% hObject    handle to tgAbout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpdlg('本程序由Liu X编写，2012.04.24于XTU，All Rights Reserved.','声明');


% --- Executes on button press in tg_dingshijg.
function tg_dingshijg_Callback(hObject, eventdata, handles)
% hObject    handle to tg_dingshijg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

T=str2double(get(handles.edit2,'String'));
if T>0
handles.T=T;
guidata(hObject,handles)
h=msgbox('定时间隔设置成功！','提示');
pause(0.5)
close(h)
else
    msgbox('定时间隔必须大于0','提示')
end


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tg_paishezs.
function tg_paishezs_Callback(hObject, eventdata, handles)
% hObject    handle to tg_paishezs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PhotoNum=str2double(get(handles.edit5,'String'));
if PhotoNum==round(PhotoNum)
handles.PhotoNum=PhotoNum;
guidata(hObject,handles)
h=msgbox('拍摄张数设置成功！','提示');
pause(0.5)
close(h)
else
    msgbox('拍摄张数必须为正整数','提示')
end
% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3
val=get(hObject,'Value');
switch val
    case 1
        geshi='jpg';
    case 2
        geshi='bmp';
    case 3
        geshi='png';
   case 4
        geshi='tif';
   case 5
        geshi='gif';       
end
handles.ges=geshi;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tg_dingshipz.
function tg_dingshipz_Callback(hObject, eventdata, handles)
% hObject    handle to tg_dingshipz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tg_dingshipz
if get(handles.tg_dingshipz,'Value')
    %set(handles.tg_dingshipz,'String','开始拍照');
  obj=handles.ob;
Path=[get(handles.edit4,'String'),'\'];
if isfield(handles,{'Photoname','ges','PhotoNum','T'})
Name=handles.Photoname;
Photonum=handles.PhotoNum;
ges=handles.ges;
T=handles.T;
for i=1:Photonum
    tic
    tic
    frame=getsnapshot(obj);
    imwrite(frame,[Path,Name,int2str(i),'.',ges]);
    elapsedTime=toc;
    pause(T-elapsedTime)
   if get(handles.tg_dingshipz,'Value')==0  
       handles=rmfield(handles,'Photoname');
       guidata(hObject,handles)
     break
   end
   toc
end
if isfield(handles,'Photoname')
 handles=rmfield(handles,'Photoname');
 guidata(hObject,handles)
end
 set(handles.tg_dingshipz,'Value',0)
 msgbox('本轮定时拍照圆满完成！进入下轮定时请重新设置图像名、定时间隔等！','提示')
else
    msgbox('请先设置好图像名、定时间隔、拍摄张数','提示');
end
end


% --------------------------------------------------------------------
function tgSave_Callback(hObject, eventdata, handles)
% hObject    handle to tgSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uiputfile({'*.jpg';'*.bmp';'*.png';'*.tif';'*.emf'});
if ~isequal(filename,0)
A=getimage(handles.axes1);
imwrite(A,[pathname,filename]);
h=msgbox('保存成功','提示');
pause(0.5)
close(h)
end

% --------------------------------------------------------------------
function tgExit_Callback(hObject, eventdata, handles)
% hObject    handle to tgExit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
button=questdlg('您想退出吗？','提问对话框','是','否','否');
switch button
    case '是'
       close(gcf)
    otherwise
end
