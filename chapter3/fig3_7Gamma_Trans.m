oriImg = imread('Fig0307(a)(intensity_ramp).tif');
resultImg = 1 * (double(oriImg).^0.4);
figure;imshow(oriImg);
figure;imshow(resultImg,[]);