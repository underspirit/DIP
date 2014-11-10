oriImg = imread('Fig0310(b)(washed_out_pollen_image).tif');
[m n] = size(oriImg);
resultImg = zeros([m n]);
%--------构造分段线性函数
%确定两个转折点
avg = mean(oriImg(:));
p1.x = double(min(oriImg(:)));  p1.y = 0;
p2.x = double(max(oriImg(:)));  p2.y = 255;
%利用线性性质成比例,求出目标图像灰度级
for i = 1 : m
    for j = 1 : n
        if(oriImg(i, j) <= p1.x)
            %使用内置的线性插值算法,但是很慢
%             resultImg(i, j) = interp1([0 p1.x], [0 0], double(oriImg(i, j)));
            resultImg(i, j) = p1.y - (p1.y - 0) * (p1.x - double(oriImg(i, j))) / (p1.x - 0);
        elseif(oriImg(i, j) > p1.x && oriImg(i, j) <= p2.x)
%             resultImg(i, j) = interp1([p1.x p2.x], [p1.y p2.y], double(oriImg(i, j)));
            resultImg(i, j) = p2.y - (p2.y - p1.y) * (p2.x - double(oriImg(i, j))) / (p2.x - p1.x);
        elseif(oriImg(i, j) > p2.x)
%             resultImg(i, j) = interp1([p2.x 255], [p2.y 255], double(oriImg(i, j)));
            resultImg(i, j) = 255 - (255 - p2.y) * (255 - double(oriImg(i, j))) / (255 - p2.x);
        end
    end
end

figure;
subplot(1,2,1);imshow(oriImg);
resultImg = uint8(resultImg);
subplot(1,2,2);imshow(resultImg);