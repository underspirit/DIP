oriImg = imread('Fig0232(a)(partial_body_scan).tif'); %ԭͼ��
[m n] = size(oriImg);
complementarySet = (2^8 - 1) - oriImg; %����ͼ��
meanValue = 3 * mean(oriImg(:));    %���ԭͼ�Ҷ�ƽ��ֵ��3��
A  = oriImg;
for i = 1 : m   %��oriImg�볣��ͼ��Ĳ���
    for j = 1 : n
        if(A(i,j) < meanValue)  %С��3meanValue������ʾΪ3meanValue
            A(i,j) = meanValue;
        end
    end
end
figure;imshow(oriImg);
figure;imshow(complementarySet);
figure;imshow(A);
