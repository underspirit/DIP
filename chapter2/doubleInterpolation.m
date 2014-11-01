function out = doubleInterpolation(a,r,c)
    [m,n] = size(a);
    tr = m/r; tc = n/c;
    out = uint8(zeros(r,c));
    for i = 1:r
        for j = 1:c
            x = ceil(i*tr); y = ceil(j*tc);
            out(i,j) = a(x,y);
        end
    end
end