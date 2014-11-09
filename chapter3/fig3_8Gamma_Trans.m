oriImg = imread('Fig0308(a)(fractured_spine).tif');
resultImg06 = 1 * (double(oriImg).^0.6);
resultImg04 = 1 * (double(oriImg).^0.4);
resultImg03 = 1 * (double(oriImg).^0.3);
figure;imshow(oriImg);
figure;imshow(resultImg06,[]);
figure;imshow(resultImg04,[]);
figure;imshow(resultImg03,[]);