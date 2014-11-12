a1 = imread('Fig0316(4)(bottom_left).tif');
a2 = imread('Fig0316(1)(top_left).tif');
a3 = imread('Fig0316(2)(2nd_from_top).tif');
a4 = imread('Fig0316(3)(third_from_top).tif');

figure; %显示各个图像及其直方图
subplot(4,2,1);imshow(a1);title('暗图像');subplot(4,2,2);imhist(a1);
subplot(4,2,3);imshow(a2);title('亮图像图像');subplot(4,2,4);imhist(a2);
subplot(4,2,5);imshow(a3);title('低对比度图像');subplot(4,2,6);imhist(a3);
subplot(4,2,7);imshow(a4);title('高对比度图像');subplot(4,2,8);imhist(a4);



%使用自己写的histEq函数

figure; %显示原图像已经直方图均衡后的图像和直方图
a11 = myHistEq(a1);
subplot(4,3,1);imshow(a1);title('暗图像');subplot(4,3,2);imshow(a11);subplot(4,3,3);imhist(a11);

a22 = myHistEq(a2);
subplot(4,3,4);imshow(a2);title('亮图像');subplot(4,3,5);imshow(a11);subplot(4,3,6);imhist(a22);

a33 = myHistEq(a3);
subplot(4,3,7);imshow(a3);title('低对比度图像');subplot(4,3,8);imshow(a33);subplot(4,3,9);imhist(a33);

a44 = myHistEq(a4);
subplot(4,3,10);imshow(a4);title('高对比度图像');subplot(4,3,11);imshow(a44);subplot(4,3,12);imhist(a44);


