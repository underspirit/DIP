

delta_x=str2double(inputdlg('请输入向右平移量', 'INPUT scale factor', 1, {'-60'}));   %负数为向左      
delta_y=str2double(inputdlg('请输入向下平移量', 'INPUT scale factor', 1, {'-89'}));   %负数为向上
img=imread('Fig0222(b)(cameraman).tif'); %这里v为原图像的高度，u为原图像的宽度
[v u]=size(img);       %这里y为变换后图像高度，x为变换后图像宽度
imgn=zeros(v+abs(delta_y),u+abs(delta_x));
rot=[1 0 0;0 1 0;delta_y delta_x 1]; 
inv_rot=inv(rot);
pix1=[1 1 1]*rot;  %pix1(1),pix1(2)分别为变换后图像的左上角的y,x
pix4=[v u 1]*rot;  %pix4(1),pix4(2)分别为变换后图像的右下角的y,x
%%向右下方移动
if delta_x>=0 && delta_y>=0
    for y=pix1(1):pix4(1)
        for x=pix1(2):pix4(2)
            pix=[y x 1]*inv_rot;      
        if pix(1)>=0.5 && pix(2)>=0.5 && pix(1)<=v && pix(2)<=u
                imgn(y,x)=img(round(pix(1)),round(pix(2)));        
            end
        end
    end
end 
%%向左下方移动
if delta_x<0 && delta_y>=0
    for y=pix1(1):pix4(1)
        for x=pix1(2):pix4(2)
            pix=[y x 1]*inv_rot;      
         if pix(1)>=0.5 && pix(2)>=0.5 && pix(1)<=v && pix(2)<=u
                imgn(y,x-delta_x)=img(round(pix(1)),round(pix(2)));        
            end
        end
    end
end
%%向左上方移动
if delta_x<0 && delta_y<0
    for y=pix1(1):pix4(1)
        for x=pix1(2):pix4(2)
            pix=[y x 1]*inv_rot;      
         if pix(1)>=0.5 && pix(2)>=0.5 && pix(1)<=v && pix(2)<=u
             imgn(y-delta_y,x-delta_x)=img(round(pix(1)),round(pix(2)));        
            end
        end
    end
end 
%%向右上方移动
if delta_x>=0 && delta_y<0
    for y=pix1(1):pix4(1)
        for x=pix1(2):pix4(2)
            pix=[y x 1]*inv_rot;      
         if pix(1)>=0.5 && pix(2)>=0.5 && pix(1)<=v && pix(2)<=u                imgn(y-delta_y,x)=img(round(pix(1)),round(pix(2)));        
            end
        end
    end
end
subplot(2,3,4);
imshow(uint8(imgn));imwrite(uint8(imgn),'平移.bmp','bmp') ;  
title('平移');