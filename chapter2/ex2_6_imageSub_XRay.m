mask = imread('Fig0228(a)(angiography_mask_image).tif'); %模板图像
live = imread('Fig0228(b)(angiography_live_ image).tif'); %活体图像
sub = mask - live;
figure;imshow(mask);
figure;imshow(live);
figure;imshow(sub);
tSub = imadjust(sub); %对比度增强
figure;imshow(tSub);