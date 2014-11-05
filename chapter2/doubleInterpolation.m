function out = doubleInterpolation(a,r,c)
%DOUBLEINTERPOLATION 利用双线性内插算法对一个指定图像进行缩放操作
%doubleInterpolation(a,r,c):
%a为图像的像素矩阵,r为目标图像的行数,c为列数

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
            x = i*tr; y = j*tc; %对目标图像的每一个像素,按比例缩放求出原图对象的像素点,此时x,y值可能是小数
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
            %求出包围(x,y)的四个点的坐标
            Q11.x = floor(x); Q11.y = floor(y);
            Q21.x = ceil(x); Q21.y = floor(y);
            Q12.x = floor(x); Q12.y = ceil(y);
            Q22.x = ceil(x); Q22.y = ceil(y);
            Q22.x = ceil(x); Q22.y = ceil(y);

            
            %在行的方向(x轴方向)进行两次线性插值
            fx1 = a(Q11.x,Q11.y)*(Q21.x - x)/(Q21.x - Q11.x) + a(Q21.x,Q21.y)*(x - Q11.x)/(Q21.x - Q11.x);
            fx2 = a(Q12.x,Q12.y)*(Q21.x - x)/(Q21.x - Q11.x) + a(Q22.x,Q22.y)*(x - Q11.x)/(Q21.x - Q11.x);
            %在列的方向上插值
            f = fx1*(Q22.y - y)/(Q22.y - Q11.y) + fx2*(y - Q11.y)/(Q21.y - Q11.y);
            out(i,j) = uint8(f);
        end
    end
end