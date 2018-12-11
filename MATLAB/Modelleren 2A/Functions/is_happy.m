function e = is_happy( A, type, n, p )
%Checks if a certain number is happy in relation to types.
w = find_neighbors(A, n);
tp = is_type(type, n);
teller = 0;
if size(p, 1) > 1;
    p = p(tp);
end
for i = w;
    if is_type(type, i) == tp;
        teller = teller + 1;
    end
end
[y, x] = find_loc(A, n);
noemer = size((find_area(A,y,x)),2);
e = (teller/noemer >= p);
end