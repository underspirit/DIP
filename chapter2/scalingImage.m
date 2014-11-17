function out = scallingImage(oriImg, g_min, g_max)
% scalingImage �Ը���ͼ����лҶ�ֵ�궨��������Χ
% oriImg, g_min, g_max �ֱ��ʾԭͼ��,�궨�����޺�����
%����ֵ��uint8����
K = g_max - g_min;
fm = oriImg - min(oriImg(:));
out = g_min + (fm ./ max(fm(:))) * K;
out = uint8(out);
end