oriImg = imread('Fig0335(a)(ckt_board_saltpep_prob_pt05).tif'); %ԭͼ��
out1 = SmoothingLinearFilter(oriImg, 3);  %�Ƚ���3*3��ƽ����ֵ�˲�
out2 = medianFiltering(oriImg, 3);  %����3*3����ֵ�˲�

figure;
subplot(131);imshow(oriImg);
subplot(132);imshow(out1);
subplot(133);imshow(out2);