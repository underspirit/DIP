%                       ͼ����תMATLAB����ʵ��
% ��ֵʱ����������㷨��˫���Բ�ֵ�������imrotate���������˱Ƚϡ�

%ʵ��Imrotate����.
 
clc;clear all;close all;
 
Img=imread('Fig0222(b)(cameraman).tif');
 
Img=double(Img);
 
[h w]=size(Img);
 
alpha=pi/4;         %��ʱ����ת�ĽǶ�
 
wnew=w*cos(alpha)+h*sin(alpha);   %��ͼ��Ŀ�width
 
hnew=w*sin(alpha)+h*cos(alpha);   %��ͼ��ĸ�heighth
 
wnew=ceil(wnew);   %ȡ��
 
hnew=ceil(hnew);
 
u0=w*sin(alpha);   %ƽ���� ???????????
 
T=[cos(alpha),sin(alpha);-sin(alpha),cos(alpha)];   %�任����
 
Imgnew2=zeros(hnew,wnew);Imgnew1=zeros(hnew,wnew);
 
for u=1:hnew     %u��v����ͼ�����꣬�任��ԭͼ������x��y�С�
  
    for v=1:wnew
        
        tem=T * ([u;v] - [u0;0]); %???????????
        
        x=tem(1);
        
        y=tem(2);
        
        if x>=1&x<=h&y>=1&y<=w    %���任����x��y��ԭͼ��Χ�� 

            x_low=floor(x);

            x_up=ceil(x);

            y_low=floor(y);

            y_up=ceil(y);

            if (x-x_low)<=(x_up-x)     %��������㷨��ѡȡ�������������ظ�����ͼ��

                x=x_low;

            else

                x=x_up;

            end

            if (y-y_low)<=(y_up-y)

                y=y_low;

            else

                y=y_up;

            end

            p1=Img(x_low,y_low);         %˫���Բ�ֵ��p1��p4�ǣ�x,y����Χ���ĸ���

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

