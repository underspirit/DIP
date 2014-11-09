oriImg = imread('Fig0235(c)(kidney_original).tif'); %ԭͼ��
[m n] = size(oriImg);
%���������С���������
p = 41; q =41; 
neighbor = ones(p, q);
%���ͼ��
fullImg = zeros(m + (p-1), n + (q-1));
out = fullImg;
r = (p+1) / 2; c = (q+1) / 2;   %���ԭͼ���������ͼ�е���ʼ����
fullImg(r : m - 1 + r , c : n - 1 + c) = oriImg;
size(fullImg)
%��ÿһ��λ�ý����������
temp = zeros(p, q);
for i = r :  m - 1 + r
    for j = c : n - 1 + c
        %��������򸲸��������ʼ����
        nr = i - (p - 1) / 2; nc = j - (q - 1) / 2;
        mask = fullImg(nr : i + (p - 1) / 2 , nc : j + (q - 1) / 2);
        temp = neighbor .* mask;
        out(i, j) = sum(temp(:));
    end
end
out = out(r : m - 1 + r , c : n - 1 + c);
out = uint8(out ./ (p * q));    %����ƽ��ֵ

figure;imshow(oriImg);
figure;imshow(out);