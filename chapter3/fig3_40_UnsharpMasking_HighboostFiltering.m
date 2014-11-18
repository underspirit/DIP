%非锐化掩蔽和高提升滤波(Unsharp Masking and Highboost Filtering)
clear;clc;
oriImg = imread('Fig0340(a)(dipxe_text).tif'); %原图像
%1.模糊原图像(这里使用5*5,σ=3的高斯平滑滤波器)
%生成高斯模板h
p2 = [3 3]; p3 =  3;
siz   = (p2-1)/2;
std   = p3;

[x,y] = meshgrid(-siz(2):siz(2),-siz(1):siz(1));
arg   = -(x.*x + y.*y)/(2*std*std);

h = exp(arg);
h(h<eps*max(h(:))) = 0;

sumh = sum(h(:));
if sumh ~= 0,
h  = h/sumh;
end;
%获取高斯模糊图像   
blurImg = uint8(myImgFilter(oriImg, h));

%2.获取非锐化模板
maskImg = oriImg - blurImg;

%3.得到非锐化掩蔽的结果
umImg = oriImg + 1 * maskImg;

%4.得到高提升滤波结果
hbImg = oriImg + 4.5 * maskImg; %uint8与double运算结构为uint8

figure; imshow(oriImg);
figure; imshow(blurImg);
figure; imshow(maskImg,[]);  %需要标定显示
figure; imshow(umImg);
figure; imshow(hbImg);