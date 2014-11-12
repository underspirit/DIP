function out = myHistEq(oriImg)
%myHistEq ��д��ֱ��ͼ����

[m n] = size(oriImg);
out = uint8(ones([m n]));
%����ͳ�Ƴ�ԭͼ�ĻҶȷֲ�
[counts x] = imhist(oriImg);

L = 256;

y = zeros(L);

for i = 0 : L - 1
    y(i + 1) = round((L - 1)/(m * n) * sum(counts(1:i+1))) ;
end
y = uint8(y);

for i = 1 : m
    for j = 1 : n
        out(i, j) = y(oriImg(i, j) + 1);
    end
end

