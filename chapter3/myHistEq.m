function out = myHistEq(oriImg)
%myHistEq 自写的直方图均衡

[m n] = size(oriImg);
out = uint8(ones([m n]));
%首先统计出原图的灰度分布
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

