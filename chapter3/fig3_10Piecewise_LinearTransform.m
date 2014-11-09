oriImg = imread('Fig0310(b)(washed_out_pollen_image).tif');
%--------构造分段线性函数
%确定两个转折点
p1.x = min(oriImg(:));  p1.y = 0;
p1.x = max(oriImg(:));  p2.y = 255;




resultImg06 = 1 * (double(oriImg).^0.6);
resultImg04 = 1 * (double(oriImg).^0.4);
resultImg03 = 1 * (double(oriImg).^0.3);
figure;imshow(oriImg);
figure;imshow(resultImg06,[]);
figure;imshow(resultImg04,[]);
figure;imshow(resultImg03,[]);
ori