
function out = changeGrayScale(a,p)
   [m, n] = size(a);
   q = uint8(256/p);
   for i = 1:m
       for j = 1:n
           for k = 0:q
               if(a(i,j) > k*q && a(i,j) <(k+1)*q)
                   a(i,j) = k*q;
                   break;
               end
           end
       end
   end
   out = a;
end