clear;clc;
oriImg = imread('Fig0338(a)(blurry_moon).tif'); %ԭͼ��
outa = laplaceFiltering(oriImg, 'a');  %������ͨģ���˲�
outb = laplaceFiltering(oriImg, 'b');  %���к��жԽ����ģ���˲�

%�궨outb�ĻҶȼ�
outb_Scaled = uint8(scallingImage(outb, 0, 255));

%ԭͼ��a�������ͼ�����
outa_add = double(oriImg) - outa;    %��Ϊlaplaceģ��ʹ�õ����м�ϵ��Ϊ����,�����Ǽ���

%ע��,�˲����ͼ��outa��outb�ж���double����,�����˸�ֵ,Ӧ�ý�oriImgת��double���˲����ͼ������
%�����ǽ�outa/outbת��uint8����oriImg����,��Ϊ���������Ƚ�outa/outb�еĸ�ֵ���0

%ԭͼ��b�������ͼ�����
outb_add = double(oriImg) - outb;  

% outx_add��ʱ��������,���ֵҲ������255,���Զ�����лҶȼ��궨(Ҳ��ֱ����imshow��ʹ�� []),����ͼ��䰵��
%,������궨ֱ��תuint8,��С��0�ı��0,����255��Ϊ255
% outa_add = uint8(scallingImage(outa_add, 0, 255));
% outb_add = uint8(scallingImage(outb_add, 0, 255));   

figure;
subplot(151);imshow(oriImg);
subplot(152);imshow(uint8(outb));
subplot(153);imshow(outb_Scaled);
subplot(154);imshow(uint8(outa_add));
subplot(155);imshow(uint8(outb_add));