a = imread('Fig0227(a)(washington_infrared).tif');
%�����Ч������0
b = bitset(a,1,0);
figure;title('a');imshow(a);
figure;title('b');imshow(b);
% a - b
c = a - uint8(b);
figure;title('c');imshow(c,[]);%�궨ͼ��0,255