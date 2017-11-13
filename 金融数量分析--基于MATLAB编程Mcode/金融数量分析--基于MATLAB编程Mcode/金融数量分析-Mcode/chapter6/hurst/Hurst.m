function varargout = Hurst(varargin)
%
% HURST M-file for Hurst.fig
%      HURST, by itself, creates a new HURST or raises the existing
%      singleton*.
%
%      H = HURST returns the handle to a new HURST or the handle to
%      the existing singleton*.
%
%      HURST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HURST.M with the given input arguments.
%
%      HURST('Property','Value',...) creates a new HURST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Hurst_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Hurst_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Hurst

% Last Modified by GUIDE v2.5 09-Oct-2008 00:35:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Hurst_OpeningFcn, ...
                   'gui_OutputFcn',  @Hurst_OutputFcn, ...
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


% --- Executes just before Hurst is made visible.
function Hurst_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Hurst (see VARARGIN)

% Choose default command line output for Hurst
handles.output = hObject;


% Update handles structure
guidata(hObject, handles);


% UIWAIT makes Hurst wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Hurst_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function editPrices_Callback(hObject, eventdata, handles)
% hObject    handle to editPrices (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editPrices as text
%        str2double(get(hObject,'String')) returns contents of editPrices as a double


% --- Executes during object creation, after setting all properties.
function editPrices_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editPrices (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in InPut.
function InPut_Callback(hObject, eventdata, handles)
% hObject    handle to InPut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.xls','Select the file containing price series');
[handles.Prices, handles.dates] =SimpleXLsReader(FileName);
set(handles.editStartDate,'String', datestr( min( handles.dates ),'dd/mm/yyyy'));
set(handles.editEndDate,'String', datestr( max( handles.dates ),'dd/mm/yyyy'));
set(handles.editPrices,'String',FileName);
set(handles.CycleLength240days,'Value',1);
handles.cyclength=240;
% Update handles structure
guidata(hObject, handles)



function editStartDate_Callback(hObject, eventdata, handles)
% hObject    handle to editStartDate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editStartDate as text
%        str2double(get(hObject,'String')) returns contents of editStartDate as a double


% --- Executes during object creation, after setting all properties.
function editStartDate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editStartDate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editEndDate_Callback(hObject, eventdata, handles)
% hObject    handle to editEndDate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEndDate as text
%        str2double(get(hObject,'String')) returns contents of editEndDate as a double


% --- Executes during object creation, after setting all properties.
function editEndDate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEndDate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in StartComptuter.
function StartComptuter_Callback(hObject, eventdata, handles)
% hObject    handle to StartComptuter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DataLength=length(handles.Prices);
if handles.cyclength > DataLength
    plot(1:100,1:100,'r*',1:100,100:-1:1,'ro');
    text(10,50,'Number of data must biger than Cycle Length','FontSize',28);
else
    plot(1:0.1:10,sin(1:0.1:10),'r*',1:0.1:10,-sin(1:0.1:10),'ro');
    logData=log(handles.Prices);
    logData=logData(DataLength:-1:1);
    IndexReturn=[0;logData(2:DataLength)-logData(1:DataLength-1)];
    hurstE=zeros(DataLength,1);
    hurstE(1:handles.cyclength-1)=NaN;
    for i=1:( DataLength-handles.cyclength+1 )
         HurstExponent=HurstCompute(   IndexReturn (i:i+handles.cyclength-1) );
         hurstE(handles.cyclength+i-1)=HurstExponent(1);
    end
    fts = fints(handles.dates,[hurstE(DataLength:-1:1) logData(DataLength:-1:1)],{'HurstExponent','logIndex'});
    chartfts(fts);  
end


% --- Executes on button press in CycleLength60days.
function CycleLength60days_Callback(hObject, eventdata, handles)
% hObject    handle to CycleLength60days (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CycleLength60days
if get(hObject,'Value')==1
    handles.cyclength=60;
end
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in CycleLength120days.
function CycleLength120days_Callback(hObject, eventdata, handles)
% hObject    handle to CycleLength120days (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CycleLength120days
if get(hObject,'Value')==1
    handles.cyclength=120;
end
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in CycleLength240days.
function CycleLength240days_Callback(hObject, eventdata, handles)
% hObject    handle to CycleLength240days (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CycleLength240days
if get(hObject,'Value')==1
    handles.cyclength=240;
end
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in CycleLength360days.
function CycleLength360days_Callback(hObject, eventdata, handles)
% hObject    handle to CycleLength360days (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CycleLength360days
if get(hObject,'Value')==1
    handles.cyclength=360;
end
% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function LogPlot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LogPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate LogPlot


% --- Executes during object creation, after setting all properties.
function HurstPlot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HurstPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate HurstPlot


