clc;
clear all;
A = imread('Fig0314(a)(100-dollars).tif');
% ��ʾԭʼͼ��
figure;
subplot(3,3,1);
imshow(A);title('ԭʼͼ��');
% ��ʾ8��λƽ��ͼ��

for i=8:-1:1
    eval(['A_bitplane' num2str(i) '= bitshift(bitget(A,' num2str(i) '),' num2str(i) '-1);']);
    subplot(3, 3, 9-i+1);
    eval(['imshow(A_bitplane' num2str(i) ');']);
    title(['λƽ�� ' num2str(i)]);
end 
%����������ƽ�����
A_bitplane87 = A_bitplane7 + A_bitplane8;
A_bitplane876 =A_bitplane6 + A_bitplane7 + A_bitplane8;
A_bitplane8765 = A_bitplane5 + A_bitplane6 + A_bitplane7 + A_bitplane8;
figure;
subplot(3, 1, 1);imshow(A_bitplane87);
subplot(3, 1, 2);imshow(A_bitplane876);
subplot(3, 1, 3);imshow(A_bitplane8765);

%���ñ���ƽ��ʵ��ˮӡ
mask = imread('mask.tif'); %Ϊ��ֵͼ 0 1,�ڵ�һ������ƽ��
sum = A_bitplane87 + uint8(mask);
A_bitplaneMask = bitshift(bitget(sum,1), 0); %�Ӻϳ�ͼ�л�ȡ��һ������ƽ��
figure;
subplot(211);imshow(sum);
subplot(212);imshow(A_bitplaneMask, []);
