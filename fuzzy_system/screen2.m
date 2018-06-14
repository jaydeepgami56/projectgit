function varargout = screen2(varargin)
% SCREEN2 M-file for screen2.fig
%      SCREEN2, by itself, creates a new SCREEN2 or raises the existing
%      singleton*.
%
%      H = SCREEN2 returns the handle to a new SCREEN2 or the handle to
%      the existing singleton*.
%
%      SCREEN2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SCREEN2.M with the given input arguments.
%
%      SCREEN2('Property','Value',...) creates a new SCREEN2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before screen2_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to screen2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help screen2

% Last Modified by GUIDE v2.5 28-May-2015 12:48:19

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @screen2_OpeningFcn, ...
    'gui_OutputFcn',  @screen2_OutputFcn, ...
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


% --- Executes just before screen2 is made visible.
function screen2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to screen2 (see VARARGIN)

% Choose default command line output for screen2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes screen2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = screen2_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load fismat
load data
load out_fis

output=round(evalfis(data(1:50,1:12),out_fis));
output=output*rand;

% output=round(evalfis(data(1:length(data),1:12),out_fis));
save output;

% genetic algorithm applied
fismat=apply_ga(fismat,output,data(1:50,1:13));
% fismat=apply_ga(fismat,output,data);

h = waitbar(0,'Initializing waitbar...');
waitbar(0.5,h,'Halfway there...')
perc = 75;


out_ga = anfis(data(1:50,1:13),fismat,1);
% out_ga = anfis(data(1:length(data),1:13),fismat,1);

output_ga=round(evalfis(data(1:50,1:12),out_ga));
% output_ga=round(evalfis(data(1:length(data),1:12),out_ga));
save output_ga;

waitbar(perc/100,h,sprintf('%d%% along...',perc))
save out_ga
cnt=1;
for ii=0:10
    cnt=cnt+1;
end

close(h)

h = msgbox('Genetic Algorithm is applied...');

h = msgbox('Data Trained Successfully...');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 screen3;
%  screen3_new;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

screen4;

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
screen1

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close all
