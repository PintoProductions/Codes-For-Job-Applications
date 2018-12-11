function [ i, j ] = find_loc( A, n )
%Finds the location of a certain number.
[h, w] = size(A);
for i = 1:h;
    for j = 1:w;
        if A(i,j) == n;
            return;
        end
    end
end
end