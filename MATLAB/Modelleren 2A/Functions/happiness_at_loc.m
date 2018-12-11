function q = happiness_at_loc( A, type, n, y, x )
%Return the happiness of a number at a certain location.
w = find_neighbors(A, [y, x]);
[y, x] = find_loc(A, n);
noemer = size((find_area(A,y,x)),2);
tp = is_type(type, n);
teller = 0;
for i = w;
    if is_type(type, i) == tp && i~=n;
        teller = teller + 1;
    end
end
q = teller/noemer;
end

