function varargout = guide_02(varargin)
% GUIDE_02 M-file for guide_02.fig
%      GUIDE_02, by itself, creates a new GUIDE_02 or raises the existing
%      singleton*.
%
%      H = GUIDE_02 returns the handle to a new GUIDE_02 or the handle to
%      the existing singleton*.
%
%      GUIDE_02('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDE_02.M with the given input arguments.
%
%      GUIDE_02('Property','Value',...) creates a new GUIDE_02 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guide_02_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guide_02_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guide_02

% Last Modified by GUIDE v2.5 16-Oct-2015 18:50:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guide_02_OpeningFcn, ...
                   'gui_OutputFcn',  @guide_02_OutputFcn, ...
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


% --- Executes just before guide_02 is made visible.
function guide_02_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guide_02 (see VARARGIN)

% Choose default command line output for guide_02
handles.output = hObject;
handles.ETUinput=15;
set(handles.ETU,'String',handles.ETUinput);
set(handles.ETD,'String',0);

% Update handles structure

guidata(hObject, handles);

% UIWAIT makes guide_02 wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = guide_02_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function ETU_Callback(hObject, eventdata, handles)
% hObject    handle to ETU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ETU as text
%        str2double(get(hObject,'String')) returns contents of ETU as a double


% --- Executes during object creation, after setting all properties.
function ETU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ETU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ETD_Callback(hObject, eventdata, handles)
% hObject    handle to ETD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ETD as text
%        str2double(get(hObject,'String')) returns contents of ETD as a double


% --- Executes during object creation, after setting all properties.
function ETD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ETD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PBL.
function PBL_Callback(hObject, eventdata, handles)
% hObject    handle to PBL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ETDstr=get(handles.ETU,'String');
ETDnum=str2double(ETDstr);
if isnumeric(ETDnum)
    handles.ETUinput=ETDnum;
    guidata(hObject,handles);
end

% --- Executes on button press in PBR.
function PBR_Callback(hObject, eventdata, handles)
% hObject    handle to PBR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles,'ETUinput')
    set(handles.ETD,'String',10*handles.ETUinput);
end
