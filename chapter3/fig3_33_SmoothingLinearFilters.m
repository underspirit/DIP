oriImg = imread('Fig0333(a)(test_pattern_blurring_orig).tif'); %Ô­Í¼Ïñ
out3 = SmoothingLinearFilter(oriImg, 3);
out5 = SmoothingLinearFilter(oriImg, 5);
out9 = SmoothingLinearFilter(oriImg, 9);
out15 = SmoothingLinearFilter(oriImg, 15);
out35 = SmoothingLinearFilter(oriImg, 35);

figure;
subplot(231);imshow(oriImg);
subplot(232);imshow(out3);
subplot(233);imshow(out5)
subplot(234);imshow(out9)
subplot(235);imshow(out15)
subplot(236);imshow(out35)
