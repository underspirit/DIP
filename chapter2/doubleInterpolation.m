function out = doubleInterpolation(a,r,c)
%DOUBLEINTERPOLATION ����˫�����ڲ��㷨��һ��ָ��ͼ��������Ų���
%doubleInterpolation(a,r,c):
%aΪͼ������ؾ���,rΪĿ��ͼ�������,cΪ����

    [m,n] = size(a);
    tr = m/r; tc = n/c;
    out = uint8(zeros(r,c));
    Q11 = struct('x',0,'y',0);
    Q21 = struct('x',0,'y',0);
    Q12 = struct('x',0,'y',0);
    Q22 = struct('x',0,'y',0);
    fx1 = 0; fx2 = 0; f = 0;
    for i = 1:r
        for j = 1:c
            x = i*tr; y = j*tc; %��Ŀ��ͼ���ÿһ������,�������������ԭͼ��������ص�,��ʱx,yֵ������С��
            if(i == 1)
                x = 1;
            elseif(i == r)
                x = m;
            end
            if(j == 1)
                y = 1;
            elseif(j == c)
                y = n;
            end
            %�����Χ(x,y)���ĸ��������
            Q11.x = floor(x); Q11.y = floor(y);
            Q21.x = ceil(x); Q21.y = floor(y);
            Q12.x = floor(x); Q12.y = ceil(y);
            Q22.x = ceil(x); Q22.y = ceil(y);
            Q22.x = ceil(x); Q22.y = ceil(y);

            
            %���еķ���(x�᷽��)�����������Բ�ֵ
            fx1 = a(Q11.x,Q11.y)*(Q21.x - x)/(Q21.x - Q11.x) + a(Q21.x,Q21.y)*(x - Q11.x)/(Q21.x - Q11.x);
            fx2 = a(Q12.x,Q12.y)*(Q21.x - x)/(Q21.x - Q11.x) + a(Q22.x,Q22.y)*(x - Q11.x)/(Q21.x - Q11.x);
            %���еķ����ϲ�ֵ
            f = fx1*(Q22.y - y)/(Q22.y - Q11.y) + fx2*(y - Q11.y)/(Q21.y - Q11.y);
            out(i,j) = uint8(f);
        end
    end
end