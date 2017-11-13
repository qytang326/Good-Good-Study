function varargout = guide_03(varargin)
% GUIDE_03 M-file for guide_03.fig
%      GUIDE_03, by itself, creates a new GUIDE_03 or raises the existing
%      singleton*.
%
%      H = GUIDE_03 returns the handle to a new GUIDE_03 or the handle to
%      the existing singleton*.
%
%      GUIDE_03('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDE_03.M with the given input arguments.
%
%      GUIDE_03('Property','Value',...) creates a new GUIDE_03 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guide_03_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guide_03_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guide_03

% Last Modified by GUIDE v2.5 16-Oct-2015 21:44:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guide_03_OpeningFcn, ...
                   'gui_OutputFcn',  @guide_03_OutputFcn, ...
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
end

% --- Executes just before guide_03 is made visible.
function guide_03_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guide_03 (see VARARGIN)

% Choose default command line output for guide_03
handles.output = hObject;
update_LB(handles)
function update_LB(handles)
vars=evalin('base','who');
set(handles.LB,'String',vars);
set(handles.LB,'Value',1)
end
% Update handles structure
guidata(hObject, handles);
end

% UIWAIT makes guide_03 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guide_03_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

% --- Executes on button press in PBL.
function PBL_Callback(hObject, eventdata, handles)
% hObject    handle to PBL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
update_LB(handles)
end
% --- Executes on button press in PBR.
function PBR_Callback(hObject, eventdata, handles)
% hObject    handle to PBR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.AX)
list_entries=get(handles.LB,'String');
index_selected=get(handles.LB,'String');
if length(index_selected)~=1
    errordlg('one variable','Incorrect Selection','modal')
else
    var=list_entries{index_selected};
end
evalin('base','plot(var)');
figure
%evalin('base',['plot(',var,')']);
end    

% --- Executes on selection change in LB.
function LB_Callback(hObject, eventdata, handles)
% hObject    handle to LB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns LB contents as cell array
%        contents{get(hObject,'Value')} returns selected item from LB
end

% --- Executes during object creation, after setting all properties.
function LB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
