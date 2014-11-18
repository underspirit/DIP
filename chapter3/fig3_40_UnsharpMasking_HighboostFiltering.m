%�����ڱκ͸������˲�(Unsharp Masking and Highboost Filtering)
clear;clc;
oriImg = imread('Fig0340(a)(dipxe_text).tif'); %ԭͼ��
%1.ģ��ԭͼ��(����ʹ��5*5,��=3�ĸ�˹ƽ���˲���)
%���ɸ�˹ģ��h
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
%��ȡ��˹ģ��ͼ��   
blurImg = uint8(myImgFilter(oriImg, h));

%2.��ȡ����ģ��
maskImg = oriImg - blurImg;

%3.�õ������ڱεĽ��
umImg = oriImg + 1 * maskImg;

%4.�õ��������˲����
hbImg = oriImg + 4.5 * maskImg; %uint8��double����ṹΪuint8

figure; imshow(oriImg);
figure; imshow(blurImg);
figure; imshow(maskImg,[]);  %��Ҫ�궨��ʾ
figure; imshow(umImg);
figure; imshow(hbImg);