oriImg = imread('Fig0232(a)(partial_body_scan).tif'); %原图像
[m n] = size(oriImg);
complementarySet = (2^8 - 1) - oriImg; %补集图像
meanValue = 3 * mean(oriImg(:));    %求出原图灰度平均值的3倍
A  = oriImg;
for i = 1 : m   %求oriImg与常熟图像的并集
    for j = 1 : n
        if(A(i,j) < meanValue)  %小于3meanValue的则显示为3meanValue
            A(i,j) = meanValue;
        end
    end
end
figure;imshow(oriImg);
figure;imshow(complementarySet);
figure;imshow(A);
