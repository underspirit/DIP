oriImg = imread('Fig0326(a)(embedded_square_noisy_512).tif');
figure;imshow(oriImg);  %��ʾԭͼ
[m n] = size(oriImg);
figure;
imshow(myHistEq(oriImg));  %��ʾ������ͼȫ��ֱ��ͼ����Ľ��
fullOriImg = uint8(zeros(m+2, n+2));   %����ͼ��ı�Ե,�Ա���оֲ�����
fullOriImg(2:m+1, 2:n+1) = oriImg;
fullOriImg2 = fullOriImg; %copyһ��,�����洢������ͼ��
for i = 2 : m+1 %ִ��ʱ��ܳ�!!!!!!!!!
    for j = 2 : n+1
        %�����Ըõ�Ϊ���ĵ������ֱ��ͼ����
        temp = fullOriImg(i-1:i+1, j-1:j+1);    %��ȡ���������һ������
        fullOriImg2(i-1:i+1, j-1:j+1) = myHistEq(temp);  %�Ը�������оֲ�ֱ��ͼ����
    end
end
figure;
imshow(fullOriImg2);