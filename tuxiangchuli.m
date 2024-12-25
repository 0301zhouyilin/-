function varargout = tuxiangchuli(varargin)
% TUXIANGCHULI MATLAB code for tuxiangchuli.fig
%      TUXIANGCHULI, by itself, creates a new TUXIANGCHULI or raises the existing
%      singleton*.
%
%      H = TUXIANGCHULI returns the handle to a new TUXIANGCHULI or the handle to
%      the existing singleton*.
%
%      TUXIANGCHULI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUXIANGCHULI.M with the given input arguments.
%
%      TUXIANGCHULI('Property','Value',...) creates a new TUXIANGCHULI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tuxiangchuli_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tuxiangchuli_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tuxiangchuli

% Last Modified by GUIDE v2.5 25-Dec-2024 12:07:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @tuxiangchuli_OpeningFcn, ...
    'gui_OutputFcn',  @tuxiangchuli_OutputFcn, ...
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

% --- Executes just before tuxiangchuli is made visible.
function tuxiangchuli_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tuxiangchuli (see VARARGIN)

% Choose default command line output for tuxiangchuli
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(gcf,'numbertitle','off','name','图像处理器');   % 设置界面标题

% UIWAIT makes tuxiangchuli wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = tuxiangchuli_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 选择图片所在路径及图片
[filename,filepath]=uigetfile({'*.bmp;*.jpg;*.png'},'选择图片文件');
set(handles.edit1,'string',[filepath filename])
A=get(handles.edit1,'String');
handles.A=A;
guidata(hObject, handles)

end


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
end

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
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 展示原始图片
A= handles.A;
axes(handles.axes1);   %在第一个轴中显示
imshow(A);
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)    %下拉菜单
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
end

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
end

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

A= handles.A;  % 路径
B = imread(A);   % 存储原始图像为B
N = get(handles.popupmenu1,'Value');  % 获得下拉框的选择
switch N
    case 1   % 灰度图
        B_huidu = my_rgb2gray(B);   %用写好的函数进行RGB到灰度图像的转换
        axes(handles.axes2);              %在第2个轴中显示
        imshow(B_huidu)
    case 2    % 线性变换
        B_enhance=my_enhance_1(B);
        axes(handles.axes2);
        imshow(B_enhance)
        title('分段线性变换后图像')
        
    case 3   % 非线性变换   ------1对数，2指数
        [B_enhance1,B_enhance2]=my_enhance_2(B);       
        axes(handles.axes3);
        imshow(B_enhance1,[])
        title('对数变换后图像')
        axes(handles.axes4);
        imshow(B_enhance2,[])
        title('指数变换后图像')
        
    case 4    % 图像放大
        k=get(handles.edit2,'String');
        k=str2double(k);
        B_enlarge=my_resize_1(B,k);
        axes(handles.axes2)
        %imshow(B_enlarge)
        %title('长宽放大2.5倍后的图片')
        imshowpair(B,B_enlarge,'montage')
        title('原图和长宽放大后的图像')
        
    case 5   % 图像缩小
        k=get(handles.edit2,'String');
        k=str2double(k);
        B_shrink = my_resize_2(B,k);
        axes(handles.axes2)
        imshowpair(B,B_shrink,'montage')
        title('原图和长宽缩小的图像')
        
    case 6    % 图像旋转
        angle=get(handles.edit2,'String');
        angle=str2double(angle);
        B_rotate=my_imrotate(B,angle);
        axes(handles.axes2);
        imshow(B_rotate)
        title('旋转后的图像')
        
    case 7    % 直方图统计
        B_huidu = rgb2gray(B); %用已有的函数进行RGB到灰度图像的转换
        axes(handles.axes2);
        my_imhist(B_huidu) 
        title('直方图统计');
        
    case 8   % 直方图均衡化 
        axes(handles.axes3);
        B_gray = my_rgb2gray(B);
        imshow(B_gray), title('原图')
        axes(handles.axes4);
        my_imhist(B_gray), title('原图的直方图')
        B_eq = my_histeq(B);
        axes(handles.axes5);
        imshow(B_eq), title('均衡化的图') 
        axes(handles.axes6);   
        my_imhist(B_eq), title('均衡化后的直方图')
        
    case 9    % robert边缘检测
        I = rgb2gray(B);%用已有的函数进行RGB到灰度图像的转换
        axes(handles.axes3)
        imshow(I), title('二值化图像')
        [edgeImage,BW1]=my_roberts(B);
        axes(handles.axes4)
        imshow(edgeImage),title('roberts梯度图像');
        axes(handles.axes6)
        imshow(BW1),title('roberts边缘检测')
        
    case 10   % sobel边缘检测
        I = rgb2gray(B);%用已有的函数进行RGB到灰度图像的转换
        axes(handles.axes3)
        imshow(I), title('二值化图像')
        [edgeImage,BW1]=my_sobel(B);
        axes(handles.axes4)
        imshow(edgeImage),title('sobel梯度图像');
        axes(handles.axes6)
        imshow(BW1),title('sobel边缘检测')
         
    case 11   % prewitt边缘检测
        I = rgb2gray(B);%用已有的函数进行RGB到灰度图像的转换
        axes(handles.axes3)
        imshow(I), title('二值化图像')
        [edgeImage,BW1]=my_prewitt(B);
        axes(handles.axes4)
        imshow(edgeImage),title('prewitt梯度图像');
        axes(handles.axes6)
        imshow(BW1),title('prewitt边缘检测')
        
    case 12   % laplacian边缘检测
        I = rgb2gray(B);%用已有的函数进行RGB到灰度图像的转换
        axes(handles.axes3)
        imshow(I), title('二值化图像')
        edgeImage=my_laplacian(B);
        axes(handles.axes4)
        imshow(edgeImage),title('lapacian滤波图像');
        
    case 13   % 图像分割
        C=imread("D:\数字图像处理\photo\background.jpg");
        [res,B_seg1,B_seg2]=my_seg(B);
        axes(handles.axes3);
        imshow(B),title('原图');
        axes(handles.axes4);
        imshow(C),title('背景图')
        axes(handles.axes5);
        imshow(res),title('OTSU方法二值化图像');
        axes(handles.axes6);
        imshow(B_seg1),title('分割后图像');
        %imshow(B_seg2),title('分割后图像2');

    case 14    % LBP
        % 显示原图
        axes(handles.axes3);
        imshow(B), title('原图');

        [lbpFeatures, lbpImage] = my_LBP(B);
        axes(handles.axes4);
        imshow(lbpImage, []), title('LBP特征图像');  % 显示LBP图像

        [res, B_seg1, B_seg2] = my_seg(B);
        [lbpFeatures, lbpImage2] = my_LBP(res);
        axes(handles.axes5);
        imshow(lbpImage2, []), title('提取的目标图像'); 
 
    case 15    % HOG
        axes(handles.axes3);
        imshow(B), title('原图');
        hog_image = my_HOG(B);
        axes(handles.axes4);
        imshow(hog_image, []), title('HOG特征图像');
        [res, B_seg1, B_seg2] = my_seg(B);
        hog_image_seg = my_HOG(res);
        axes(handles.axes5);
        imshow(hog_image_seg, []), title('提取的目标图像');  

end
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2) ;   % 清除坐标轴绘图
cla reset
axis off
axes(handles.axes3) ;
cla reset
axis off
axes(handles.axes4) ;
cla reset
axis off
axes(handles.axes5) ;
cla reset
axis off
axes(handles.axes6) ;
cla reset
axis off
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
end

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end
% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A= handles.A;  % 路径
B = imread(A);
%B = rgb2gray(B);
N = get(handles.popupmenu2,'Value');  % 获得噪声类型下拉框选择
switch N
    case 1
        B_noise_salt = imnoise(B,'salt & pepper'); % 加入椒盐噪声
        axes(handles.axes8)
        imshow(B_noise_salt);
        title('加椒盐噪声')
    case 2
        B_noise_gaussian = imnoise(B,'gaussian'); % 加入高斯噪声
        axes(handles.axes8)
        imshow(B_noise_gaussian);
        title('加高斯噪声')
    case 3
        B_noise_poisson = imnoise(B,'poisson'); % 加入泊松噪声
        axes(handles.axes8)
        imshow(B_noise_poisson);
        title('加泊松噪声')
end
end

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes8) ;
cla reset
axis off

end

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A= handles.A;  % 路径
B = imread(A);
%B = rgb2gray(B);
N1 = get(handles.popupmenu2,'Value'); % 获得噪声类型下拉框选择
N2 = get(handles.popupmenu3,'Value'); % 获得滤波方法下拉框选择
switch N1
    case 1   % 椒盐噪声
        switch N2
            case 1  % 双边滤波
                B_noise_salt = im2double(imnoise(B,'salt & pepper')); % 加入椒盐噪声
                B_filter=my_imfilter1(B_noise_salt);
                axes(handles.axes9)
                imshow(B_filter,[])
                title(' 加入椒盐噪声,双边滤波');

            case 2  % 巴特沃斯低通滤波
                B_noise_salt = imnoise(B,'salt & pepper'); % 加入椒盐噪声
                B_filter=my_imfilter2(B_noise_salt);
                axes(handles.axes9)
                imshow(B_filter,[])
                title(' 加入椒盐噪声,巴特沃斯低通滤波');

        end
        
    case 2  % 高斯噪声
        switch N2
            case 1  % 双边滤波
                B_noise_gaussian = imnoise(B,'gaussian'); % 加入高斯噪声
                B_filter=my_imfilter1(B_noise_gaussian);
                axes(handles.axes9)
                imshow(B_filter,[])
                title(' 加入高斯噪声,双边滤波');
                
            case 2 % 巴特沃斯低通滤波
                B_noise_gaussian = imnoise(B,'gaussian'); % 加入高斯噪声
                B_filter=my_imfilter2(B_noise_gaussian);
                axes(handles.axes9)
                imshow(B_filter,[])
                title(' 加入高斯噪声,巴特沃斯低通滤波');
        end

    case 3  % 泊松噪声
        switch N2
            case 1   % 均值滤波
                B_noise_poisson = imnoise(B,'poisson'); % 加入泊松噪声
                B_filter=my_imfilter1(B_noise_poisson);
                axes(handles.axes9)
                imshow(B_filter,[])
                title(' 加入泊松噪声,均值滤波');
                
            case 2  % 巴特沃斯低通滤波
                B_noise_poisson = imnoise(B,'poisson'); % 加入泊松噪声
                B_filter=my_imfilter2(B_noise_poisson);
                axes(handles.axes9)
                imshow(B_filter,[])
                title(' 加入泊松噪声,巴特沃斯低通滤波');
        end
        
end
end

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes9) ;
cla reset
axis off

end



% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3
end

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
end


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1) ;
cla reset
axis off
end

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
end


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
end

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
end
