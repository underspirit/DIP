oriImg = imread('Fig0309(a)(washed_out_aerial_image).tif');
resultImg3 = 1 * (double(oriImg).^3);
resultImg4 = 1 * (double(oriImg).^4);
resultImg5 = 1 * (double(oriImg).^5);
figure;imshow(oriImg);
figure;imshow(resultImg3,[]);
figure;imshow(resultImg4,[]);
figure;imshow(resultImg5,[]);