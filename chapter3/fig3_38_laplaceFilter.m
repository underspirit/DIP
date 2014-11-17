clear;clc;
oriImg = imread('Fig0338(a)(blurry_moon).tif'); %原图像
outa = laplaceFiltering(oriImg, 'a');  %进行普通模板滤波
outb = laplaceFiltering(oriImg, 'b');  %进行含有对角项的模板滤波

%标定outb的灰度级
outb_Scaled = uint8(scallingImage(outb, 0, 255));

%原图与a处理过的图像叠加
outa_add = double(oriImg) - outa;    %因为laplace模板使用的是中间系数为负数,所以是减法

%注意,滤波后的图像outa和outb中都是double类型,包含了负值,应该将oriImg转成double与滤波后的图像运算
%而不是将outa/outb转成uint8再与oriImg运算,因为这样会首先将outa/outb中的负值变成0

%原图与b处理过的图像叠加
outb_add = double(oriImg) - outb;  

% outx_add此时包含负数,最大值也超过了255,可以对其进行灰度级标定(也可直接在imshow中使用 []),但是图像变暗了
%,如果不标定直接转uint8,则小于0的变成0,大于255的为255
% outa_add = uint8(scallingImage(outa_add, 0, 255));
% outb_add = uint8(scallingImage(outb_add, 0, 255));   

figure;
subplot(151);imshow(oriImg);
subplot(152);imshow(uint8(outb));
subplot(153);imshow(outb_Scaled);
subplot(154);imshow(uint8(outa_add));
subplot(155);imshow(uint8(outb_add));