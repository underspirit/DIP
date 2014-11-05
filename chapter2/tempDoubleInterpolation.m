function resize_img = tempDoubleInterpolation(A,dstWidth,dstHeight)
%TEMPDOUBLEINTERPOLATION 利用双线性内插算法对一个指定图像进行缩放操作
%tempDoubleInterpolation(a,r,c):
%a为图像的像素矩阵,r为目标图像的行数,c为列数
bwimg = A;
% bwimg=im2bw(A);
resize_img=[];
[srcWidth srcHeight]=size(bwimg);

resize_img=zeros(dstWidth,dstHeight);

% 像素变化公式计算公式
for i=1:dstWidth-1
    for j=1:dstHeight-1
    src_i=i*(srcWidth/dstWidth);
    src_j=j*(srcHeight/dstHeight);
    src_ii=fix(src_i);
    src_iu=src_i - src_ii; % none fix part
    src_jj=fix(src_j);
    src_jv=src_j - src_jj;
    if src_ii == 0 
        src_ii=src_ii+1;   
    end
    if src_jj ==0 
        src_jj=src_jj+1;
    end
    resize_img(i,j)=(1-src_iu)*(1-src_jv)*bwimg(src_ii,src_jj)+(1-src_iu)*src_jv*bwimg(src_ii,src_jj+1)+src_iu*(1-src_jv)*bwimg(src_ii+1,src_jj)+src_iu*src_jv*bwimg(src_ii+1,src_jj+1);
    resize_img = uint8(resize_img);
    end
end
