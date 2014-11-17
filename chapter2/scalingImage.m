function out = scallingImage(oriImg, g_min, g_max)
% scalingImage 对给定图像进行灰度值标定到给定范围
% oriImg, g_min, g_max 分别表示原图像,标定的下限和上限
%返回值是uint8类型
K = g_max - g_min;
fm = oriImg - min(oriImg(:));
out = g_min + (fm ./ max(fm(:))) * K;
out = uint8(out);
end