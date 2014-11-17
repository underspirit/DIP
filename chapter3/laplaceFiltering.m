function out = laplaceFiltering(oriImg, type)
%laplaceFiltering �Ը���ͼ�����laplace�˲�
%oriImgΪԭʼͼ��
s = 3; %�˲�����СĬ��Ϊ3�׾���
[m n] = size(oriImg);
%�����˲�����С���˲�������
p = s; q = s; 
if(type ==  'a')
    %ʹ����ͨģ��
    filter = [0 1 0; 1 -4 1; 0 1 0];
elseif(type == 'b')
    %ʹ�ô��Խ����ģ��
    filter = [1 1 1; 1 -8 1; 1 1 1];
else
    error('������a����b');
end

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
% out = uint8(out);    %��ת��uint8,��outΪdouble����,���и���
end