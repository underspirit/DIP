function out = medianFiltering(oriImg, s)
%medianFiltering �Ը���ͼ������ֵ�˲�
%oriImgΪԭʼͼ��,sΪ�˲�����С

[m n] = size(oriImg);
%���ͼ��
p = s; q = s; 
fullImg = zeros(m + (p-1), n + (q-1));
out = fullImg;
r = (p+1) / 2; c = (q+1) / 2;   %���ԭͼ���������ͼ�е���ʼ����
fullImg(r : m - 1 + r , c : n - 1 + c) = oriImg;
size(fullImg)

temp = zeros(p, q);
%��ÿһ��λ�ý����˲�����
for i = r :  m - 1 + r
    for j = c : n - 1 + c
        %������˲��������������ʼ����
        nr = i - (p - 1) / 2; nc = j - (q - 1) / 2;
        mask = fullImg(nr : i + (p - 1) / 2 , nc : j + (q - 1) / 2);    %��ȡ����ǰ���˲���һ��С���� 
        out(i, j) = median(mask(:));
    end
end
out = uint8(out);
end