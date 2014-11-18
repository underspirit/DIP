%ʹ�û�Ͽռ���ǿ��
clear;clc;
oriImg = imread('Fig0343(a)(skeleton_orig).tif'); %ԭͼ��
%1.��Laplace�˲�(b)ģ��,����Ϊ������ģ��
laplaceImg = -1 * laplaceFiltering(oriImg, 'b');    %��ʱģ������Ϊ����,����� -1 ��Ϊ ��

%2.ԭͼ��laplaceͼ���
addLapImg = double(oriImg) + laplaceImg;    %ģ������Ϊ��,���������.  Ϊëģ������Ϊ������������???!

%3.sobel���Ӵ���
outx = sobelFilter(oriImg, 'x');
outy = sobelFilter(oriImg, 'y');
sobelImg = abs(outx) + abs(outy);   %����ֵ��ӵ��ݶȷ�ֵ

%ʹ��5*5�ľ�ֵ�˲�sobelͼ��
h = ones(5, 5) ./ 25;
avgImg = myImgFilter(sobelImg, h);


figure; imshow(oriImg);
figure; imshow(uint8(scalingImage(laplaceImg, 0, 255)));
figure; imshow(uint8(addLapImg));
figure; imshow(uint8((sobelImg)));
%������󵽵����ñ궨����ͼƬ,����ֱ��ת��uint8???!!! ����ֱ��ת��uint8������ͼ��������
% figure; imshow(uint8(scalingImage(sobelImg, 0, 255)));    
figure; imshow(uint8((avgImg)));
% figure; imshow(uint8(scalingImage(avgImg, 0, 255)));