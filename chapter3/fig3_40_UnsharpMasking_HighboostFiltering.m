%非锐化掩蔽和高提升滤波(Unsharp Masking and Highboost Filtering)
clear;clc;
oriImg = imread('Fig0340(a)(dipxe_text).tif'); %原图像
%1.模糊原图像(这里使用5*5,σ=3的高斯平滑滤波器)
blurImg = 