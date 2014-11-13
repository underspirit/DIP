oriImg = imread('Fig0326(a)(embedded_square_noisy_512).tif');
figure;imshow(oriImg);  %显示原图
[m n] = size(oriImg);
figure;
imshow(myHistEq(oriImg));  %显示对整个图全局直方图均衡的结果
fullOriImg = uint8(zeros(m+2, n+2));   %扩充图像的边缘,以便进行局部处理
fullOriImg(2:m+1, 2:n+1) = oriImg;
fullOriImg2 = fullOriImg; %copy一份,用来存储处理后的图像
for i = 2 : m+1 %执行时间很长!!!!!!!!!
    for j = 2 : n+1
        %计算以该点为中心的邻域的直方图均衡
        temp = fullOriImg(i-1:i+1, j-1:j+1);    %提取出待处理的一个邻域
        fullOriImg2(i-1:i+1, j-1:j+1) = myHistEq(temp);  %对该邻域进行局部直方图均衡
    end
end
figure;
imshow(fullOriImg2);