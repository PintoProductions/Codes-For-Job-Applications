function [ y, x ] = find_better_loc_rand( A, type, n, p, norm )
%Finds a random empty location where the number is happy qua type.
%Note: norm is not used, but is necessary for Schelling syntax.
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
    i = randi((sum(size(v,2))/2),1,1);
    y = v(2*i-1);
    x = v(2*i);
end
end