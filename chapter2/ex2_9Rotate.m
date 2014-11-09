%                       图像旋转MATLAB代码实现
% 插值时采用了最近点法和双线性插值，结果与imrotate函数进行了比较。

%实现Imrotate函数.
 
clc;clear all;close all;
 
Img=imread('Fig0222(b)(cameraman).tif');
 
Img=double(Img);
 
[h w]=size(Img);
 
alpha=pi/4;         %逆时针旋转的角度
 
wnew=w*cos(alpha)+h*sin(alpha);   %新图像的宽width
 
hnew=w*sin(alpha)+h*cos(alpha);   %新图像的高heighth
 
wnew=ceil(wnew);   %取整
 
hnew=ceil(hnew);
 
u0=w*sin(alpha);   %平移量 ???????????
 
T=[cos(alpha),sin(alpha);-sin(alpha),cos(alpha)];   %变换矩阵
 
Imgnew2=zeros(hnew,wnew);Imgnew1=zeros(hnew,wnew);
 
for u=1:hnew     %u和v是新图像坐标，变换到原图像坐标x和y中。
  
    for v=1:wnew
        
        tem=T * ([u;v] - [u0;0]); %???????????
        
        x=tem(1);
        
        y=tem(2);
        
        if x>=1&x<=h&y>=1&y<=w    %若变换出的x和y在原图像范围内 

            x_low=floor(x);

            x_up=ceil(x);

            y_low=floor(y);

            y_up=ceil(y);

            if (x-x_low)<=(x_up-x)     %采用最近点法，选取距离最近点的像素赋给新图像

                x=x_low;

            else

                x=x_up;

            end

            if (y-y_low)<=(y_up-y)

                y=y_low;

            else

                y=y_up;

            end

            p1=Img(x_low,y_low);         %双线性插值，p1到p4是（x,y）周围的四个点

            p2=Img(x_up,y_low);

            p3=Img(x_low,y_low);

            p4=Img(x_up,y_up);

            s=x-x_low;

            t=y-y_low;

            Imgnew1(u,v)=Img(x,y);

            Imgnew2(u,v)=(1-s)*(1-t)*p1+(1-s)*t*p3+(1-t)*s*p2+s*t*p4;   

        end
        
    end
    
end
 
imshow(Imgnew1,[]);
 
figure;imshow(Imgnew2,[]);
 
B=imrotate(Img,alpha/pi*180);
 
figure;imshow(B,[]);

