function out = grayScaleChange3_1(oriImg, g_min, g_max)
%grayScaleChange3_1 ��ԭʼͼ��ĻҶȼ���չ��[g_min g_max]��ȥ,ϰ��3.1
oriImg = double(oriImg);
out = g_min + (oriImg - min(oriImg(:))) * ((g_max - g_min) / (max(oriImg(:)) - min(oriImg(:))));
% out = uint8(out);
end