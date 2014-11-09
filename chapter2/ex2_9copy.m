

delta_x=str2double(inputdlg('����������ƽ����', 'INPUT scale factor', 1, {'-60'}));   %����Ϊ����      
delta_y=str2double(inputdlg('����������ƽ����', 'INPUT scale factor', 1, {'-89'}));   %����Ϊ����
img=imread('Fig0222(b)(cameraman).tif'); %����vΪԭͼ��ĸ߶ȣ�uΪԭͼ��Ŀ��
[v u]=size(img);       %����yΪ�任��ͼ��߶ȣ�xΪ�任��ͼ����
imgn=zeros(v+abs(delta_y),u+abs(delta_x));
rot=[1 0 0;0 1 0;delta_y delta_x 1]; 
inv_rot=inv(rot);
pix1=[1 1 1]*rot;  %pix1(1),pix1(2)�ֱ�Ϊ�任��ͼ������Ͻǵ�y,x
pix4=[v u 1]*rot;  %pix4(1),pix4(2)�ֱ�Ϊ�任��ͼ������½ǵ�y,x
%%�����·��ƶ�
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
%%�����·��ƶ�
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
%%�����Ϸ��ƶ�
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
%%�����Ϸ��ƶ�
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
imshow(uint8(imgn));imwrite(uint8(imgn),'ƽ��.bmp','bmp') ;  
title('ƽ��');