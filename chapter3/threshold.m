function out = threshold(oriImg, t)
%threshold 对给定图进行阈值处理为黑白图像,t为阈值
gt = oriImg > t;
out = gt;

end