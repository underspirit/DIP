oriImg = imread('Fig0230(a)(dental_xray).tif'); %原图像
roiImg = imread('Fig0230(b)(dental_xray_mask).tif'); %使用填充物隔离牙齿的ROI模板(白色为1,黑色为0)
%相乘
out = oriImg .* uint8(logical(roiImg));  %需要将logical转换为int才能与int运算
figure;imshow(oriImg);
figure;imshow(roiImg);
figure;imshow(out); 