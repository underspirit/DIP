oriImg = imread('Fig0334(a)(hubble-original).tif'); %原图像
out15 = SmoothingLinearFilter(oriImg, 15);  %先进行均值滤波
outt = threshold(out15, max(out15(:)) * 0.25);  %进行阈值处理

figure;
subplot(131);imshow(oriImg);
subplot(132);imshow(out15);
subplot(133);imshow(outt);