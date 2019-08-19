
function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 17-Aug-2019 13:47:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles)  %#ok<*INUSL>
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in grayscale.
function grayscale_Callback(hObject, eventdata, handles) %#ok<*INUSD>
% hObject    handle to grayscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
b = rgb2gray(img);
axes(handles.axes1);
imshow(b)



% --- Executes on button press in rgb.
function rgb_Callback(hObject, eventdata, handles) %#ok<*DEFNU>
% hObject    handle to rgb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
figure()
title('RGB Channels');

subplot(1,3,1),
imshow(img(:, :, 1)), title('Red');
hold on
subplot(1,3,2),
imshow(img(:, :, 2)), title('Green');
hold on
subplot(1,3,3),
imshow(img(:, :, 3)), title('Blue');
hold on
% --- Executes on button press in subplot.

function subplot_Callback(hObject, eventdata, handles)
% hObject    handle to subplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 global img

 

 
prompt = {'Enter matrix size'};
dlgtitle = 'm*n';
definput = {'Enter integers between 2-8 to avoid software crash'};
opts.Interpreter = 'tex';
answer = inputdlg(prompt,dlgtitle,[1 70],definput,opts);
 x1 = str2double(answer);
  y= x1*x1 ;
  figure()
  title('Subplot of images with m*n matrix size');
 for i =1:1:y
     subplot(x1, x1, i);
     imshow(img)
     hold on
 end
%figure()
% --- Executes on button press in binary.
function binary_Callback(hObject, eventdata, handles)
% hObject    handle to binary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
b = im2bw(img); %#ok<*IM2BW>
axes(handles.axes1);
imshow(b)


% --- Executes on button press in flipvertical.
function flipvertical_Callback(hObject, eventdata, handles)
% hObject    handle to flipvertical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hold on    
global img
    f = flip(img, 1);
    axes(handles.axes1)
   imshow(f)

   hold on
% --- Executes on button press in rotate.
function rotate_Callback(hObject, eventdata, handles)
% hObject    handle to rotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img

prompt = {'Enter a value of \theta (in degrees)'};
dlgtitle = 'Theta Value';
definput = {'30'};
opts.Interpreter = 'tex';
answer = inputdlg(prompt,dlgtitle,[1 40],definput,opts);
a1 = str2double(answer);

r = imrotate(img, a1);
axes(handles.axes1);
imshow(r)

% --- Executes on button press in selectimage.
function selectimage_Callback(hObject, eventdata, handles)
% hObject    handle to selectimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
global img

[file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
s=[path,file];
%axes(handles.axes1)
img=imread(s);
imshow(img)

% --- Executes on button press in saveimage.
function saveimage_Callback(hObject, eventdata, handles)
% hObject    handle to saveimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, foldername] = uiputfile('Where do you want the file saved?');
complete_name = fullfile(foldername, filename);
imwrite(TheArray, complete_name);

% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cla reset



% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global img

imshow(img)


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close();


% --- Executes on button press in complement.
function complement_Callback(hObject, eventdata, handles)
% hObject    handle to complement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
c = imcomplement(img);
axes(handles.axes1);
imshow(c)

% --- Executes on button press in imageadjust.
function imageadjust_Callback(hObject, eventdata, handles)
% hObject    handle to imageadjust (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
ia = imadjust(img);
axes(handles.axes1);
imshow(ia)

% --- Executes on button press in horizontal.
function horizontal_Callback(hObject, eventdata, handles)
% hObject    handle to horizontal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
    f = flip(img, 2);
    axes(handles.axes1)
   imshow(f)
