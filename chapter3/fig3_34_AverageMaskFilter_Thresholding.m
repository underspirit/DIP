oriImg = imread('Fig0334(a)(hubble-original).tif'); %ԭͼ��
out15 = SmoothingLinearFilter(oriImg, 15);  %�Ƚ��о�ֵ�˲�
outt = threshold(out15, max(out15(:)) * 0.25);  %������ֵ����

figure;
subplot(131);imshow(oriImg);
subplot(132);imshow(out15);
subplot(133);imshow(outt);