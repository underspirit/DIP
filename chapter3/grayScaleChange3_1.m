function out = grayScaleChange3_1(oriImg, g_min, g_max)
%grayScaleChange3_1 将原始图像的灰度级扩展到[g_min g_max]上去,习题3.1
oriImg = double(oriImg);
out = g_min + (oriImg - min(oriImg(:))) * ((g_max - g_min) / (max(oriImg(:)) - min(oriImg(:))));
% out = uint8(out);
end