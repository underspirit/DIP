oriImg = imread('Fig0327(a)(tungsten_original).tif');
figure;imshow(oriImg);  %显示原图
[m n] = size(oriImg);

%计算全局均值和方差
gMean = mean((oriImg(:)));
gVar = sum((oriImg(:)-mean(oriImg(:))).^2)/length(oriImg(:));

E = 4; k0 = 0.4; k1 = 0.001; k2 = 0.8;  %经测试,k1 = 0.001; k2 = 0.8;效果比k1 = 0.02; k2 = 0.4;好

figure;
imshow(myHistEq(oriImg));  %显示对整个图全局直方图均衡的结果
fullOriImg = uint8(zeros(m+2, n+2));   %扩充图像的边缘,以便进行局部处理
fullOriImg(2:m+1, 2:n+1) = oriImg;

fullOriImg2 = fullOriImg; %copy一份,用来存储处理后的图像
for i = 2 : m+1 
    for j = 2 : n+1
        %计算以该点为中心的3*3邻域的均值和方差
        temp = fullOriImg(i-1:i+1, j-1:j+1);    %提取出待处理的一个邻域
        tMean = mean((temp(:)));
        tVar = sum((temp(:)-mean(temp(:))).^2)/length(temp(:));
        if(tMean <= k0 * gMean && tVar >= k1 * gVar && tVar <= k2 * gVar)
            fullOriImg2(i, j) = E * fullOriImg(i, j); 
        end
    end
end
figure;
imshow(fullOriImg2);