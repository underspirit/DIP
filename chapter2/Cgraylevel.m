function out = Cgraylevel(I,n)
% 使用矩阵运算进行灰度级变换
%tic;
t0 = cputime;
figure;subplot(1,2,1);imshow(I);title('original');
        for k=1:n
            f1 = I >=(k-1)*256/n;
            f2 = I <=k*256/n;
            f3 = f1 & f2;
            f4 = ~f3;
            f3 = f3 * (k-1)*256/n;
            I = uint8(f4) .* I;
            I = I + uint8(f3);
        end
%toc;
t1=cputime-t0
out = I;
subplot(1,2,2);imshow(I);title(n);

