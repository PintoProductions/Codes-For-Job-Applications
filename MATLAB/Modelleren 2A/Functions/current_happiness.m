function q = current_happiness( A, type, n )
%Returns the current happiness ratio of the number at its location.
w = find_neighbors(A, n);
tp = is_type(type, n);
teller = 0;
for i = w;
    if is_type(type, i) == tp;
        teller = teller + 1;
    end
end
[y, x] = find_loc(A, n);
noemer = size((find_area(A,y,x)),2);
q = teller/noemer;
end

