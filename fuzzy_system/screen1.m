function varargout = screen1(varargin)

% SCREEN1 M-file for screen1.fig
%      SCREEN1, by itself, creates a new SCREEN1 or raises the existing
%      singleton*.
%
%      H = SCREEN1 returns the handle to a new SCREEN1 or the handle to
%      the existing singleton*.
%
%      SCREEN1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SCREEN1.M with the given input arguments.
%
%      SCREEN1('Property','Value',...) creates a new SCREEN1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before screen1_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to screen1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help screen1

% Last Modified by GUIDE v2.5 27-May-2015 18:22:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @screen1_OpeningFcn, ...
                   'gui_OutputFcn',  @screen1_OutputFcn, ...
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


% --- Executes just before screen1 is made visible.
function screen1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to screen1 (see VARARGIN)

% Choose default command line output for screen1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes screen1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = screen1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output = hObject;
data = uigetfile('*.csv');

 clear data
%  data = csvread('heart-statlog.csv');
%  data=normalize_data(data);
 original_data = csvread('fuzzy_data.csv');
 data= original_data(1:50,1:13);
save data
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load data
len=length(data);

numMFs1 = [2 5 3 3 2 2 2 3 2 3 2 2];
mfType1 = str2mat('pimf','trimf','trimf','trimf','trimf','trimf' ,'trimf','trimf','trimf','trimf','trimf','trimf')%,'trimf','trimf');

% fismat = genfis2(data(1:len,1:12),data(1:len,13),0.5);
fismat = genfis2(data(1:50,1:12),data(1:50,13),0.5);

h=findobj('Style','edit','Tag','edit1');
handles.edit1=h;
Str1 = {'12'};
set(handles.edit1, 'String', Str1);
clear Str1;

h=findobj('Style','edit','Tag','edit2');
handles.edit2=h;
Str1 = {'1'};
set(handles.edit2, 'String', Str1);
clear Str1;

h=findobj('Style','edit','Tag','edit3');
handles.edit3=h;
Str1 = {'[5 2 4 3 3 2 3 3 2 3 4 3]'};
set(handles.edit3, 'String', Str1);
clear Str1;


save fismat
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load fismat
load data

h = waitbar(0,'Initializing waitbar...');
waitbar(0.5,h,'Halfway there...')
perc = 75;

out_fis = anfis(data(1:50,1:13),fismat,1);

% out_fis = anfis(data,fismat,1);




waitbar(perc/100,h,sprintf('%d%% along...',perc))
save out_fis;
cnt=1;
for ii=0:10
   cnt=cnt+1;
end

close(h)

h = msgbox('Neuro Fuzzy System Created Successfully...');

screen2
