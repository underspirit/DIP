oriImg = imread('Fig0229(a)(tungsten_filament_shaded).tif'); %ԭͼ��
shadowImg = imread('Fig0229(b)(tungsten_sensor_shading).tif'); %��Ӱͼ��
%��Ӱ�ĵ�����ԭͼ���
out = double(oriImg) .* (1 ./ double(shadowImg)); %ת��Ϊdouble����С������
figure;imshow(oriImg);
figure;imshow(shadowImg);
figure;imshow(out);  %ֱ����out��0`1�ķ�Χ��ʾͼ��,Ҳ��ʹ��im2uint8ת��Ϊuint8�ϵ�0`255