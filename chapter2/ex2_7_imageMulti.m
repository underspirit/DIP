oriImg = imread('Fig0229(a)(tungsten_filament_shaded).tif'); %原图像
shadowImg = imread('Fig0229(b)(tungsten_sensor_shading).tif'); %阴影图像
%阴影的倒数与原图相乘
out = double(oriImg) .* (1 ./ double(shadowImg)); %转换为double进行小数运算
figure;imshow(oriImg);
figure;imshow(shadowImg);
figure;imshow(out);  %直接用out的0`1的范围显示图像,也可使用im2uint8转换为uint8上的0`255