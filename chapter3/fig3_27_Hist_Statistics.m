oriImg = imread('Fig0327(a)(tungsten_original).tif');
figure;imshow(oriImg);  %��ʾԭͼ
[m n] = size(oriImg);

%����ȫ�־�ֵ�ͷ���
gMean = mean((oriImg(:)));
gVar = sum((oriImg(:)-mean(oriImg(:))).^2)/length(oriImg(:));

E = 4; k0 = 0.4; k1 = 0.001; k2 = 0.8;  %������,k1 = 0.001; k2 = 0.8;Ч����k1 = 0.02; k2 = 0.4;��

figure;
imshow(myHistEq(oriImg));  %��ʾ������ͼȫ��ֱ��ͼ����Ľ��
fullOriImg = uint8(zeros(m+2, n+2));   %����ͼ��ı�Ե,�Ա���оֲ�����
fullOriImg(2:m+1, 2:n+1) = oriImg;

fullOriImg2 = fullOriImg; %copyһ��,�����洢������ͼ��
for i = 2 : m+1 
    for j = 2 : n+1
        %�����Ըõ�Ϊ���ĵ�3*3����ľ�ֵ�ͷ���
        temp = fullOriImg(i-1:i+1, j-1:j+1);    %��ȡ���������һ������
        tMean = mean((temp(:)));
        tVar = sum((temp(:)-mean(temp(:))).^2)/length(temp(:));
        if(tMean <= k0 * gMean && tVar >= k1 * gVar && tVar <= k2 * gVar)
            fullOriImg2(i, j) = E * fullOriImg(i, j); 
        end
    end
end
figure;
imshow(fullOriImg2);