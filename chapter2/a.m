A = a;
bwimg=im2bw(A);
resize_img=[];
[srcWidth srcHeight]=size(bwimg);

dstWidth=srcWidth+100*2;
dstHeight=srcHeight+100*2;
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
    
    resize_img(i,j)=A*B*C;
    
 
    end
end

figure,imshow(bwimg);
figure,imshow(resize_img);




