%利用公式 s = L - 1 - r将图像反转
oriImg = imread('Fig0304(a)(breast_digital_Xray).tif');
resultImg = 256 - 1 - oriImg;
figure;imshow(oriImg);
figure;imshow(resultImg);