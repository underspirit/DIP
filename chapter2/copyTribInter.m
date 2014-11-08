function resize_img = copyTribInter(a,dstWidth,dstHeight)
%COPYTRIBINTER 利用三次内插算法对一个指定图像进行缩放操作
%copyTribInter(a,r,c):
%a为图像的像素矩阵,r为目标图像的行数,c为列数
bwimg = a;
[srcWidth srcHeight]=size(bwimg);
resize_img=zeros(dstWidth,dstHeight);
A=[];B=[];C=[];
% 像素变化公式计算公式
for i=3:dstWidth-2
    for j=3:dstHeight-2
    src_i=i*(srcWidth/dstWidth);
    src_j=j*(srcHeight/dstHeight);
    src_ii=fix(src_i); % 整数部分
    src_iu=src_i - src_ii; % 小数部分
    src_jj=fix(src_j);
    src_jv=src_j - src_jj;
    
    A=[ cubic_factor(src_iu+1) cubic_factor(src_iu) cubic_factor(src_iu-1) cubic_factor(src_iu-2) ];
    C=[ cubic_factor(src_jv+1); cubic_factor(src_jv); cubic_factor(src_jv-1); cubic_factor(src_jv-2) ];
    B=[ bwimg(src_ii -1,src_jj -1) bwimg(src_ii-1,src_jj) bwimg(src_ii-1,src_jj+1) bwimg(src_ii-1,src_jj+2);
        bwimg(src_ii,src_jj-1) bwimg(src_ii,src_jj) bwimg(src_ii,src_jj+1) bwimg(src_ii,src_jj+2);
        bwimg(src_ii+1,src_jj-1) bwimg(src_ii+1,src_jj) bwimg(src_ii+1,src_jj+1) bwimg(src_ii+1,src_jj+2);
        bwimg(src_ii+2,src_jj-1) bwimg(src_ii+2,src_jj) bwimg(src_ii+2,src_jj+1) bwimg(src_ii+2,src_jj+2) ];
    resize_img(i,j)=uintA*B*C;
    end
end
% dstimg=imresize(srcimg,4,'bicubic'); % matlab库函数，调用imresize可以重新生成不同尺寸的图片

end

    function S=cubic_factor(x)
        if 0<=abs(x)<1
            S=1-2.*abs(x).^2+abs(x).^3;
        elseif 1<=abs(x)<2
            S=4-8.*abs(x)+5.*abs(x).^2-abs(x).^3;
        else
            S=0;
        end
    end


