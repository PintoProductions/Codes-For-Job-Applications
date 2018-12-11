function [ y, x ] = find_better_loc( A, type, n, p, norm )
%Finds a closest empty location where the number is happy qua type.
[h, w] = size(A);
v = [];
for i = 1:h;
    for j = 1:w;
        if A(i,j) == 0;
            hap = happiness_at_loc(A, type, n, i, j);
            if hap > p;
                v = [v ,[i,j]];
            end
        end
    end
end
if sum(size(v)) == 0;
    y = 0;
    x = 0;
else
    [l1, l2] = find_loc(A, n);
    l = numel(A);
    for i = 1:(sum(size(v,2))/2);
        b = v(2*i-1);
        a = v(2*i);
        dist = norm([l1, l2],[b, a]);
        if dist < l;
            l = dist;
            y = b;
            x = a;
        end
    end
end
end