function out = myImgFilter(oriImg, h)
%gaussian �Ը���ͼ��ʹ�ø������˲��������˲�
%oriImgΪԭʼͼ��
[s1 s2] = size(h); %�˲�����СĬ��Ϊ3�׾���
[m n] = size(oriImg);
%�����˲�����С���˲�������
p = s1; q = s2; 
filter = h;

%���ͼ��
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
        temp = filter .* mask;  %!!! �����˲�
        out(i, j) = sum(temp(:));
    end
end
out = out(r : m - 1 + r , c : n - 1 + c);   %��0���ľ�����ȡ��ԭͼ
% out = uint8(out);    %��ת��uint8,��outΪdouble����,���ܺ��и���
end