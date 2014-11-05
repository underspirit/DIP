function out = nearestInter(a,r,c)
%   利用最邻近算法对一个指定图像进行缩放操作
%   nearestInterpolation(a,r,c):
%   a为图像的像素矩阵,r为目标图像的行数,c为列数
    [m,n] = size(a);    
    tr = m/r; tc = n/c; %计算行和列的缩放比例
    out = uint8(zeros(r,c));
    for i = 1:r
        for j = 1:c
            x = ceil(i*tr); y = ceil(j*tc); %对目标图像的每一个像素,按比例缩放求出原图对象的像素点,使用ceil向上取整,因为x,y可能为0.x
            out(i,j) = a(x,y);  %将原图该点像素值赋予目标像素点
        end
    end
end