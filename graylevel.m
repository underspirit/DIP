function out = graylevel(I,n);
%tic;
t0 = cputime;
[c r] = size(I);
subplot(1,2,1);imshow(I);title('original');
for i=1:c;  %��������ÿһ��Ԫ��
    for j=1:r;
        for k=1:n
            if (I(i,j)>=(k-1)*256/n && I(i,j)<=k*256/n)  %�жϸ����������ķ�Χ
                I(i,j)=(k-1)*256/n;
                break;  %�ҵ��÷�Χ������ѭ��
            end
        end
    end
end
t1 = cputime - t0
%toc;
out = I;
subplot(1,2,2);imshow(I);title(n);

