function out = myImgFilter(oriImg, h)
%gaussian 对给定图像使用给定的滤波器进行滤波
%oriImg为原始图像
[s1 s2] = size(h); %滤波器大小默认为3阶矩阵
[m n] = size(oriImg);
%定义滤波器大小及滤波器矩阵
p = s1; q = s2; 
filter = h;

%填充图像
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
        temp = filter .* mask;  %!!! 进行滤波
        out(i, j) = sum(temp(:));
    end
end
out = out(r : m - 1 + r , c : n - 1 + c);   %从0填充的矩阵中取出原图
% out = uint8(out);    %不转成uint8,则out为double类型,可能含有负数
end