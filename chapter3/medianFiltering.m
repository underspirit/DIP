function out = medianFiltering(oriImg, s)
%medianFiltering 对给定图进行中值滤波
%oriImg为原始图像,s为滤波器大小

[m n] = size(oriImg);
%填充图像
p = s; q = s; 
fullImg = zeros(m + (p-1), n + (q-1));
out = fullImg;
r = (p+1) / 2; c = (q+1) / 2;   %求出原图矩阵在填充图中的起始坐标
fullImg(r : m - 1 + r , c : n - 1 + c) = oriImg;
size(fullImg)

temp = zeros(p, q);
%在每一个位置进行滤波操作
for i = r :  m - 1 + r
    for j = c : n - 1 + c
        %计算出滤波器覆盖区域的起始坐标
        nr = i - (p - 1) / 2; nc = j - (q - 1) / 2;
        mask = fullImg(nr : i + (p - 1) / 2 , nc : j + (q - 1) / 2);    %提取出当前待滤波的一个小区域 
        out(i, j) = median(mask(:));
    end
end
out = uint8(out);
end