function [A, d] = move_to( A, n, y, x, norm )
%Moves a certain number to a certain location.
[i, j] = find_loc(A, n);
A(y, x) = n;
A(i,j) = 0;
d = norm([i,j],[y,x]);
end