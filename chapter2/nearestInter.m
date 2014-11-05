function out = nearestInter(a,r,c)
%   �������ڽ��㷨��һ��ָ��ͼ��������Ų���
%   nearestInterpolation(a,r,c):
%   aΪͼ������ؾ���,rΪĿ��ͼ�������,cΪ����
    [m,n] = size(a);    
    tr = m/r; tc = n/c; %�����к��е����ű���
    out = uint8(zeros(r,c));
    for i = 1:r
        for j = 1:c
            x = ceil(i*tr); y = ceil(j*tc); %��Ŀ��ͼ���ÿһ������,�������������ԭͼ��������ص�,ʹ��ceil����ȡ��,��Ϊx,y����Ϊ0.x
            out(i,j) = a(x,y);  %��ԭͼ�õ�����ֵ����Ŀ�����ص�
        end
    end
end