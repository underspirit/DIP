oriImg = imread('Fig0230(a)(dental_xray).tif'); %ԭͼ��
roiImg = imread('Fig0230(b)(dental_xray_mask).tif'); %ʹ�������������ݵ�ROIģ��(��ɫΪ1,��ɫΪ0)
%���
out = oriImg .* uint8(logical(roiImg));  %��Ҫ��logicalת��Ϊint������int����
figure;imshow(oriImg);
figure;imshow(roiImg);
figure;imshow(out); 