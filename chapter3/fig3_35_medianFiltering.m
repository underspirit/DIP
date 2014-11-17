oriImg = imread('Fig0335(a)(ckt_board_saltpep_prob_pt05).tif'); %原图像
out1 = SmoothingLinearFilter(oriImg, 3);  %先进行3*3的平滑均值滤波
out2 = medianFiltering(oriImg, 3);  %进行3*3的中值滤波

figure;
subplot(131);imshow(oriImg);
subplot(132);imshow(out1);
subplot(133);imshow(out2);